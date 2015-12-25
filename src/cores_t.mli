(* Auto-generated from "cores.atd" *)


type vpi = {
  src_files: string list;
  include_files: string list;
  libs: string list
}

type verilator = {
  source_type: string;
  include_files: string list;
  src_files: string list;
  libs: string list
}

type simulator = [ `MODELSIM | `ICARUS ]

type opencores_provider = {
  repo_name: string;
  repo_root: string;
  revision: int
}

type github_provider = { user: string; repo: string; version: string option }

type provider = [
    `GITHUB of github_provider
  | `OPENCORES of opencores_provider
  | `SIMPLE_FILE of string
  | `ZIP of string
  | `NO_PROVIDER
]

type plus_arg_type = [ `INT | `BOOL | `STR | `FILE ]

type plus_arg = {
  name: string;
  arg_type: plus_arg_type;
  description: string
}

type modelsim = {
  depend: string list;
  vsim_options: string list;
  vlog_options: string list
}

type icarus = { depend: string list }

type hdl_files = {
  include_files: string list;
  src_files: string list;
  tb_private_src_files: string list;
  tb_src_files: string list;
  tb_include_files: string list
}

type core = {
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
