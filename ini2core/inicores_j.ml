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
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 46, characters 11-97" (String.sub s pos len); -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                  0
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 46, characters 11-97" (String.sub s pos len); -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  1
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 46, characters 11-97" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 46, characters 11-97" (String.sub s pos len); -1
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
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 46, characters 11-97" (String.sub s pos len); -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    0
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 46, characters 11-97" (String.sub s pos len); -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    1
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 46, characters 11-97" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 46, characters 11-97" (String.sub s pos len); -1
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
let write_verilog : _ -> verilog -> _ = (
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
let string_of_verilog ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_verilog ob x;
  Bi_outbuf.contents ob
let read_verilog = (
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
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'f' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'l' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' then (
                  3
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  0
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'f' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'l' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 's' then (
                  4
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                )
              )
            | 20 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'v' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 'c' && String.unsafe_get s (pos+14) = '_' && String.unsafe_get s (pos+15) = 'f' && String.unsafe_get s (pos+16) = 'i' && String.unsafe_get s (pos+17) = 'l' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = 's' then (
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
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
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'f' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'l' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' then (
                    3
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    0
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'f' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'l' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 's' then (
                    4
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                  )
                )
              | 20 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'v' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 'c' && String.unsafe_get s (pos+14) = '_' && String.unsafe_get s (pos+15) = 'f' && String.unsafe_get s (pos+16) = 'i' && String.unsafe_get s (pos+17) = 'l' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = 's' then (
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 10, characters 15-183" (String.sub s pos len); -1
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
         : verilog)
      )
)
let verilog_of_string s =
  read_verilog (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
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
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'y' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'e' then (
                  0
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  1
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
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
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'y' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'e' then (
                    0
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'f' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    1
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 52, characters 17-128" (String.sub s pos len); -1
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
let write_simulator : _ -> simulator -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"toplevel\":";
    (
      Yojson.Safe.write_string
    )
      ob x.toplevel;
    Bi_outbuf.add_char ob '}';
)
let string_of_simulator ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_simulator ob x;
  Bi_outbuf.contents ob
let read_simulator = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_toplevel = ref (Obj.magic 0.0) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 8 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'l' then (
            0
          )
          else (
            (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 32, characters 17-41" (String.sub s pos len); -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_toplevel := (
              (
                Ag_oj_run.read_string
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
            if len = 8 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'l' then (
              0
            )
            else (
              (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 32, characters 17-41" (String.sub s pos len); -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_toplevel := (
                (
                  Ag_oj_run.read_string
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
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields p [| !bits0 |] [| "toplevel" |];
        (
          {
            toplevel = !field_toplevel;
          }
         : simulator)
      )
)
let simulator_of_string s =
  read_simulator (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_scripts : _ -> scripts -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"pre_build_scripts\":";
    (
      write__1
    )
      ob x.pre_build_scripts;
    Bi_outbuf.add_char ob '}';
)
let string_of_scripts ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_scripts ob x;
  Bi_outbuf.contents ob
let read_scripts = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_pre_build_scripts = ref (Obj.magic 0.0) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 17 && String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'c' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'p' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 's' then (
            0
          )
          else (
            (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 59, characters 15-53" (String.sub s pos len); -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_pre_build_scripts := (
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
            if len = 17 && String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'c' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'p' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 's' then (
              0
            )
            else (
              (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 59, characters 15-53" (String.sub s pos len); -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_pre_build_scripts := (
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
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields p [| !bits0 |] [| "pre_build_scripts" |];
        (
          {
            pre_build_scripts = !field_pre_build_scripts;
          }
         : scripts)
      )
)
let scripts_of_string s =
  read_scripts (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__4 = (
  Ag_oj_run.write_std_option (
    Yojson.Safe.write_bool
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
                  Ag_oj_run.read_bool
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
                  Ag_oj_run.read_bool
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
    Yojson.Safe.write_int
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
                  Ag_oj_run.read_int
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
                  Ag_oj_run.read_int
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
let write_provider : _ -> provider -> _ = (
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
    (match x.url with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"url\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.filetype with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"filetype\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.user with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"user\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
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
    (match x.repo with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"repo\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.branch with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"branch\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.repo_root with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"repo_root\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.repo_name with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"repo_name\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.revision with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"revision\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    (match x.cachable with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"cachable\":";
      (
        Yojson.Safe.write_bool
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_provider ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_provider ob x;
  Bi_outbuf.contents ob
let read_provider = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_name = ref (Obj.magic 0.0) in
    let field_url = ref (None) in
    let field_filetype = ref (None) in
    let field_user = ref (None) in
    let field_version = ref (None) in
    let field_repo = ref (None) in
    let field_branch = ref (None) in
    let field_repo_root = ref (None) in
    let field_repo_name = ref (None) in
    let field_revision = ref (None) in
    let field_cachable = ref (None) in
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
                if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'l' then (
                  1
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                )
              )
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'n' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                        0
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' then (
                        5
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' then (
                        3
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                    )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'h' then (
                  6
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                  4
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                )
              )
            | 8 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' then (
                        10
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                      )
                    )
                  | 'f' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'e' then (
                        2
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                        9
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                    )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = '_' then (
                  match String.unsafe_get s (pos+5) with
                    | 'n' -> (
                        if String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' then (
                          8
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 't' then (
                          7
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                      )
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
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
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_url := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_filetype := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_user := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_version := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_repo := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_branch := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_repo_root := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_repo_name := (
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              );
            )
          | 9 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_revision := (
                Some (
                  (
                    Ag_oj_run.read_int
                  ) p lb
                )
              );
            )
          | 10 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_cachable := (
                Some (
                  (
                    Ag_oj_run.read_bool
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
                  if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'l' then (
                    1
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                  )
                )
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'n' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' then (
                          5
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                        )
                      )
                    | 'u' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' then (
                          3
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                      )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'h' then (
                    6
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                    4
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                  )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' then (
                          10
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                        )
                      )
                    | 'f' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'e' then (
                          2
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                          9
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                      )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = '_' then (
                    match String.unsafe_get s (pos+5) with
                      | 'n' -> (
                          if String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' then (
                            8
                          )
                          else (
                            (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                          )
                        )
                      | 'r' -> (
                          if String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 't' then (
                            7
                          )
                          else (
                            (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                          )
                        )
                      | _ -> (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                        )
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 18, characters 16-307" (String.sub s pos len); -1
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
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_url := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_filetype := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_user := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_version := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_repo := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_branch := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_repo_root := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_repo_name := (
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 9 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_revision := (
                  Some (
                    (
                      Ag_oj_run.read_int
                    ) p lb
                  )
                );
              )
            | 10 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_cachable := (
                  Some (
                    (
                      Ag_oj_run.read_bool
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
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields p [| !bits0 |] [| "name" |];
        (
          {
            name = !field_name;
            url = !field_url;
            filetype = !field_filetype;
            user = !field_user;
            version = !field_version;
            repo = !field_repo;
            branch = !field_branch;
            repo_root = !field_repo_root;
            repo_name = !field_repo_name;
            revision = !field_revision;
            cachable = !field_cachable;
          }
         : provider)
      )
)
let provider_of_string s =
  read_provider (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
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
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
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
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                          1
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
                      )
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
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
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
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
                            (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
                          )
                        )
                      | 's' -> (
                          if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                            1
                          )
                          else (
                            (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
                          )
                        )
                      | _ -> (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
                        )
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 36, characters 16-105" (String.sub s pos len); -1
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
let write_main : _ -> main -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if x.description <> "" then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"description\":";
      (
        Yojson.Safe.write_string
      )
        ob x.description;
    );
    if x.simulators <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"simulators\":";
      (
        write__1
      )
        ob x.simulators;
    );
    if x.depend <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"depend\":";
      (
        write__1
      )
        ob x.depend;
    );
    if x.patches <> [] then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"patches\":";
      (
        write__1
      )
        ob x.patches;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_main ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_main ob x;
  Bi_outbuf.contents ob
let read_main = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_description = ref ("") in
    let field_simulators = ref ([]) in
    let field_depend = ref ([]) in
    let field_patches = ref ([]) in
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
                  2
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                  3
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
                )
              )
            | 10 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 's' then (
                  1
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                  0
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
                )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_description := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_simulators := (
                (
                  read__1
                ) p lb
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_depend := (
                (
                  read__1
                ) p lb
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_patches := (
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
                    2
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                    3
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 's' then (
                    1
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                    0
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 3, characters 12-120" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_description := (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_simulators := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_depend := (
                  (
                    read__1
                  ) p lb
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_patches := (
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
            description = !field_description;
            simulators = !field_simulators;
            depend = !field_depend;
            patches = !field_patches;
          }
         : main)
      )
)
let main_of_string s =
  read_main (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
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
            (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 42, characters 14-41" (String.sub s pos len); -1
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
              (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 42, characters 14-41" (String.sub s pos len); -1
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
let write_dyn = (
  Yojson.Safe.write_json
)
let string_of_dyn ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_dyn ob x;
  Bi_outbuf.contents ob
let read_dyn = (
  Yojson.Safe.read_json
)
let dyn_of_string s =
  read_dyn (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__9 = (
  Ag_oj_run.write_std_option (
    write_icarus
  )
)
let string_of__9 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__9 ob x;
  Bi_outbuf.contents ob
let read__9 = (
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
let _9_of_string s =
  read__9 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__8 = (
  Ag_oj_run.write_std_option (
    write_modelsim
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
let _8_of_string s =
  read__8 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__7 = (
  Ag_oj_run.write_std_option (
    write_simulator
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
                  read_simulator
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
                  read_simulator
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
let write__6 = (
  Ag_oj_run.write_std_option (
    write_provider
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
                  read_provider
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
                  read_provider
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
let write__5 = (
  Ag_oj_run.write_std_option (
    write_verilog
  )
)
let string_of__5 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__5 ob x;
  Bi_outbuf.contents ob
let read__5 = (
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
                  read_verilog
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
                  read_verilog
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
let _5_of_string s =
  read__5 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__13 = (
  Ag_oj_run.write_std_option (
    write_scripts
  )
)
let string_of__13 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__13 ob x;
  Bi_outbuf.contents ob
let read__13 = (
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
                  read_scripts
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
                  read_scripts
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
let _13_of_string s =
  read__13 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
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
    write_dyn
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
                  read_dyn
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
                  read_dyn
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
    Bi_outbuf.add_string ob "\"core_file\":";
    (
      Yojson.Safe.write_string
    )
      ob x.core_file;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"main\":";
    (
      write_main
    )
      ob x.main;
    (match x.verilog with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"verilog\":";
      (
        write_verilog
      )
        ob x;
    );
    (match x.provider with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"provider\":";
      (
        write_provider
      )
        ob x;
    );
    (match x.simulator with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"simulator\":";
      (
        write_simulator
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
        write_dyn
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
    (match x.scripts with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"scripts\":";
      (
        write_scripts
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
    let field_core_file = ref (Obj.magic 0.0) in
    let field_main = ref (Obj.magic 0.0) in
    let field_verilog = ref (None) in
    let field_provider = ref (None) in
    let field_simulator = ref (None) in
    let field_modelsim = ref (None) in
    let field_icarus = ref (None) in
    let field_plusargs = ref (None) in
    let field_vpi = ref (None) in
    let field_verilator = ref (None) in
    let field_scripts = ref (None) in
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
                  8
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' then (
                  1
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' then (
                  6
                )
                else (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                )
              )
            | 7 -> (
                match String.unsafe_get s pos with
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                        10
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                      )
                    )
                  | 'v' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'g' then (
                        2
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                    )
              )
            | 8 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'm' then (
                        5
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                      )
                    )
                  | 'p' -> (
                      match String.unsafe_get s (pos+1) with
                        | 'l' -> (
                            if String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 's' then (
                              7
                            )
                            else (
                              (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                            )
                          )
                        | 'r' -> (
                            if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'r' then (
                              3
                            )
                            else (
                              (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                            )
                          )
                        | _ -> (
                            (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                          )
                    )
                  | _ -> (
                      (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                    )
              )
            | 9 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' then (
                        0
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' then (
                        4
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                      )
                    )
                  | 'v' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' then (
                        9
                      )
                      else (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                    )
              )
            | _ -> (
                (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_core_file := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x1;
          | 1 ->
            field_main := (
              (
                read_main
              ) p lb
            );
            bits0 := !bits0 lor 0x2;
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_verilog := (
                Some (
                  (
                    read_verilog
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_provider := (
                Some (
                  (
                    read_provider
                  ) p lb
                )
              );
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_simulator := (
                Some (
                  (
                    read_simulator
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_modelsim := (
                Some (
                  (
                    read_modelsim
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_icarus := (
                Some (
                  (
                    read_icarus
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_plusargs := (
                Some (
                  (
                    read_dyn
                  ) p lb
                )
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_vpi := (
                Some (
                  (
                    read_vpi
                  ) p lb
                )
              );
            )
          | 9 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_verilator := (
                Some (
                  (
                    read_verilator
                  ) p lb
                )
              );
            )
          | 10 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_scripts := (
                Some (
                  (
                    read_scripts
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
                    8
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' then (
                    1
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' then (
                    6
                  )
                  else (
                    (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                  )
                )
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                          10
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'g' then (
                          2
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                      )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'm' then (
                          5
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                        )
                      )
                    | 'p' -> (
                        match String.unsafe_get s (pos+1) with
                          | 'l' -> (
                              if String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 's' then (
                                7
                              )
                              else (
                                (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                              )
                            )
                          | 'r' -> (
                              if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'r' then (
                                3
                              )
                              else (
                                (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                              )
                            )
                          | _ -> (
                              (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                            )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                      )
                )
              | 9 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' then (
                          0
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' then (
                          4
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' then (
                          9
                        )
                        else (
                          (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                      )
                )
              | _ -> (
                  (!Ag_util.Json.unknown_field_handler) "File \"ini2core/inicores.atd\", line 63, characters 12-312" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_core_file := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x1;
            | 1 ->
              field_main := (
                (
                  read_main
                ) p lb
              );
              bits0 := !bits0 lor 0x2;
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_verilog := (
                  Some (
                    (
                      read_verilog
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_provider := (
                  Some (
                    (
                      read_provider
                    ) p lb
                  )
                );
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_simulator := (
                  Some (
                    (
                      read_simulator
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_modelsim := (
                  Some (
                    (
                      read_modelsim
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_icarus := (
                  Some (
                    (
                      read_icarus
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_plusargs := (
                  Some (
                    (
                      read_dyn
                    ) p lb
                  )
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_vpi := (
                  Some (
                    (
                      read_vpi
                    ) p lb
                  )
                );
              )
            | 9 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_verilator := (
                  Some (
                    (
                      read_verilator
                    ) p lb
                  )
                );
              )
            | 10 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_scripts := (
                  Some (
                    (
                      read_scripts
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
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields p [| !bits0 |] [| "core_file"; "main" |];
        (
          {
            core_file = !field_core_file;
            main = !field_main;
            verilog = !field_verilog;
            provider = !field_provider;
            simulator = !field_simulator;
            modelsim = !field_modelsim;
            icarus = !field_icarus;
            plusargs = !field_plusargs;
            vpi = !field_vpi;
            verilator = !field_verilator;
            scripts = !field_scripts;
          }
         : core)
      )
)
let core_of_string s =
  read_core (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
