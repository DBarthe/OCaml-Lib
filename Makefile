OCAMLMAKEFILE = OCamlMakefile

SOURCES_DIR = src
MODULES = option binomialHeap priorityQueue
SOURCES = $(foreach m,$(MODULES),$(SOURCES_DIR)/$(m).ml)

RESULT = libmy

DOC_FILES = $(wildcard $(SOURCES_DIR)/*.mli)
OCAMLDOCFLAGS = -charset utf8

all: native-code-library byte-code-library

include $(OCAMLMAKEFILE)