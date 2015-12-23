module Ic : sig
  val read_core : unit -> Inicores_j.core
  val read_all : unit -> Inicores_j.core list
  type repo =
      Github of string
    | Opencores of int * string
    | Simple of string
    | Zip of string
    | No_provider
    | Unknown_provider
    | Bad_url of string
  val get_repo : Inicores_t.provider option -> repo
  val get_name : Inicores_t.core -> string
  val get_dir : Inicores_t.core -> string
end

val unquote : string -> string
val core_of_ini : Inicores_t.core -> Cores_t.core
val cores : Inicores_j.core list

