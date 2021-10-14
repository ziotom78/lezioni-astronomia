IMAGES = \
	blackbody.png \
	dirbe_band_too_wide.png \
	dirbe_band_ok.png \
	stellar-spectrum.png \
	stellar-spectrum-and-band.png \
	interpolation-wrong.png \
	interpolation-right.png \
	tophat-band.png

PANDOC := /usr/bin/pandoc
PANDOC_IMAGINE := $(HOME)/bin/pandoc_imagine.py
.phony: all

all: \
	tomasi-lezione-1b.html \
	tomasi-lezione-1a.html \
	index.html

index.html: index.md ${JS_FILES}
	$(PANDOC) --standalone -o $@ $<

%.html: %.md
	$(PANDOC) \
	    	--standalone \
		--filter $(PANDOC_IMAGINE) \
		--css ./css/custom.css \
		--css ./css/asciinema-player.css \
		-A asciinema-include.html \
		--katex \
		-V theme=white \
		-V progress=true \
		-V slideNumber=true \
		-V background-image=./images/background.png \
		-V width=1440 \
		-V height=810 \
		-f markdown+tex_math_single_backslash+subscript+superscript \
		-t revealjs \
		-o $@ $<

$(IMAGES): dirbe-analysis.jl
	julia $<
