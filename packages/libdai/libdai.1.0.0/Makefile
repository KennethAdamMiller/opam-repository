SETUP=LDFLAGS=-L/usr/local/lib LIBRARY_PATH=/opt/local/lib ocaml setup.ml
libdai_caml=ocaml_swig

libdai:
	git clone https://bitbucket.org/kennethadammiller/libdai

osxconf:
	cp libdai/Makefile.MACOSX64 libdai/Makefile.conf

linuxconf:
	cp libdai/Makefile.LINUX libdai/Makefile.conf

libdai/lib/libdai.a: libdai
	make -C libdai -j8
	make -C libdai/swig dai_stub.c

osxocaml: libdai osxconf libdai/lib/libdai.a
	cp libdai/swig/*.ml ocaml_swig/src/
	cp libdai/swig/*.mli ocaml_swig/src/
	cp libdai/swig/*.c ocaml_swig/src/
	make -C ocaml_swig 

ocaml: libdai linuxconf libdai/lib/libdai.a
	cp libdai/swig/*.ml ocaml_swig/src/
	cp libdai/swig/*.mli ocaml_swig/src/
	cp libdai/swig/*.c ocaml_swig/src/
	make -C ocaml_swig

test:
	./ocaml_swig/test.native

install:
	cd ocaml_swig ; $(SETUP) -configure --bindir $(shell opam config var bin)
	cd ocaml_swig ; $(SETUP) -install

clean:
	rm -rf libdai
	make -C ocaml_swig clean
