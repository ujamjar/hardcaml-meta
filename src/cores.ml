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


