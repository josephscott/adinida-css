SHELL=bash

all: glue minify

glue:
	@echo
	@echo "--> Gluing together CSS files."
	cat src/vars.css > dist/adinida.css
	cat src/base.css >> dist/adinida.css
	cat src/grid.css >> dist/adinida.css

minify:
	@echo
	@echo "--> Minify CSS."
	node_modules/.bin/csso dist/adinida.css > dist/adinida.min.css
