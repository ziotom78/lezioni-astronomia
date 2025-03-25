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
PANDOC_IMAGINE := $(HOME)/bin/pandoc-imagine
.phony: all http

all: \
	tomasi-astro2-scrittura-scientifica.html \
	tomasi-astro2-lezione-07.html \
	tomasi-astro2-lezione-06.html \
	tomasi-astro2-lezione-05.html \
	tomasi-astro2-lezione-04.html \
	tomasi-astro2-lezione-03.html \
	tomasi-astro2-lezione-02.html \
	tomasi-astro2-lezione-01.html \
	tomasi-astro1-lezione-02.html \
	tomasi-astro1-lezione-01b.html \
	tomasi-astro1-lezione-01a.html \
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
		--template template-revealjs.html \
		-V theme=white \
		-V progress=true \
		-V slideNumber=true \
		-V history=true \
		-V background-image=./images/background.png \
		-V width=1440 \
		-V height=810 \
		-V "revealjs-url=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/5.2.0" \
		-f markdown+tex_math_single_backslash+subscript+superscript \
		-t revealjs \
		-o $@ $<

$(IMAGES): dirbe-analysis.jl
	julia $<

http:
	python -m http.server
