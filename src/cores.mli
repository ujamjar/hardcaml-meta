(* utility functions for working with core.json files *)

open Cores_t

val load_core : string -> core

val get_provider_string : core -> string option

val get_verilog_include_dirs : core -> string list

val all_cores : string -> string list
