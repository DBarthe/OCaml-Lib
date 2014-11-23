OCAMLMAKEFILE = OCamlMakefile

SOURCES_DIR = src
MODULES = option listExt utils binomialHeap priorityQueue
SOURCES = $(foreach m,$(MODULES),$(SOURCES_DIR)/$(m).ml)

RESULT = libmy

DOC_FILES = $(wildcard $(SOURCES_DIR)/*.mli)
OCAMLDOCFLAGS = -charset utf8

TEST_SRC = $(SOURCES_DIR)/test.ml

all: native-code-library byte-code-library

test: byte-code-library
	ocamlc -I src/ $(RESULT).cma -o test $(SOURCES_DIR)/test.ml 
clean-test:
	$(RM) test src/test.cmo src/test.cmi


include $(OCAMLMAKEFILE)