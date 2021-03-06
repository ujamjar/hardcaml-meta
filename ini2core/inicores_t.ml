(* Auto-generated from "inicores.atd" *)


type vpi = {
  src_files: string list;
  include_files: string list;
  libs: string list
}

type verilog = {
  include_files: string list;
  src_files: string list;
  tb_private_src_files: string list;
  tb_src_files: string list;
  tb_include_files: string list
}

type verilator = {
  source_type: string;
  include_files: string list;
  src_files: string list;
  libs: string list
}

type simulator = { toplevel: string }

type scripts = { pre_build_scripts: string list }

type provider = {
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

type modelsim = {
  depend: string list;
  vsim_options: string list;
  vlog_options: string list
}

type main = {
  description: string;
  simulators: string list;
  depend: string list;
  patches: string list
}

type icarus = { depend: string list }

type dyn = Yojson.Safe.json

type core = {
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
