# ini2core

This application converts the metadata for [fusesoc](https://github.com/openrisc/orpsoc-cores)
into a better typed form suitable for ocaml.

We can output in JSON or OCaml serialized format.

Note; this is not a user application for the meta data repository but rather
used in maintaining it.

* **ini2json.py** converts the init files from fusesoc to json
* **initcores.atd** provides the initial json representation of the metadata
* **ini2core.ml** implements the application to convert the metadata into a 
  format more easily typed.

