#!/usr/bin/bash

make

for id in 01 02 03 04 05 06 07; do
    decktape automatic https://ziotom78.github.io/lezioni-astronomia/tomasi-astro2-lezione-$id.html pdf/tomasi-astro2-lezione-$id.pdf
done

decktape automatic tomasi-astro2-scrittura-scientifica.html pdf/tomasi-astro2-scrittura-scientifica.pdf
