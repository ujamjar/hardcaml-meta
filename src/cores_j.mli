(* Auto-generated from "cores.atd" *)


type vpi = Cores_t.vpi = {
  src_files: string list;
  include_files: string list;
  libs: string list
}

type verilator = Cores_t.verilator = {
  source_type: string;
  include_files: string list;
  src_files: string list;
  libs: string list
}

type simulator = Cores_t.simulator

type opencores_provider = Cores_t.opencores_provider = {
  repo_name: string;
  repo_root: string;
  revision: int
}

type github_provider = Cores_t.github_provider = {
  user: string;
  repo: string;
  version: string option
}

type provider = Cores_t.provider

type plus_arg_type = Cores_t.plus_arg_type

type plus_arg = Cores_t.plus_arg = {
  name: string;
  arg_type: plus_arg_type;
  description: string
}

type modelsim = Cores_t.modelsim = {
  depend: string list;
  vsim_options: string list;
  vlog_options: string list
}

type icarus = Cores_t.icarus = { depend: string list }

type hdl_files = Cores_t.hdl_files = {
  include_files: string list;
  src_files: string list;
  tb_private_src_files: string list;
  tb_src_files: string list;
  tb_include_files: string list
}

type core = Cores_t.core = {
  core_name: string;
  version: string;
  description: string;
  depends: string list;
  install_path: string option;
  patches: string list option;
  verilog_files: hdl_files option;
  vhdl_files: hdl_files option;
  testbench: string option;
  provider: provider;
  supported_simulators: simulator list option;
  modelsim: modelsim option;
  icarus: icarus option;
  plusargs: plus_arg list option;
  vpi: vpi option;
  verilator: verilator option;
  pre_build_scripts: string list option
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

val write_opencores_provider :
  Bi_outbuf.t -> opencores_provider -> unit
  (** Output a JSON value of type {!opencores_provider}. *)

val string_of_opencores_provider :
  ?len:int -> opencores_provider -> string
  (** Serialize a value of type {!opencores_provider}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_opencores_provider :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> opencores_provider
  (** Input JSON data of type {!opencores_provider}. *)

val opencores_provider_of_string :
  string -> opencores_provider
  (** Deserialize JSON data of type {!opencores_provider}. *)

val write_github_provider :
  Bi_outbuf.t -> github_provider -> unit
  (** Output a JSON value of type {!github_provider}. *)

val string_of_github_provider :
  ?len:int -> github_provider -> string
  (** Serialize a value of type {!github_provider}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_github_provider :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> github_provider
  (** Input JSON data of type {!github_provider}. *)

val github_provider_of_string :
  string -> github_provider
  (** Deserialize JSON data of type {!github_provider}. *)

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

val write_plus_arg_type :
  Bi_outbuf.t -> plus_arg_type -> unit
  (** Output a JSON value of type {!plus_arg_type}. *)

val string_of_plus_arg_type :
  ?len:int -> plus_arg_type -> string
  (** Serialize a value of type {!plus_arg_type}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_plus_arg_type :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> plus_arg_type
  (** Input JSON data of type {!plus_arg_type}. *)

val plus_arg_type_of_string :
  string -> plus_arg_type
  (** Deserialize JSON data of type {!plus_arg_type}. *)

val write_plus_arg :
  Bi_outbuf.t -> plus_arg -> unit
  (** Output a JSON value of type {!plus_arg}. *)

val string_of_plus_arg :
  ?len:int -> plus_arg -> string
  (** Serialize a value of type {!plus_arg}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_plus_arg :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> plus_arg
  (** Input JSON data of type {!plus_arg}. *)

val plus_arg_of_string :
  string -> plus_arg
  (** Deserialize JSON data of type {!plus_arg}. *)

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

val write_hdl_files :
  Bi_outbuf.t -> hdl_files -> unit
  (** Output a JSON value of type {!hdl_files}. *)

val string_of_hdl_files :
  ?len:int -> hdl_files -> string
  (** Serialize a value of type {!hdl_files}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_hdl_files :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> hdl_files
  (** Input JSON data of type {!hdl_files}. *)

val hdl_files_of_string :
  string -> hdl_files
  (** Deserialize JSON data of type {!hdl_files}. *)

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

