open Printf

module Ic = struct

  (* functions which work over the inicore representation *)

  let read_core chan = 
    let st = Yojson.init_lexer () in
    let lex = Lexing.from_channel chan in
    (fun () -> Inicores_j.read_core st lex)

  let read_core = read_core stdin

  let rec read_all () = 
    match read_core () with
    | json -> json :: read_all ()
    | exception _ -> []

  type repo = 
    | Github of string
    | Opencores of int * string
    | Simple of string
    | Zip of string
    | No_provider
    | Unknown_provider
    | Bad_url of string 

  let get_repo p = 
    let open Inicores_t in
    match p with
    | None -> No_provider
    | Some(p) -> begin
      match p.name with
      | "github" -> begin
        let url user repo version = 
          Github("https://github.com/" ^ user ^ "/" ^ repo ^ "/archive/" ^ version ^ ".tar.gz") 
        in
        match p.user, p.repo, p.version with (* p.branch? *)
        | Some(user), Some(repo), None -> url user repo "master"
        | Some(user), Some(repo), Some(version) -> url user repo version
        | _ -> Bad_url "github"
      end
      | "opencores" -> begin
        match p.repo_name, p.repo_root, p.revision with
        | Some(repo_name), Some(repo_root), Some(revision) ->
          Opencores(revision, 
            "http://opencores.org/ocsvn/" ^ repo_name ^ "/" ^ repo_name ^ "/" ^ repo_root)
        | _ -> Bad_url "opencores"
      end
      | "url" -> begin
        match p.filetype, p.url with
        | None, _ | _, None -> Bad_url("url")
        | Some(typ), Some(url) -> begin
          match typ with
          | "simple" -> Simple(url)
          | "zip" -> Zip(url)
          | _ -> Bad_url("url")
        end
      end
      | _ -> Unknown_provider
    end

  let get_repo_string x = 
    match get_repo x.Inicores_t.provider with 
    | Github(url) -> url
    | Opencores(rev,url) -> "-r " ^ string_of_int rev ^ " " ^ url
    | Simple(url) -> url
    | Zip(url) -> url
    | No_provider -> "no provider specified" 
    | Bad_url(x) -> failwith("bad url with provider " ^ x)
    | Unknown_provider -> failwith("unknown provider")
  
  let get_name core = 
    Filename.(chop_suffix (basename core.Inicores_t.core_file) ".core") 

  let get_dir core = Filename.basename core.Inicores_t.core_file

end

let unquote str = 
  let len = String.length str in
  try
    let st = if str.[0] = '"' then 1 else 0 in
    let ed = if str.[len-1] = '"' then len-2 else len-1 in
    String.sub str st (ed-st+1)
  with _ -> str

