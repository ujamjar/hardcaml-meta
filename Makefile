##################################################################

JSON_SRC=\
		ini2core/ini2cores_t.mli ini2core/ini2cores_t.ml \
		ini2core/ini2cores_j.mli ini2core/ini2cores_j.ml \
		src/cores_t.mli src/cores_t.ml \
		src/cores_j.mli src/cores_j.ml
ORPSOC=../../orpsoc-cores/cores/

##################################################################

all: setup.data
	ocaml setup.ml -build

setup.ml:
	oasis setup

setup.data: setup.ml
	ocaml setup.ml -configure --enable-converter

install: all
	ocaml setup.ml -install

uninstall: 
	ocamlfind remove hardcaml-meta

clean:
	ocaml setup.ml -clean
	- find . -name "*~" | xargs rm

distclean:
	ocaml setup.ml -distclean

##################################################################

.PHONY: json
json: $(JSON_SRC)

JSON_ARGS = -j-strict-fields -j-std

$(JSON_SRC): src/cores.atd
	atdgen -o ini2core/inicores -t ini2core/inicores.atd
	atdgen -o ini2core/inicores -j $(JSON_ARGS) ini2core/inicores.atd
	atdgen -o src/cores -t src/cores.atd
	atdgen -o src/cores -j $(JSON_ARGS) src/cores.atd

cores.json: ini2core/ini2json.py
	find $(ORPSOC) -name "*.core" -print0 | xargs -0 -L 1 ./ini2core/ini2json.py > ini2core/cores.json

