open Cores_t
open Printf

module SSet = Set.Make(String)

let load_core fname = 
  let file = open_in fname in
  let json = 
    let st = Yojson.init_lexer () in
    let lex = Lexing.from_channel file in
    Cores_j.read_core st lex
  in
  let () = close_in file in
  json

let write_core fname core = 
  let file = open_out fname in
  output_string file (Cores_j.string_of_core core);
  close_out file

let get_provider_string core =
  match core.provider with
  | `GITHUB gh -> begin
      let url gh version = 
        Some("https://github.com/" ^ gh.user ^ "/" ^ gh.repo ^ "/archive/" ^ version ^ ".tar.gz") 
      in
      match gh.version with 
      | None -> url gh "master"
      | Some(version) -> url gh version
  end
  | `OPENCORES oc -> 
    Some("-r " ^ string_of_int oc.revision ^ " " ^
         "http://opencores.org/ocsvn/" ^ oc.repo_name ^ "/" ^ oc.repo_name ^ "/" ^ oc.repo_root)
  | `SIMPLE_FILE url -> Some url
  | `ZIP url -> Some url
  | `NO_PROVIDER -> None

let get_verilog_include_dirs core = 
  match core.verilog_files with
  | None -> []
  | Some x ->
    SSet.elements @@ 
    List.fold_right (fun x -> SSet.add (Filename.dirname x)) x.include_files SSet.empty

let all_cores path = 
  let all_files = List.map (Filename.concat path) @@ Array.to_list @@ Sys.readdir path in
  let json_files = List.filter (fun file -> 
    Filename.check_suffix file "json" &&
    not (Sys.is_directory file)) all_files
  in
  json_files

let yosys_to_json core fout =
  let open Printf in
  let core_path = "install_dir" in (* this should be stored in the metadata *)
  let opt x f = match x with None -> () | Some x -> f x in
  let include_dirs = List.map (Filename.concat core_path) (get_verilog_include_dirs core) in
  let () = List.iter (fun path -> fprintf fout "verilog_defaults -add -I%s\n" path) include_dirs in
  let () = opt core.verilog_files
    (fun x -> List.iter (fun file -> 
      fprintf fout "read_verilog %s\n" (Filename.concat core_path file)) x.src_files) 
  in
  (* XXX really want -top <name> *)
  let () = fprintf fout "hierarchy; proc; memory; tribuf; flatten; opt; clean\n" in
  let () = fprintf fout "write_json %s.json\n" core.core_name in
  ()

let opam core fout = 
  let open Printf in
  fprintf fout "opam-version: \"1.2\"\n";
  fprintf fout "version: \"%s\"\n" core.version;
  let author = "\"Mr Unknown <noone@nowhere.org>\"" in
  fprintf fout "author: %s\n" author;
  fprintf fout "maintainer: %s\n" author;
  let url = "\"https://nowhere.org\"" in
  fprintf fout "homepage: %s\n" url;
  fprintf fout "dev-repo: %s\n" url;
  fprintf fout "bug-reports: %s\n" url;
  fprintf fout "depends: [\n";
  List.iter (fprintf fout "  \"%s\"\n") core.depends;
  fprintf fout "]\n";
  ()


