files=$(wildcard *.md)
build=build

docx: $(addprefix $(build)/,$(files:.md=.html))
docx: $(addprefix $(build)/,$(files:.md=.docx))

$(build)/%.html: %.md | $(build)
	pandoc -f gfm -o $@ $<

$(build)/%.docx: %.md | $(build)
	pandoc -f gfm -o $@ $<

$(build):
	mkdir -p $@
