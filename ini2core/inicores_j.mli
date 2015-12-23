(* Auto-generated from "inicores.atd" *)


type vpi = Inicores_t.vpi = {
  src_files: string list;
  include_files: string list;
  libs: string list
}

type verilog = Inicores_t.verilog = {
  include_files: string list;
  src_files: string list;
  tb_private_src_files: string list;
  tb_src_files: string list;
  tb_include_files: string list
}

type verilator = Inicores_t.verilator = {
  source_type: string;
  include_files: string list;
  src_files: string list;
  libs: string list
}

type simulator = Inicores_t.simulator = { toplevel: string }

type scripts = Inicores_t.scripts = { pre_build_scripts: string list }

type provider = Inicores_t.provider = {
  name: string;
  url: string option;
  filetype: string option;
  user: string option;
  version: string option;
  repo: string option;
  branch: string option;
  repo_root: string option;
  repo_name: string option;
  revision: int option;
  cachable: bool option
}

type modelsim = Inicores_t.modelsim = {
  depend: string list;
  vsim_options: string list;
  vlog_options: string list
}

type main = Inicores_t.main = {
  description: string;
  simulators: string list;
  depend: string list;
  patches: string list
}

type icarus = Inicores_t.icarus = { depend: string list }

type dyn = Yojson.Safe.json

type core = Inicores_t.core = {
  core_file: string;
  main: main;
  verilog: verilog option;
  provider: provider option;
  simulator: simulator option;
  modelsim: modelsim option;
  icarus: icarus option;
  plusargs: dyn option;
  vpi: vpi option;
  verilator: verilator option;
  scripts: scripts option
}

val write_vpi :
  Bi_outbuf.t -> vpi -> unit
  (** Output a JSON value of type {!vpi}. *)

val string_of_vpi :
  ?len:int -> vpi -> string
  (** Serialize a value of type {!vpi}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_vpi :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> vpi
  (** Input JSON data of type {!vpi}. *)

val vpi_of_string :
  string -> vpi
  (** Deserialize JSON data of type {!vpi}. *)

val write_verilog :
  Bi_outbuf.t -> verilog -> unit
  (** Output a JSON value of type {!verilog}. *)

val string_of_verilog :
  ?len:int -> verilog -> string
  (** Serialize a value of type {!verilog}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_verilog :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> verilog
  (** Input JSON data of type {!verilog}. *)

val verilog_of_string :
  string -> verilog
  (** Deserialize JSON data of type {!verilog}. *)

val write_verilator :
  Bi_outbuf.t -> verilator -> unit
  (** Output a JSON value of type {!verilator}. *)

val string_of_verilator :
  ?len:int -> verilator -> string
  (** Serialize a value of type {!verilator}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_verilator :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> verilator
  (** Input JSON data of type {!verilator}. *)

val verilator_of_string :
  string -> verilator
  (** Deserialize JSON data of type {!verilator}. *)

val write_simulator :
  Bi_outbuf.t -> simulator -> unit
  (** Output a JSON value of type {!simulator}. *)

val string_of_simulator :
  ?len:int -> simulator -> string
  (** Serialize a value of type {!simulator}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_simulator :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> simulator
  (** Input JSON data of type {!simulator}. *)

val simulator_of_string :
  string -> simulator
  (** Deserialize JSON data of type {!simulator}. *)

val write_scripts :
  Bi_outbuf.t -> scripts -> unit
  (** Output a JSON value of type {!scripts}. *)

val string_of_scripts :
  ?len:int -> scripts -> string
  (** Serialize a value of type {!scripts}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_scripts :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> scripts
  (** Input JSON data of type {!scripts}. *)

val scripts_of_string :
  string -> scripts
  (** Deserialize JSON data of type {!scripts}. *)

val write_provider :
  Bi_outbuf.t -> provider -> unit
  (** Output a JSON value of type {!provider}. *)

val string_of_provider :
  ?len:int -> provider -> string
  (** Serialize a value of type {!provider}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_provider :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> provider
  (** Input JSON data of type {!provider}. *)

val provider_of_string :
  string -> provider
  (** Deserialize JSON data of type {!provider}. *)

val write_modelsim :
  Bi_outbuf.t -> modelsim -> unit
  (** Output a JSON value of type {!modelsim}. *)

val string_of_modelsim :
  ?len:int -> modelsim -> string
  (** Serialize a value of type {!modelsim}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_modelsim :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> modelsim
  (** Input JSON data of type {!modelsim}. *)

val modelsim_of_string :
  string -> modelsim
  (** Deserialize JSON data of type {!modelsim}. *)

val write_main :
  Bi_outbuf.t -> main -> unit
  (** Output a JSON value of type {!main}. *)

val string_of_main :
  ?len:int -> main -> string
  (** Serialize a value of type {!main}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_main :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> main
  (** Input JSON data of type {!main}. *)

val main_of_string :
  string -> main
  (** Deserialize JSON data of type {!main}. *)

val write_icarus :
  Bi_outbuf.t -> icarus -> unit
  (** Output a JSON value of type {!icarus}. *)

val string_of_icarus :
  ?len:int -> icarus -> string
  (** Serialize a value of type {!icarus}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_icarus :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> icarus
  (** Input JSON data of type {!icarus}. *)

val icarus_of_string :
  string -> icarus
  (** Deserialize JSON data of type {!icarus}. *)

val write_dyn :
  Bi_outbuf.t -> dyn -> unit
  (** Output a JSON value of type {!dyn}. *)

val string_of_dyn :
  ?len:int -> dyn -> string
  (** Serialize a value of type {!dyn}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dyn :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dyn
  (** Input JSON data of type {!dyn}. *)

val dyn_of_string :
  string -> dyn
  (** Deserialize JSON data of type {!dyn}. *)

val write_core :
  Bi_outbuf.t -> core -> unit
  (** Output a JSON value of type {!core}. *)

val string_of_core :
  ?len:int -> core -> string
  (** Serialize a value of type {!core}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core
  (** Input JSON data of type {!core}. *)

val core_of_string :
  string -> core
  (** Deserialize JSON data of type {!core}. *)

