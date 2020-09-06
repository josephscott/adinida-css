SHELL=bash

all: glue

glue:
	@echo
	@echo "--> Gluing together CSS files."
	cat src/vars.css > dist/adinida.css
	cat src/base.css >> dist/adinida.css
	cat src/grid.css >> dist/adinida.css