(* main conversion function *)
let core_of_ini c = 
  let optl x = if x=[] then None else Some(x) in
  let core_name = Ic.get_name c in
  (* parse the repository provider *)
  let provider = 
    let open Inicores_t in
    let bad_url s = failwith ("bad_url " ^ s) in
    match c.provider with
    | None -> `NO_PROVIDER
    | Some(p) -> begin
      match p.name with
      | "github" -> begin
        let url user repo version = Cores_t.(`GITHUB({user; repo; version})) in
        match p.user, p.repo, p.version with (* p.branch? *)
        | Some(user), Some(repo), version -> url user repo version
        | _ -> bad_url "github"
      end
      | "opencores" -> begin
        match p.repo_name, p.repo_root, p.revision with
        | Some(repo_name), Some(repo_root), Some(revision) ->
          Cores_t.(`OPENCORES({ repo_name; repo_root; revision }))
        | _ -> bad_url "opencores"
      end
      | "url" -> begin
        match p.filetype, p.url with
        | None, _ | _, None -> bad_url("url")
        | Some(typ), Some(url) -> begin
          match typ with
          | "simple" -> `SIMPLE_FILE(url)
          | "zip" -> `ZIP(url)
          | _ -> bad_url("url")
        end
      end
      | _ -> failwith "unknown provider"
    end
  in

  let vlog_files = function
    | None -> None
    | Some(files : Inicores_t.verilog) -> begin
      Some Cores_t.({
        include_files = Inicores_t.(files.include_files);
        src_files = Inicores_t.(files.src_files);
        tb_private_src_files = Inicores_t.(files.tb_private_src_files);
        tb_src_files = Inicores_t.(files.tb_src_files);
        tb_include_files = Inicores_t.(files.tb_include_files);
      })
    end
  in

  let supported_simulators = 
    match Inicores_t.(c.main.simulators) with
    | [] -> None
    | _ as x -> Some(List.map (function "icarus" -> `ICARUS 
                                      | "modelsim" -> `MODELSIM
                                      | _ as x -> failwith ("unknown simulator " ^ x)) x) 
  in
  let modelsim =
    let open Inicores_t in
    match c.modelsim with 
    | None -> None
    | Some(c) -> 
      Some { Cores_t.depend=c.depend; vsim_options=c.vsim_options; vlog_options=c.vlog_options }
  in
  let icarus =
    let open Inicores_t in
    match c.icarus with 
    | None -> None
    | Some(c) -> Some { Cores_t.depend=c.depend }
  in

  let string_list l = 
    match l with 
    | `List l -> 
      List.map (function `String s -> s 
                         | _ -> failwith "expecting a string json type") l
    | _ -> failwith "expecting a string list"
  in

  let plusargs = 
    let open Inicores_t in
    match c.plusargs with
    | None -> None
    | Some(`Assoc c) ->
        let plusarg name (list : string list) =
          let arg_type = 
            match List.hd list with
            | "int" -> `INT
            | "str" -> `STR
            | "bool" -> `BOOL
            | "file" -> `FILE
            | _ -> failwith "unknown plusarg type"
          in
          let description = String.concat " " (List.tl list) in
          { Cores_t.name; arg_type; description }
        in
        Some(List.map (fun (name, l) -> plusarg name (string_list l)) c)
    | _ -> failwith "unknown plusarg dict"
  in

  let vpi = 
    let open Inicores_t in
    match c.vpi with 
    | None -> None
    | Some(c) -> Some { Cores_t.src_files=c.src_files; include_files=c.include_files; libs=c.libs }
  in

  let verilator = 
    let open Inicores_t in
    match c.verilator with 
    | None -> None
    | Some(c) -> Some { Cores_t.source_type=c.source_type; include_files=c.include_files; 
                                src_files=c.src_files; libs=c.libs }
  in

  let pre_build_scripts =
    let open Inicores_t in
    match c.scripts with
    | None -> None
    | Some(c) -> Some(c.pre_build_scripts)
  in

  Cores_t.({
    core_name;
    version = "1.0.0";
    description = Inicores_t.(unquote c.main.description);
    depends = Inicores_t.(c.main.depend);
    patches = optl Inicores_t.(c.main.patches);
    verilog_files = vlog_files Inicores_t.(c.verilog);
    vhdl_files = None; (* no vhdl in opencores?! *)
    testbench = Inicores_t.(match c.simulator with None -> None | Some(t) -> Some(t.toplevel));
    provider = provider;
    supported_simulators;
    modelsim;
    icarus;
    plusargs;
    vpi;
    verilator;
    pre_build_scripts;
  })

(* read all the inicores, convert to the cores form and write as json into
 * the cores directory *)

let cores = Ic.read_all ()
let () = printf "Loaded %i cores\n" (List.length cores)
let () = List.iter 
  (fun core' -> 
    let core = core_of_ini core' in
    let file = open_out ("cores/" ^ core.Cores_j.core_name) in
    let repo = 
      (function None -> "no provider specified" | Some(x) -> x) (Cores.get_provider_string core)
    in
    let () = printf "%.20s %s\n" core.Cores_j.core_name repo in
    let () = fprintf file "%s\n" (Yojson.Basic.prettify (Cores_j.string_of_core core)) in
    let () = close_out file in
    ())
  cores

