SHELL=bash
.PHONY: docs

all: glue variants minify docs end

glue:
	@echo
	@echo "--> Gluing together CSS files."
	cat src/vars.css > dist/adinida.css
	cat src/base.css >> dist/adinida.css
	cat src/grid.css >> dist/adinida.css
	cat src/util.css >> dist/adinida.css

variants:
	@echo
	@echo "--> Generate vars and base CSS versions."
	cp dist/adinida.css dist/adinida-vars.css
	node_modules/.bin/postcss dist/adinida.css -o dist/adinida.css

minify:
	@echo
	@echo "--> Minify CSS."
	node_modules/.bin/csso dist/adinida-vars.css > dist/adinida-vars.min.css
	node_modules/.bin/csso dist/adinida.css > dist/adinida.min.css

docs:
	@echo
	@echo "--> Updating docs."
	sed '/start-css/,/end-css/{//!d;}' docs/index.html > docs/tmp.html
	sed '/start-css/r dist/adinida.min.css' docs/tmp.html > docs/index.html
	rm docs/tmp.html

end:
	@echo
	@echo "--> Done."
	@echo


