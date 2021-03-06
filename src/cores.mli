(* utility functions for working with core.json files *)

open Cores_t

val load_core : string -> core

val write_core : string -> core -> unit

val get_provider_string : core -> string option

val get_verilog_include_dirs : core -> string list

val all_cores : string -> string list

val yosys_to_json : core -> out_channel -> unit

val opam : core -> out_channel -> unit

