(* hardcaml find utility *)

(* the commands return this type.  to be extended to control the programs return value *)
type ret = 
  | No_error
  | Error of string

let default_meta_path = "./cores"

let core_file_name path core = Filename.concat path (core ^ ".json") 

open Printf

type copts = { meta_path : string; verb : bool; }

let str = sprintf
let opt_str sv = function None -> "None" | Some v -> str "Some(%s)" (sv v)
let opt_str_str = opt_str (fun s -> s)

let pr_copts oc copts = 
  fprintf oc "meta_path = %s\nverbose = %b\n"
    copts.meta_path copts.verb 

let information copts list = 
  if list then begin
    try 
      let open Cores_t in
      let cores = Cores.all_cores copts.meta_path in
      let print_core core = 
        printf "%s\n" core;
        if copts.verb then begin
          let c = Cores.load_core core in
          printf "  name = %s\n  vers = %s\n  desc = %s\n"
            c.core_name c.version c.description
        end 
      in
      List.iter print_core cores;
      No_error
    with _ -> Error("Couldn't list cores in '" ^ copts.meta_path ^ "'")
  end else begin
    printf "%s\n" copts.meta_path;
    No_error
  end

let query_opts = 
  let open Cores_t in
  let px x = if x<>"" then printf "%s\n" x in
  let pl l = if l<>[] then printf "%s\n" (String.concat " " l) in
  let opt x f = match x with None -> () | Some(x) -> f x in
  let supp_sim = function `MODELSIM -> "modelsim" | `ICARUS -> "icaruse" in
  [
    `name, ("name", "Core name.", fun core -> px core.core_name);
    `descr, ("description", "Core description.", fun core -> px core.description);
    `version, ("version", "Core version.", fun core -> px core.version);
    `depends, ("depends", "Dependancies.", fun core -> pl core.depends);
    `patches, ("patches", "List of patch files.", fun core -> opt core.patches pl);

    `vlog_src_files, ("verilog-source", "List of verilog source files.", 
      fun core -> opt core.verilog_files (fun v -> pl v.src_files));
    `vlog_include_files, ("verilog-include-files", "List of verilog include files.", 
      fun core -> opt core.verilog_files (fun v -> pl v.include_files));
    `vlog_include_dirs, ("verilog-include-dirs", "Llist of verilog include directories.",
      fun core -> pl (Cores.get_verilog_include_dirs core));

    `vhdl_src_files, ("vhdl-source", "List of VHDL source files.", 
      fun core -> opt core.vhdl_files (fun v -> pl v.src_files));

    (* provider? *)
    
    `testbench, ("testbench", "Testbench file", fun core -> opt core.testbench px);
    `supported_simulators, ("supported-simulators", "List of supported simulators.", 
      fun core -> opt core.supported_simulators (fun x -> pl (List.map supp_sim x)));

    `modelsim_depend, ("modelsim-depend", "?", 
      (fun core -> opt core.modelsim (fun x -> pl x.depend)));
    `modelsim_vsim_opts, ("modelsim-vsim-opts", "?", 
      (fun core -> opt core.modelsim (fun x -> pl x.vsim_options)));
    `modelsim_vlog_opts, ("modelsim-vlog-opts", "?", 
      (fun core -> opt core.modelsim (fun x -> pl x.vlog_options)));

    `icarus_depend, ("icarus-depend", "?", 
      (fun core -> opt core.icarus (fun x -> pl x.depend)));

    (* plus args? *)

    `vpi_src_files, ("vpi-source", "?", 
      fun core -> opt core.vpi (fun x -> pl x.src_files));
    `vpi_include_files, ("vpi-include-files", "?", 
      fun core -> opt core.vpi (fun x -> pl x.include_files));
    `vpi_libs, ("vpi-libs", "?", 
      fun core -> opt core.vpi (fun x -> pl x.libs));

    `verilator_src_type, ("verilator-source-type", "?",
      fun core -> opt core.verilator (fun x -> px x.source_type));
    `verilator_include_files, ("verilator-include-files", "?",
      fun core -> opt core.verilator (fun x -> pl x.include_files));
    `verilator_src_files, ("verilator-source-files", "?",
      fun core -> opt core.verilator (fun x -> pl x.src_files));
    `verilator_libs, ("verilator-libs", "?",
      fun core -> opt core.verilator (fun x -> pl x.libs));

    `pre_build_scripts, ("pre-build-scripts", "List of pre-build scripts", 
      fun core -> opt core.pre_build_scripts pl);
  ]

let query copts package arg = 
  let fname = core_file_name copts.meta_path package in
  match Cores.load_core fname with
  | core ->
    let dump_json core = printf "%s\n" (Yojson.Basic.prettify (Cores_j.string_of_core core)) in
    let (_,_,fn) = try List.assoc arg query_opts with _ -> "","",dump_json in
    let () = fn core in
    No_error
  | exception _ ->
    Error("Core file '" ^ fname ^ "' could not be loaded")

let script_opts = [
  `yosys2json, ("yosys-to-json", "Convert core to json with yosys", Cores.yosys_to_json);
  `opam, ("opam", "Create opam file", Cores.opam);
]

let script copts package fout arg = 
  let fname = core_file_name copts.meta_path package in
  match Cores.load_core fname with
  | core -> begin
    match List.assoc arg script_opts with
    | (_,_,fn) -> begin
      match open_out fout with
      | fout -> fn core fout; close_out fout; No_error
      | exception _ -> Error("Could not open output file")
    end
    | exception Not_found -> Error("No script argument provided")
  end
  | exception _ ->
    Error("Core file '" ^ fname ^ "' could not be loaded")

let help copts man_format cmds topic = 
  match topic with
  | None -> `Help (`Pager, None) (* help about the program. *)
  | Some topic ->
      let topics = "topics" :: cmds in
      let conv, _ = Cmdliner.Arg.enum (List.rev_map (fun s -> (s, s)) topics) in
      match conv topic with
      | `Error e -> `Error (false, e)
      | `Ok t when t = "topics" -> List.iter print_endline topics; `Ok No_error
      | `Ok t when List.mem t cmds -> `Help (man_format, Some t)
      | `Ok t ->
          let page = (topic, 7, "", "", ""), [`S topic; `P "Say something";] in
          let () = Cmdliner.Manpage.print man_format Format.std_formatter page in
          `Ok No_error

open Cmdliner;;

(* Help sections common to all commands *)

let copts_sect = "COMMON OPTIONS"
let help_secs = [
 `S copts_sect;
 `P "These options are common to all commands.";
 `S "MORE HELP";
 `P "Use `$(mname) $(i,COMMAND) --help' for help on a single command.";`Noblank;
 `S "BUGS"; `P "Check bug reports at http://www.github.com/ujamjar/hardcaml-meta/issues.";]

(* Options common to all commands *)

let copts meta_path verb = { meta_path; verb }
let copts_t =
  let docs = copts_sect in
  let verb =
    let doc = "Give verbose output." in
    Arg.(value & flag & info ["v";"verbose"] ~docs ~doc)
  in
  let meta_path =
    let doc = "PATH to metadata files." in
    Arg.(value & opt string default_meta_path & info ["meta-path"] ~docs ~doc ~docv:"PATH")
  in
  Term.(const copts $ meta_path $ verb)

(* Commands *)

let information_cmd =
  let lister =
    let doc = "list all available packages" in
    Arg.(value & flag & info ["list"] ~doc)
  in
  let doc = "show environment information" in
  let man = [
    `S "DESCRIPTION";
    `P "displays information about the environment and packages"] @ help_secs
  in
  Term.(const information $ copts_t $ lister),
  Term.info "info" ~sdocs:copts_sect ~doc ~man

let query_cmd = 
  let package = 
    let doc = "The package to query." in
    Arg.(required & pos 0 (some string) None & info [] ~docv:"PACKAGE" ~doc)
  in
  let flags = 
    Arg.(value & vflag `none 
          (List.map (fun (arg,(cmd,doc,_)) -> arg, info [cmd] ~doc) query_opts) )
  in
  let doc = "query metadata" in
  let man =
    [`S "DESCRIPTION";
     `P "Query a package for metadata"] @ help_secs
  in
  Term.(const query $ copts_t $ package $ flags),
  Term.info "query" ~doc ~sdocs:copts_sect ~man

let help_cmd =
  let topic =
    let doc = "The topic to get help on. `topics' lists the topics." in
    Arg.(value & pos 0 (some string) None & info [] ~docv:"TOPIC" ~doc)
  in
  let doc = "display help about hardcamlfind and hardcamlfind commands" in
  let man =
    [`S "DESCRIPTION";
     `P "Prints help about hardcamlfind commands"] @ help_secs
  in
  Term.(ret (const help $ copts_t $ Term.man_format $ Term.choice_names $topic)),
  Term.info "help" ~doc ~man

let default_cmd =
  let doc = "metadata menagement for RTL projects" in
  let man = help_secs in
  Term.(ret (const (fun _ -> `Help (`Pager, None)) $ copts_t)),
  Term.info "hardcamlfind" ~version:"0.1.0" ~sdocs:copts_sect ~doc ~man

let scripts_cmd = 
  let package = 
    let doc = "The package to generate a script for." in
    Arg.(required & pos 0 (some string) None & info [] ~docv:"PACKAGE" ~doc)
  in
  let fout = 
    let doc = "Output script name" in
    Arg.(required & pos 1 (some string) None & info [] ~docv:"FILENAME" ~doc)
  in
  let flags = 
    Arg.(value & vflag `none 
          (List.map (fun (arg,(cmd,doc,_)) -> arg, info [cmd] ~doc) script_opts) )
  in
  let doc = "script generation" in
  let man = 
    [`S "DESCRIPTION";
     `P "Generate various backend tool scripts"] @ help_secs
  in
  Term.(const script $ copts_t $ package $ fout $ flags),
  Term.info "script" ~doc ~sdocs:copts_sect ~man

let cmds = [information_cmd; query_cmd; scripts_cmd; help_cmd]

let () = 
  match Term.eval_choice default_cmd cmds with
  | `Error _ -> exit 1 
  | `Help | `Version -> exit 0
  | `Ok No_error -> exit 0
  | `Ok (Error e) -> fprintf stderr "%s\n" e; exit 1

