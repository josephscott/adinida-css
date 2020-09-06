SHELL=bash

all: glue minify docs end

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


.PHONY: docs
