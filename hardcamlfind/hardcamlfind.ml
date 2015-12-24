(* hardcaml find utility *)

(* the commands return this type.  to be extended to control the programs return value *)
type ret = 
  | No_error
  | Error of string

let default_meta_path = "./cores"

let core_file_name path core = Filename.concat path (core ^ ".json") 

open Printf

type copts = { meta_path : string; verb : bool; }

let str = sprintf
let opt_str sv = function None -> "None" | Some v -> str "Some(%s)" (sv v)
let opt_str_str = opt_str (fun s -> s)

let pr_copts oc copts = 
  fprintf oc "meta_path = %s\nverbose = %b\n"
    copts.meta_path copts.verb 

let information copts list = 
  if list then begin
    try 
      let open Cores_t in
      let cores = Cores.all_cores copts.meta_path in
      let print_core core = 
        printf "%s\n" core;
        if copts.verb then begin
          let c = Cores.load_core core in
          printf "  name = %s\n  vers = %s\n  desc = %s\n"
            c.core_name c.version c.description
        end 
      in
      List.iter print_core cores;
      No_error
    with _ -> Error("Couldn't list cores in '" ^ copts.meta_path ^ "'")
  end else begin
    printf "%s\n" copts.meta_path;
    No_error
  end

let query copts package 
  name version descr depends
  vlog_files vlog_include_files vlog_include_dirs
  vhdl_files = 
  let fname = core_file_name copts.meta_path package in
  let px c x = if c && x<>"" then printf "%s\n" x in
  let pl c l = if c && l<>[] then printf "%s\n" (String.concat " " l) in
  try
    let c = Cores.load_core fname in
    let open Cores_t in
    let () = px name c.core_name in
    let () = px version c.version in
    let () = px descr c.description in
    let () = pl depends c.depends in
    let () = match c.verilog_files with None -> () 
      | Some(x) -> pl vlog_files x.src_files 
    in
    let () = match c.verilog_files with | None -> () 
      | Some(x) -> pl vlog_include_files x.include_files 
    in
    let () = pl vlog_include_dirs (Cores.get_verilog_include_dirs c) in
    let () = match c.vhdl_files with None -> () 
      | Some(x) -> pl vhdl_files x.src_files 
    in
    No_error
  with _ -> Error("Core file '" ^ fname ^ "' could not be loaded")

let help copts man_format cmds topic = 
  match topic with
  | None -> `Help (`Pager, None) (* help about the program. *)
  | Some topic ->
      let topics = "topics" :: cmds in
      let conv, _ = Cmdliner.Arg.enum (List.rev_map (fun s -> (s, s)) topics) in
      match conv topic with
      | `Error e -> `Error (false, e)
      | `Ok t when t = "topics" -> List.iter print_endline topics; `Ok No_error
      | `Ok t when List.mem t cmds -> `Help (man_format, Some t)
      | `Ok t ->
          let page = (topic, 7, "", "", ""), [`S topic; `P "Say something";] in
          let () = Cmdliner.Manpage.print man_format Format.std_formatter page in
          `Ok No_error

open Cmdliner;;

(* Help sections common to all commands *)

let copts_sect = "COMMON OPTIONS"
let help_secs = [
 `S copts_sect;
 `P "These options are common to all commands.";
 `S "MORE HELP";
 `P "Use `$(mname) $(i,COMMAND) --help' for help on a single command.";`Noblank;
 `S "BUGS"; `P "Check bug reports at http://www.github.com/ujamjar/hardcaml-meta/issues.";]

(* Options common to all commands *)

let copts meta_path verb = { meta_path; verb }
let copts_t =
  let docs = copts_sect in
  let verb =
    let doc = "Give verbose output." in
    Arg.(value & flag & info ["v";"verbose"] ~docs ~doc)
  in
  let meta_path =
    let doc = "PATH to metadata files." in
    Arg.(value & opt string default_meta_path & info ["meta-path"] ~docs ~doc ~docv:"PATH")
  in
  Term.(const copts $ meta_path $ verb)

(* Commands *)

let information_cmd =
  let lister =
    let doc = "list all available packages" in
    Arg.(value & flag & info ["list"] ~doc)
  in
  let doc = "show environment information" in
  let man = [
    `S "DESCRIPTION";
    `P "displays information about the environment and packages"] @ help_secs
  in
  Term.(const information $ copts_t $ lister),
  Term.info "info" ~sdocs:copts_sect ~doc ~man

let query_cmd =
  let flag arg doc = Arg.(value & flag & info [arg] ~doc) in

  let cname = flag "name" "Core name" in 
  let version = flag "version" "Core version" in
  let descr = flag "description" "Core description" in
  let depends = flag "depends" "Core dependancies" in

  let vlog_files = flag "verilog" "List of Verilog source files" in
  let vlog_include_files = flag "verilog-include-files" "List of Verilog include files" in
  let vlog_include_dirs = flag "verilog-include-dirs" "List of Verilog include directories" in
  let vhdl_files = flag "vhdl" "List of VHDL source files" in

  let package = 
    let doc = "The package to query." in
    Arg.(required & pos 0 (some string) None & info [] ~docv:"PACKAGE" ~doc)
  in
  let doc = "query metadata" in
  let man =
    [`S "DESCRIPTION";
     `P "Query a package for metadata"] @ help_secs
  in
  Term.(const query $ copts_t $ package $
    cname $ version $ descr $ depends $ 
    vlog_files $ vlog_include_files $ vlog_include_dirs $ 
    vhdl_files 
  ),
  Term.info "query" ~doc ~sdocs:copts_sect ~man

let help_cmd =
  let topic =
    let doc = "The topic to get help on. `topics' lists the topics." in
    Arg.(value & pos 0 (some string) None & info [] ~docv:"TOPIC" ~doc)
  in
  let doc = "display help about hardcamlfind and hardcamlfind commands" in
  let man =
    [`S "DESCRIPTION";
     `P "Prints help about hardcamlfind commands"] @ help_secs
  in
  Term.(ret (const help $ copts_t $ Term.man_format $ Term.choice_names $topic)),
  Term.info "help" ~doc ~man

let default_cmd =
  let doc = "metadata menagement for RTL projects" in
  let man = help_secs in
  Term.(ret (const (fun _ -> `Help (`Pager, None)) $ copts_t)),
  Term.info "hardcamlfind" ~version:"0.1.0" ~sdocs:copts_sect ~doc ~man

let cmds = [information_cmd; query_cmd; help_cmd]

let () = 
  match Term.eval_choice default_cmd cmds with
  | `Error _ -> exit 1 
  | `Help | `Version -> exit 0
  | `Ok No_error -> exit 0
  | `Ok (Error e) -> fprintf stderr "%s\n" e; exit 1

