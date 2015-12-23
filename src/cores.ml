open Cores_t
open Printf

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

