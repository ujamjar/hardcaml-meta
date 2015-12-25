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

let write__1 = (
  Ag_oj_run.write_list (
    Yojson.Safe.write_string
  )
)
let string_of__1 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__1 ob x;
  Bi_outbuf.contents ob
let read__1 = (
  Ag_oj_run.read_list (
    Ag_oj_run.read_string
  )
)
let _1_of_string s =
  read__1 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_vpi : _ -> vpi -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if x.src_files <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"src_files\":";
      (
        write__1
      )
        ob x.src_files;
    );
    if x.include_files <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"include_files\":";
      (
        write__1
      )
        ob x.include_files;
    );
    if x.libs <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"libs\":";
      (
        write__1
      )
        ob x.libs;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_vpi ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_vpi ob x;
  Bi_outbuf.contents ob
let read_vpi = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_src_files = ref ([]) in
    let field_include_files = ref ([]) in
    let field_libs = ref ([]) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'b' && String.unsafe_get s (pos+3) = 's' then (
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 44, characters 11-97" (String.sub s pos len); -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                  0
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 44, characters 11-97" (String.sub s pos len); -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  1
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 44, characters 11-97" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 44, characters 11-97" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_src_files := (
                (
                  read__1
                ) p lb
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_include_files := (
                (
                  read__1
                ) p lb
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_libs := (
                (
                  read__1
                ) p lb
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'b' && String.unsafe_get s (pos+3) = 's' then (
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 44, characters 11-97" (String.sub s pos len); -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    0
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 44, characters 11-97" (String.sub s pos len); -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    1
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 44, characters 11-97" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 44, characters 11-97" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_src_files := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_include_files := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_libs := (
                  (
                    read__1
                  ) p lb
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            src_files = !field_src_files;
            include_files = !field_include_files;
            libs = !field_libs;
          }
         : vpi)
      )
)
let vpi_of_string s =
  read_vpi (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_verilator : _ -> verilator -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if x.source_type <> "" then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"source_type\":";
      (
        Yojson.Safe.write_string
      )
        ob x.source_type;
    );
    if x.include_files <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"include_files\":";
      (
        write__1
      )
        ob x.include_files;
    );
    if x.src_files <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"src_files\":";
      (
        write__1
      )
        ob x.src_files;
    );
    if x.libs <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"libs\":";
      (
        write__1
      )
        ob x.libs;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_verilator ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_verilator ob x;
  Bi_outbuf.contents ob
let read_verilator = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_source_type = ref ("") in
    let field_include_files = ref ([]) in
    let field_src_files = ref ([]) in
    let field_libs = ref ([]) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'b' && String.unsafe_get s (pos+3) = 's' then (
                  3
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'y' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'e' then (
                  0
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  1
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_source_type := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_include_files := (
                (
                  read__1
                ) p lb
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_src_files := (
                (
                  read__1
                ) p lb
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_libs := (
                (
                  read__1
                ) p lb
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'b' && String.unsafe_get s (pos+3) = 's' then (
                    3
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'y' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'e' then (
                    0
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    1
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 50, characters 17-128" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_source_type := (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_include_files := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_src_files := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_libs := (
                  (
                    read__1
                  ) p lb
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            source_type = !field_source_type;
            include_files = !field_include_files;
            src_files = !field_src_files;
            libs = !field_libs;
          }
         : verilator)
      )
)
let verilator_of_string s =
  read_verilator (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_simulator = (
  fun ob sum ->
    match sum with
      | `MODELSIM -> Bi_outbuf.add_string ob "\"MODELSIM\""
      | `ICARUS -> Bi_outbuf.add_string ob "\"ICARUS\""
)
let string_of_simulator ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_simulator ob x;
  Bi_outbuf.contents ob
let read_simulator = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                match len with
                  | 6 -> (
                      if String.unsafe_get s pos = 'I' && String.unsafe_get s (pos+1) = 'C' && String.unsafe_get s (pos+2) = 'A' && String.unsafe_get s (pos+3) = 'R' && String.unsafe_get s (pos+4) = 'U' && String.unsafe_get s (pos+5) = 'S' then (
                        1
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | 8 -> (
                      if String.unsafe_get s pos = 'M' && String.unsafe_get s (pos+1) = 'O' && String.unsafe_get s (pos+2) = 'D' && String.unsafe_get s (pos+3) = 'E' && String.unsafe_get s (pos+4) = 'L' && String.unsafe_get s (pos+5) = 'S' && String.unsafe_get s (pos+6) = 'I' && String.unsafe_get s (pos+7) = 'M' then (
                        0
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | _ -> (
                      raise (Exit)
                    )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `MODELSIM
            | 1 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ICARUS
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                match len with
                  | 6 -> (
                      if String.unsafe_get s pos = 'I' && String.unsafe_get s (pos+1) = 'C' && String.unsafe_get s (pos+2) = 'A' && String.unsafe_get s (pos+3) = 'R' && String.unsafe_get s (pos+4) = 'U' && String.unsafe_get s (pos+5) = 'S' then (
                        1
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | 8 -> (
                      if String.unsafe_get s pos = 'M' && String.unsafe_get s (pos+1) = 'O' && String.unsafe_get s (pos+2) = 'D' && String.unsafe_get s (pos+3) = 'E' && String.unsafe_get s (pos+4) = 'L' && String.unsafe_get s (pos+5) = 'S' && String.unsafe_get s (pos+6) = 'I' && String.unsafe_get s (pos+7) = 'M' then (
                        0
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | _ -> (
                      raise (Exit)
                    )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              `MODELSIM
            | 1 ->
              `ICARUS
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | _ -> (
                assert false
              )
        )
)
let simulator_of_string s =
  read_simulator (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_opencores_provider : _ -> opencores_provider -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"repo_name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.repo_name;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"repo_root\":";
    (
      Yojson.Safe.write_string
    )
      ob x.repo_root;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"revision\":";
    (
      Yojson.Safe.write_int
    )
      ob x.revision;
    Bi_outbuf.add_char ob '}';
)
let string_of_opencores_provider ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_opencores_provider ob x;
  Bi_outbuf.contents ob
let read_opencores_provider = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_repo_name = ref (Obj.magic 0.0) in
    let field_repo_root = ref (Obj.magic 0.0) in
    let field_revision = ref (Obj.magic 0.0) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 8 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = '_' then (
                  match String.unsafe_get s (pos+5) with
                    | 'n' -> (
                        if String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' then (
                          0
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 't' then (
                          1
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                      )
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_repo_name := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x1;
          | 1 ->
            field_repo_root := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x2;
          | 2 ->
            field_revision := (
              (
                Ag_oj_run.read_int
              ) p lb
            );
            bits0 := !bits0 lor 0x4;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 8 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = '_' then (
                    match String.unsafe_get s (pos+5) with
                      | 'n' -> (
                          if String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' then (
                            0
                          )
                          else (
                            (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                          )
                        )
                      | 'r' -> (
                          if String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 't' then (
                            1
                          )
                          else (
                            (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                          )
                        )
                      | _ -> (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                        )
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 15, characters 26-91" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_repo_name := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x1;
            | 1 ->
              field_repo_root := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x2;
            | 2 ->
              field_revision := (
                (
                  Ag_oj_run.read_int
                ) p lb
              );
              bits0 := !bits0 lor 0x4;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7 then Ag_oj_run.missing_fields p [| !bits0 |] [| "repo_name"; "repo_root"; "revision" |];
        (
          {
            repo_name = !field_repo_name;
            repo_root = !field_repo_root;
            revision = !field_revision;
          }
         : opencores_provider)
      )
)
let opencores_provider_of_string s =
  read_opencores_provider (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__2 = (
  Ag_oj_run.write_std_option (
    Yojson.Safe.write_string
  )
)
let string_of__2 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__2 ob x;
  Bi_outbuf.contents ob
let read__2 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  Ag_oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Ag_oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _2_of_string s =
  read__2 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_github_provider : _ -> github_provider -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"user\":";
    (
      Yojson.Safe.write_string
    )
      ob x.user;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"repo\":";
    (
      Yojson.Safe.write_string
    )
      ob x.repo;
    (match x.version with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"version\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_github_provider ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_github_provider ob x;
  Bi_outbuf.contents ob
let read_github_provider = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_user = ref (Obj.magic 0.0) in
    let field_repo = ref (Obj.magic 0.0) in
    let field_version = ref (None) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' then (
                        1
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' then (
                        0
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
                    )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_user := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x1;
          | 1 ->
            field_repo := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x2;
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_version := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' then (
                          1
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
                        )
                      )
                    | 'u' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' then (
                          0
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
                      )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 9, characters 23-87" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_user := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x1;
            | 1 ->
              field_repo := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x2;
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_version := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields p [| !bits0 |] [| "user"; "repo" |];
        (
          {
            user = !field_user;
            repo = !field_repo;
            version = !field_version;
          }
         : github_provider)
      )
)
let github_provider_of_string s =
  read_github_provider (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_provider = (
  fun ob sum ->
    match sum with
      | `GITHUB x ->
        Bi_outbuf.add_string ob "[\"GITHUB\",";
        (
          write_github_provider
        ) ob x;
        Bi_outbuf.add_char ob ']'
      | `OPENCORES x ->
        Bi_outbuf.add_string ob "[\"OPENCORES\",";
        (
          write_opencores_provider
        ) ob x;
        Bi_outbuf.add_char ob ']'
      | `SIMPLE_FILE x ->
        Bi_outbuf.add_string ob "[\"SIMPLE_FILE\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Bi_outbuf.add_char ob ']'
      | `ZIP x ->
        Bi_outbuf.add_string ob "[\"ZIP\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Bi_outbuf.add_char ob ']'
      | `NO_PROVIDER -> Bi_outbuf.add_string ob "\"NO_PROVIDER\""
)
let string_of_provider ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_provider ob x;
  Bi_outbuf.contents ob
let read_provider = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                match len with
                  | 3 -> (
                      if String.unsafe_get s pos = 'Z' && String.unsafe_get s (pos+1) = 'I' && String.unsafe_get s (pos+2) = 'P' then (
                        3
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | 6 -> (
                      if String.unsafe_get s pos = 'G' && String.unsafe_get s (pos+1) = 'I' && String.unsafe_get s (pos+2) = 'T' && String.unsafe_get s (pos+3) = 'H' && String.unsafe_get s (pos+4) = 'U' && String.unsafe_get s (pos+5) = 'B' then (
                        0
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | 9 -> (
                      if String.unsafe_get s pos = 'O' && String.unsafe_get s (pos+1) = 'P' && String.unsafe_get s (pos+2) = 'E' && String.unsafe_get s (pos+3) = 'N' && String.unsafe_get s (pos+4) = 'C' && String.unsafe_get s (pos+5) = 'O' && String.unsafe_get s (pos+6) = 'R' && String.unsafe_get s (pos+7) = 'E' && String.unsafe_get s (pos+8) = 'S' then (
                        1
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | 11 -> (
                      match String.unsafe_get s pos with
                        | 'N' -> (
                            if String.unsafe_get s (pos+1) = 'O' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'P' && String.unsafe_get s (pos+4) = 'R' && String.unsafe_get s (pos+5) = 'O' && String.unsafe_get s (pos+6) = 'V' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 'D' && String.unsafe_get s (pos+9) = 'E' && String.unsafe_get s (pos+10) = 'R' then (
                              4
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | 'S' -> (
                            if String.unsafe_get s (pos+1) = 'I' && String.unsafe_get s (pos+2) = 'M' && String.unsafe_get s (pos+3) = 'P' && String.unsafe_get s (pos+4) = 'L' && String.unsafe_get s (pos+5) = 'E' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'F' && String.unsafe_get s (pos+8) = 'I' && String.unsafe_get s (pos+9) = 'L' && String.unsafe_get s (pos+10) = 'E' then (
                              2
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | _ -> (
                            raise (Exit)
                          )
                    )
                  | _ -> (
                      raise (Exit)
                    )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_github_provider
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `GITHUB x
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_opencores_provider
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OPENCORES x
            | 2 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  Ag_oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `SIMPLE_FILE x
            | 3 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  Ag_oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ZIP x
            | 4 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NO_PROVIDER
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 11 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'O' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'P' && String.unsafe_get s (pos+4) = 'R' && String.unsafe_get s (pos+5) = 'O' && String.unsafe_get s (pos+6) = 'V' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 'D' && String.unsafe_get s (pos+9) = 'E' && String.unsafe_get s (pos+10) = 'R' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              `NO_PROVIDER
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                match len with
                  | 3 -> (
                      if String.unsafe_get s pos = 'Z' && String.unsafe_get s (pos+1) = 'I' && String.unsafe_get s (pos+2) = 'P' then (
                        3
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | 6 -> (
                      if String.unsafe_get s pos = 'G' && String.unsafe_get s (pos+1) = 'I' && String.unsafe_get s (pos+2) = 'T' && String.unsafe_get s (pos+3) = 'H' && String.unsafe_get s (pos+4) = 'U' && String.unsafe_get s (pos+5) = 'B' then (
                        0
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | 9 -> (
                      if String.unsafe_get s pos = 'O' && String.unsafe_get s (pos+1) = 'P' && String.unsafe_get s (pos+2) = 'E' && String.unsafe_get s (pos+3) = 'N' && String.unsafe_get s (pos+4) = 'C' && String.unsafe_get s (pos+5) = 'O' && String.unsafe_get s (pos+6) = 'R' && String.unsafe_get s (pos+7) = 'E' && String.unsafe_get s (pos+8) = 'S' then (
                        1
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | 11 -> (
                      if String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'I' && String.unsafe_get s (pos+2) = 'M' && String.unsafe_get s (pos+3) = 'P' && String.unsafe_get s (pos+4) = 'L' && String.unsafe_get s (pos+5) = 'E' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'F' && String.unsafe_get s (pos+8) = 'I' && String.unsafe_get s (pos+9) = 'L' && String.unsafe_get s (pos+10) = 'E' then (
                        2
                      )
                      else (
                        raise (Exit)
                      )
                    )
                  | _ -> (
                      raise (Exit)
                    )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_github_provider
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `GITHUB x
            | 1 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_opencores_provider
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OPENCORES x
            | 2 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Ag_oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `SIMPLE_FILE x
            | 3 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Ag_oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ZIP x
            | _ -> (
                assert false
              )
        )
)
let provider_of_string s =
  read_provider (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_plus_arg_type = (
  fun ob sum ->
    match sum with
      | `INT -> Bi_outbuf.add_string ob "\"INT\""
      | `BOOL -> Bi_outbuf.add_string ob "\"BOOL\""
      | `STR -> Bi_outbuf.add_string ob "\"STR\""
      | `FILE -> Bi_outbuf.add_string ob "\"FILE\""
)
let string_of_plus_arg_type ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_plus_arg_type ob x;
  Bi_outbuf.contents ob
let read_plus_arg_type = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                match len with
                  | 3 -> (
                      match String.unsafe_get s pos with
                        | 'I' -> (
                            if String.unsafe_get s (pos+1) = 'N' && String.unsafe_get s (pos+2) = 'T' then (
                              0
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | 'S' -> (
                            if String.unsafe_get s (pos+1) = 'T' && String.unsafe_get s (pos+2) = 'R' then (
                              2
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | _ -> (
                            raise (Exit)
                          )
                    )
                  | 4 -> (
                      match String.unsafe_get s pos with
                        | 'B' -> (
                            if String.unsafe_get s (pos+1) = 'O' && String.unsafe_get s (pos+2) = 'O' && String.unsafe_get s (pos+3) = 'L' then (
                              1
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | 'F' -> (
                            if String.unsafe_get s (pos+1) = 'I' && String.unsafe_get s (pos+2) = 'L' && String.unsafe_get s (pos+3) = 'E' then (
                              3
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | _ -> (
                            raise (Exit)
                          )
                    )
                  | _ -> (
                      raise (Exit)
                    )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `INT
            | 1 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `BOOL
            | 2 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `STR
            | 3 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FILE
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                match len with
                  | 3 -> (
                      match String.unsafe_get s pos with
                        | 'I' -> (
                            if String.unsafe_get s (pos+1) = 'N' && String.unsafe_get s (pos+2) = 'T' then (
                              0
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | 'S' -> (
                            if String.unsafe_get s (pos+1) = 'T' && String.unsafe_get s (pos+2) = 'R' then (
                              2
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | _ -> (
                            raise (Exit)
                          )
                    )
                  | 4 -> (
                      match String.unsafe_get s pos with
                        | 'B' -> (
                            if String.unsafe_get s (pos+1) = 'O' && String.unsafe_get s (pos+2) = 'O' && String.unsafe_get s (pos+3) = 'L' then (
                              1
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | 'F' -> (
                            if String.unsafe_get s (pos+1) = 'I' && String.unsafe_get s (pos+2) = 'L' && String.unsafe_get s (pos+3) = 'E' then (
                              3
                            )
                            else (
                              raise (Exit)
                            )
                          )
                        | _ -> (
                            raise (Exit)
                          )
                    )
                  | _ -> (
                      raise (Exit)
                    )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              `INT
            | 1 ->
              `BOOL
            | 2 ->
              `STR
            | 3 ->
              `FILE
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | _ -> (
                assert false
              )
        )
)
let plus_arg_type_of_string s =
  read_plus_arg_type (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_plus_arg : _ -> plus_arg -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.name;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"arg_type\":";
    (
      write_plus_arg_type
    )
      ob x.arg_type;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"description\":";
    (
      Yojson.Safe.write_string
    )
      ob x.description;
    Bi_outbuf.add_char ob '}';
)
let string_of_plus_arg ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_plus_arg ob x;
  Bi_outbuf.contents ob
let read_plus_arg = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_name = ref (Obj.magic 0.0) in
    let field_arg_type = ref (Obj.magic 0.0) in
    let field_description = ref (Obj.magic 0.0) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 64, characters 16-88" (String.sub s pos len); -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'e' then (
                  1
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 64, characters 16-88" (String.sub s pos len); -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 64, characters 16-88" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 64, characters 16-88" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_name := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x1;
          | 1 ->
            field_arg_type := (
              (
                read_plus_arg_type
              ) p lb
            );
            bits0 := !bits0 lor 0x2;
          | 2 ->
            field_description := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x4;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 64, characters 16-88" (String.sub s pos len); -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'e' then (
                    1
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 64, characters 16-88" (String.sub s pos len); -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 64, characters 16-88" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 64, characters 16-88" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x1;
            | 1 ->
              field_arg_type := (
                (
                  read_plus_arg_type
                ) p lb
              );
              bits0 := !bits0 lor 0x2;
            | 2 ->
              field_description := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x4;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7 then Ag_oj_run.missing_fields p [| !bits0 |] [| "name"; "arg_type"; "description" |];
        (
          {
            name = !field_name;
            arg_type = !field_arg_type;
            description = !field_description;
          }
         : plus_arg)
      )
)
let plus_arg_of_string s =
  read_plus_arg (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_modelsim : _ -> modelsim -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"depend\":";
    (
      write__1
    )
      ob x.depend;
    if x.vsim_options <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"vsim_options\":";
      (
        write__1
      )
        ob x.vsim_options;
    );
    if x.vlog_options <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"vlog_options\":";
      (
        write__1
      )
        ob x.vlog_options;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_modelsim ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_modelsim ob x;
  Bi_outbuf.contents ob
let read_modelsim = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_depend = ref (Obj.magic 0.0) in
    let field_vsim_options = ref ([]) in
    let field_vlog_options = ref ([]) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 6 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' then (
                  0
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'v' then (
                  match String.unsafe_get s (pos+1) with
                    | 'l' -> (
                        if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                          2
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                          1
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                      )
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_depend := (
              (
                read__1
              ) p lb
            );
            bits0 := !bits0 lor 0x1;
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_vsim_options := (
                (
                  read__1
                ) p lb
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_vlog_options := (
                (
                  read__1
                ) p lb
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 6 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' then (
                    0
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'v' then (
                    match String.unsafe_get s (pos+1) with
                      | 'l' -> (
                          if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                            2
                          )
                          else (
                            (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                          )
                        )
                      | 's' -> (
                          if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                            1
                          )
                          else (
                            (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                          )
                        )
                      | _ -> (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                        )
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 34, characters 16-105" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_depend := (
                (
                  read__1
                ) p lb
              );
              bits0 := !bits0 lor 0x1;
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_vsim_options := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_vlog_options := (
                  (
                    read__1
                  ) p lb
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields p [| !bits0 |] [| "depend" |];
        (
          {
            depend = !field_depend;
            vsim_options = !field_vsim_options;
            vlog_options = !field_vlog_options;
          }
         : modelsim)
      )
)
let modelsim_of_string s =
  read_modelsim (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_icarus : _ -> icarus -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"depend\":";
    (
      write__1
    )
      ob x.depend;
    Bi_outbuf.add_char ob '}';
)
let string_of_icarus ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_icarus ob x;
  Bi_outbuf.contents ob
let read_icarus = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_depend = ref (Obj.magic 0.0) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 6 && String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' then (
            0
          )
          else (
            (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 40, characters 14-41" (String.sub s pos len); -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_depend := (
              (
                read__1
              ) p lb
            );
            bits0 := !bits0 lor 0x1;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            if len = 6 && String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' then (
              0
            )
            else (
              (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 40, characters 14-41" (String.sub s pos len); -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_depend := (
                (
                  read__1
                ) p lb
              );
              bits0 := !bits0 lor 0x1;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields p [| !bits0 |] [| "depend" |];
        (
          {
            depend = !field_depend;
          }
         : icarus)
      )
)
let icarus_of_string s =
  read_icarus (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_hdl_files : _ -> hdl_files -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if x.include_files <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"include_files\":";
      (
        write__1
      )
        ob x.include_files;
    );
    if x.src_files <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"src_files\":";
      (
        write__1
      )
        ob x.src_files;
    );
    if x.tb_private_src_files <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"tb_private_src_files\":";
      (
        write__1
      )
        ob x.tb_private_src_files;
    );
    if x.tb_src_files <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"tb_src_files\":";
      (
        write__1
      )
        ob x.tb_src_files;
    );
    if x.tb_include_files <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"tb_include_files\":";
      (
        write__1
      )
        ob x.tb_include_files;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_hdl_files ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_hdl_files ob x;
  Bi_outbuf.contents ob
let read_hdl_files = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_include_files = ref ([]) in
    let field_src_files = ref ([]) in
    let field_tb_private_src_files = ref ([]) in
    let field_tb_src_files = ref ([]) in
    let field_tb_include_files = ref ([]) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 9 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                  1
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'f' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'l' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' then (
                  3
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  0
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'f' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'l' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 's' then (
                  4
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                )
              )
            | 20 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'v' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 'c' && String.unsafe_get s (pos+14) = '_' && String.unsafe_get s (pos+15) = 'f' && String.unsafe_get s (pos+16) = 'i' && String.unsafe_get s (pos+17) = 'l' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = 's' then (
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_include_files := (
                (
                  read__1
                ) p lb
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_src_files := (
                (
                  read__1
                ) p lb
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_tb_private_src_files := (
                (
                  read__1
                ) p lb
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_tb_src_files := (
                (
                  read__1
                ) p lb
              );
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_tb_include_files := (
                (
                  read__1
                ) p lb
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 9 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    1
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'f' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'l' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' then (
                    3
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    0
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'f' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'l' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 's' then (
                    4
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                  )
                )
              | 20 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'v' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 'c' && String.unsafe_get s (pos+14) = '_' && String.unsafe_get s (pos+15) = 'f' && String.unsafe_get s (pos+16) = 'i' && String.unsafe_get s (pos+17) = 'l' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = 's' then (
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 1, characters 17-185" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_include_files := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_src_files := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_tb_private_src_files := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_tb_src_files := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_tb_include_files := (
                  (
                    read__1
                  ) p lb
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            include_files = !field_include_files;
            src_files = !field_src_files;
            tb_private_src_files = !field_tb_private_src_files;
            tb_src_files = !field_tb_src_files;
            tb_include_files = !field_tb_include_files;
          }
         : hdl_files)
      )
)
let hdl_files_of_string s =
  read_hdl_files (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__9 = (
  Ag_oj_run.write_list (
    write_plus_arg
  )
)
let string_of__9 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__9 ob x;
  Bi_outbuf.contents ob
let read__9 = (
  Ag_oj_run.read_list (
    read_plus_arg
  )
)
let _9_of_string s =
  read__9 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__8 = (
  Ag_oj_run.write_std_option (
    write_icarus
  )
)
let string_of__8 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__8 ob x;
  Bi_outbuf.contents ob
let read__8 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_icarus
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_icarus
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _8_of_string s =
  read__8 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__7 = (
  Ag_oj_run.write_std_option (
    write_modelsim
  )
)
let string_of__7 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__7 ob x;
  Bi_outbuf.contents ob
let read__7 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_modelsim
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_modelsim
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _7_of_string s =
  read__7 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__5 = (
  Ag_oj_run.write_list (
    write_simulator
  )
)
let string_of__5 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__5 ob x;
  Bi_outbuf.contents ob
let read__5 = (
  Ag_oj_run.read_list (
    read_simulator
  )
)
let _5_of_string s =
  read__5 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__6 = (
  Ag_oj_run.write_std_option (
    write__5
  )
)
let string_of__6 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__6 ob x;
  Bi_outbuf.contents ob
let read__6 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read__5
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__5
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _6_of_string s =
  read__6 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__4 = (
  Ag_oj_run.write_std_option (
    write_hdl_files
  )
)
let string_of__4 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__4 ob x;
  Bi_outbuf.contents ob
let read__4 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_hdl_files
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_hdl_files
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _4_of_string s =
  read__4 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__3 = (
  Ag_oj_run.write_std_option (
    write__1
  )
)
let string_of__3 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__3 ob x;
  Bi_outbuf.contents ob
let read__3 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read__1
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__1
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _3_of_string s =
  read__3 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__12 = (
  Ag_oj_run.write_std_option (
    write_verilator
  )
)
let string_of__12 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__12 ob x;
  Bi_outbuf.contents ob
let read__12 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_verilator
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_verilator
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _12_of_string s =
  read__12 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__11 = (
  Ag_oj_run.write_std_option (
    write_vpi
  )
)
let string_of__11 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__11 ob x;
  Bi_outbuf.contents ob
let read__11 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_vpi
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_vpi
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _11_of_string s =
  read__11 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__10 = (
  Ag_oj_run.write_std_option (
    write__9
  )
)
let string_of__10 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__10 ob x;
  Bi_outbuf.contents ob
let read__10 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read__9
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag p (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__9
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _10_of_string s =
  read__10 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core : _ -> core -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"core_name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.core_name;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"version\":";
    (
      Yojson.Safe.write_string
    )
      ob x.version;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"description\":";
    (
      Yojson.Safe.write_string
    )
      ob x.description;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"depends\":";
    (
      write__1
    )
      ob x.depends;
    (match x.install_path with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"install_path\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.patches with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"patches\":";
      (
        write__1
      )
        ob x;
    );
    (match x.verilog_files with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"verilog_files\":";
      (
        write_hdl_files
      )
        ob x;
    );
    (match x.vhdl_files with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"vhdl_files\":";
      (
        write_hdl_files
      )
        ob x;
    );
    (match x.testbench with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"testbench\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"provider\":";
    (
      write_provider
    )
      ob x.provider;
    (match x.supported_simulators with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"supported_simulators\":";
      (
        write__5
      )
        ob x;
    );
    (match x.modelsim with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"modelsim\":";
      (
        write_modelsim
      )
        ob x;
    );
    (match x.icarus with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"icarus\":";
      (
        write_icarus
      )
        ob x;
    );
    (match x.plusargs with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"plusargs\":";
      (
        write__9
      )
        ob x;
    );
    (match x.vpi with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"vpi\":";
      (
        write_vpi
      )
        ob x;
    );
    (match x.verilator with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"verilator\":";
      (
        write_verilator
      )
        ob x;
    );
    (match x.pre_build_scripts with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"pre_build_scripts\":";
      (
        write__1
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_core ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core ob x;
  Bi_outbuf.contents ob
let read_core = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_core_name = ref (Obj.magic 0.0) in
    let field_version = ref (Obj.magic 0.0) in
    let field_description = ref (Obj.magic 0.0) in
    let field_depends = ref (Obj.magic 0.0) in
    let field_install_path = ref (None) in
    let field_patches = ref (None) in
    let field_verilog_files = ref (None) in
    let field_vhdl_files = ref (None) in
    let field_testbench = ref (None) in
    let field_provider = ref (Obj.magic 0.0) in
    let field_supported_simulators = ref (None) in
    let field_modelsim = ref (None) in
    let field_icarus = ref (None) in
    let field_plusargs = ref (None) in
    let field_vpi = ref (None) in
    let field_verilator = ref (None) in
    let field_pre_build_scripts = ref (None) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'i' then (
                  14
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' then (
                  12
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                )
              )
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'd' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 's' then (
                        3
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                        5
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                    )
                  | 'v' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                        1
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                    )
              )
            | 8 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'm' then (
                        11
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                    )
                  | 'p' -> (
                      match String.unsafe_get s (pos+1) with
                        | 'l' -> (
                            if String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 's' then (
                              13
                            )
                            else (
                              (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                            )
                          )
                        | 'r' -> (
                            if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'r' then (
                              9
                            )
                            else (
                              (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                            )
                          )
                        | _ -> (
                            (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                          )
                    )
                  | _ -> (
                      (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                    )
              )
            | 9 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' then (
                        0
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'c' && String.unsafe_get s (pos+8) = 'h' then (
                        8
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                    )
                  | 'v' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' then (
                        15
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                    )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
                  7
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'h' then (
                  4
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  6
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                )
              )
            | 17 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'c' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'p' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 's' then (
                  16
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                )
              )
            | 20 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'i' && String.unsafe_get s (pos+12) = 'm' && String.unsafe_get s (pos+13) = 'u' && String.unsafe_get s (pos+14) = 'l' && String.unsafe_get s (pos+15) = 'a' && String.unsafe_get s (pos+16) = 't' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'r' && String.unsafe_get s (pos+19) = 's' then (
                  10
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_core_name := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x1;
          | 1 ->
            field_version := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x2;
          | 2 ->
            field_description := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x4;
          | 3 ->
            field_depends := (
              (
                read__1
              ) p lb
            );
            bits0 := !bits0 lor 0x8;
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_install_path := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_patches := (
                Some (
                  (
                    read__1
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_verilog_files := (
                Some (
                  (
                    read_hdl_files
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_vhdl_files := (
                Some (
                  (
                    read_hdl_files
                  ) p lb
                )
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_testbench := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 9 ->
            field_provider := (
              (
                read_provider
              ) p lb
            );
            bits0 := !bits0 lor 0x10;
          | 10 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_supported_simulators := (
                Some (
                  (
                    read__5
                  ) p lb
                )
              );
            )
          | 11 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_modelsim := (
                Some (
                  (
                    read_modelsim
                  ) p lb
                )
              );
            )
          | 12 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_icarus := (
                Some (
                  (
                    read_icarus
                  ) p lb
                )
              );
            )
          | 13 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_plusargs := (
                Some (
                  (
                    read__9
                  ) p lb
                )
              );
            )
          | 14 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_vpi := (
                Some (
                  (
                    read_vpi
                  ) p lb
                )
              );
            )
          | 15 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_verilator := (
                Some (
                  (
                    read_verilator
                  ) p lb
                )
              );
            )
          | 16 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_pre_build_scripts := (
                Some (
                  (
                    read__1
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'i' then (
                    14
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' then (
                    12
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                  )
                )
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'd' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 's' then (
                          3
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                          5
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                          1
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'm' then (
                          11
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                        )
                      )
                    | 'p' -> (
                        match String.unsafe_get s (pos+1) with
                          | 'l' -> (
                              if String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 's' then (
                                13
                              )
                              else (
                                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                              )
                            )
                          | 'r' -> (
                              if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'r' then (
                                9
                              )
                              else (
                                (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                              )
                            )
                          | _ -> (
                              (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                            )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                )
              | 9 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' then (
                          0
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'c' && String.unsafe_get s (pos+8) = 'h' then (
                          8
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' then (
                          15
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                      )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
                    7
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'h' then (
                    4
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    6
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                  )
                )
              | 17 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'c' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'p' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 's' then (
                    16
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                  )
                )
              | 20 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'i' && String.unsafe_get s (pos+12) = 'm' && String.unsafe_get s (pos+13) = 'u' && String.unsafe_get s (pos+14) = 'l' && String.unsafe_get s (pos+15) = 'a' && String.unsafe_get s (pos+16) = 't' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'r' && String.unsafe_get s (pos+19) = 's' then (
                    10
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"src/cores.atd\", line 70, characters 12-1071" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_core_name := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x1;
            | 1 ->
              field_version := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x2;
            | 2 ->
              field_description := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x4;
            | 3 ->
              field_depends := (
                (
                  read__1
                ) p lb
              );
              bits0 := !bits0 lor 0x8;
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_install_path := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_patches := (
                  Some (
                    (
                      read__1
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_verilog_files := (
                  Some (
                    (
                      read_hdl_files
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_vhdl_files := (
                  Some (
                    (
                      read_hdl_files
                    ) p lb
                  )
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_testbench := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 9 ->
              field_provider := (
                (
                  read_provider
                ) p lb
              );
              bits0 := !bits0 lor 0x10;
            | 10 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_supported_simulators := (
                  Some (
                    (
                      read__5
                    ) p lb
                  )
                );
              )
            | 11 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_modelsim := (
                  Some (
                    (
                      read_modelsim
                    ) p lb
                  )
                );
              )
            | 12 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_icarus := (
                  Some (
                    (
                      read_icarus
                    ) p lb
                  )
                );
              )
            | 13 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_plusargs := (
                  Some (
                    (
                      read__9
                    ) p lb
                  )
                );
              )
            | 14 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_vpi := (
                  Some (
                    (
                      read_vpi
                    ) p lb
                  )
                );
              )
            | 15 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_verilator := (
                  Some (
                    (
                      read_verilator
                    ) p lb
                  )
                );
              )
            | 16 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_pre_build_scripts := (
                  Some (
                    (
                      read__1
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1f then Ag_oj_run.missing_fields p [| !bits0 |] [| "core_name"; "version"; "description"; "depends"; "provider" |];
        (
          {
            core_name = !field_core_name;
            version = !field_version;
            description = !field_description;
            depends = !field_depends;
            install_path = !field_install_path;
            patches = !field_patches;
            verilog_files = !field_verilog_files;
            vhdl_files = !field_vhdl_files;
            testbench = !field_testbench;
            provider = !field_provider;
            supported_simulators = !field_supported_simulators;
            modelsim = !field_modelsim;
            icarus = !field_icarus;
            plusargs = !field_plusargs;
            vpi = !field_vpi;
            verilator = !field_verilator;
            pre_build_scripts = !field_pre_build_scripts;
          }
         : core)
      )
)
let core_of_string s =
  read_core (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
