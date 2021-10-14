---
title: Lezione di astronomia 1b
author: Maurizio Tomasi ([maurizio.tomasi@unimi.it](mailto:maurizio.tomasi@unimi.it))
date: 15 Ottobre 2021
...



# Calcolo delle correzioni bolometriche

Nella lezione precedente abbiamo calcolato la luminosità totale del centro galattico a partire da misurazioni dello strumento DIRBE.

Abbiamo però usato una stima della correzione bolometrica $C$ senza capire come fosse ricavata. Ora colmeremo questa lacuna.


# Calcolo delle correzioni bolometriche

La correzione bolometrica è una costante moltiplicativa che converte la luminosità misurata da uno strumento a banda $P$ limitata nella luminosità integrata su tutto lo spettro B:

$$
C = \frac{\int_0^\infty B(\nu)\,\text{d}\nu}{\int_0^\infty P_\nu(\nu) \times B(\nu)\,\text{d}\nu},
$$

dove $B$ può essere la densità spettrale o la densità di flusso.



# Dipendenza da $\nu$ e da $\lambda$

La costante bolometrica $C$ deve essere identica se si esprime $B$ in funzione di $\lambda$ o di $\nu$.

Ma l'espressione analitica di $B$ cambia se si esprime in funzione di $\nu$ o di $\lambda$, perché deve valere che

$$
B(\nu)\,\text{d}\nu = B(\lambda)\,\text{d}\lambda \quad\Rightarrow\quad
B(\nu) = B\bigl(\lambda(\nu)\bigr)\,\frac{\text{d}\lambda}{\text{d}\nu}.
$$



# Dipendenza da $\nu$ e da $\lambda$

Ad esempio, nel caso di un corpo nero la densità spettrale ha due espressioni analitiche diverse:

$$
  \begin{aligned}
    B_{bb}(\nu, T) &= \frac{2h\nu^3}{c^2} \frac1{e^{h\nu / kT} - 1}, \\
    B_{bb}(\lambda, T) &= \frac{2hc^2}{\lambda^5} \frac1{e^{hc / \lambda kT} - 1}.
  \end{aligned}
$$

Nel caso della risposta in banda $P$, la sua espressione analitica cambia, oppure basta sostituire $\nu$ con $c/\lambda$?



# Risposta in banda

$P$ quantifica l'energia ricevuta, che resta la stessa se si usa $\nu$ o $\lambda$. Quindi

$$
\int_0^\infty P_\nu(\nu) \times B(\nu)\,\text{d}\nu =
\int_0^\infty P_\lambda(\lambda) \times B(\lambda)\,\text{d}\lambda.
$$

Se $B(\nu)\,\text{d}\nu = B(\lambda)\,\text{d}\lambda$ allora

$$
\int_0^\infty P_\nu(\nu) \times B(\nu)\,\text{d}\nu =
\int_0^\infty P_\lambda\bigl(\lambda(\nu)\bigr) \times B(\nu)\,\text{d}\nu,
$$

che è vero se $P_\lambda(\lambda) = P_\lambda(c / \nu) = P_\nu(\nu)$. Quindi la forma analitica della banda non cambia.


# Correzione bolometrica

Il risultato precedente indica che $C$ può essere espressa sia in funzione di $\nu$ che di $\lambda$, a patto di cambiare *solo* l'espressione analitica per $B$:

$$
\begin{aligned}
  C &= \frac{\int_0^\infty B(\nu)\,\text{d}\nu}{\int_0^\infty P_\nu(\nu) \times B(\nu)\,\text{d}\nu} =\\
  &= \frac{\int_0^\infty B(\lambda)\,\text{d}\lambda}{\int_0^\infty P_\lambda(\lambda) \times B(\lambda)\,\text{d}\lambda}.
\end{aligned}
$$

Ciò sarà utile per i calcoli che faremo tra poco.


# Soluzione approssimata

Stimiamo $C$ per il problema dei dati DIRBE assumendo una banda “top-hat”:

$$
P_\nu(\nu) = \chi_{[\nu_0 - \Delta\nu/2, \nu_0 + \Delta\nu/2]},
$$

e uno spettro di corpo nero con $T = 3800\,\text{K}$:

$$
C \sim \frac{\int_0^\infty B_{bb}(\nu, T)\,\text{d}\nu}{\int_{\nu_0
    - \Delta\nu/2}^{\nu_0 + \Delta\nu/2} B_{bb}(\nu, T)\,\text{d}\nu}.
$$

L'integrale al numeratore è \(\propto \sigma T^4\) (ma non integriamo sull'angolo solido come nella formula di Stefan-Boltzmann), mentre quello al denominatore richiede un calcolo numerico.


# Calcolo analitico della correzione bolometrica

Ricordiamo l'espressione per la radianza spettrale di corpo nero:

$$
  B_{bb}(\nu, T) = \frac{2 h\nu^3}{c^2}\,\frac1{\exp\bigl(h\nu / k T\bigr) - 1},
$$

con \([B_{bb}] = \text{W/sr/m$^2$/Hz}\).

# Calcolo approssimato

Calcoliamo l'espressione di $C$ approssimando l'integrale con una somma:

$$
C \sim \frac{\int_0^\infty B_{bb}(\nu, T)\,\text{d}\nu}{\int_{\nu_0
    - \Delta\nu/2}^{\nu_0 + \Delta\nu/2} B_{bb}(\nu, T)\,\text{d}\nu} \approx
\frac{\sum_{i=0}^\infty B_{bb}(i \times \delta\nu, T)}{\sum_{i=i_1}^{i_2} B_{bb}(i \times \delta\nu, T)},
$$

dove $\delta\nu$ è il passo con cui campioniamo gli addendi.


# Calcolo approssimato

Oggi useremo [Julia](http://julialang.org/) per calcolare $C$.

Julia è un linguaggio di programmazione pensato per il calcolo scientifico, che permette di implementare i calcoli necessari al nostro scopo in maniera molto comoda e veloce.

Nelle prossime slide includo tutti i comandi necessari per effettuare i calcoli; è possibile anche guardare una registrazione sul sito [Asciinema](https://asciinema.org/a/0mBzdfUy3HYn9bLkRZxtoytyt), che usa la libreria [`UnicodePlots`](https://github.com/JuliaPlots/UnicodePlots.jl) per generare grafici da terminale (molto *nerd*!).


# Calcolo approssimato

Per usare Julia sul vostro computer, avviatelo col comando `julia` ed eseguite questi comandi per scaricare da Internet i pacchetti necessari ed installarli:

```julia
import Pkg
for name in ["PyPlot", "Interpolations", "GZip"]
    Pkg.add(name)
end
```


# Calcolo approssimato di $C$

Implementiamo la formula di corpo nero:

```julia
import PyPlot
const k, h, c = 1.38e-23, 6.626e-34, 3e8
# Write \lambda and press <TAB> to get λ
λ(ν) = c / ν
b(ν, T) = (2h*ν^3 / c^2) / (exp(h*ν / (k*T)) - 1)

let ν = 0.5e13:1e13:1e15
    PyPlot.plot(ν, b.(ν, 3800));
end
PyPlot.xlabel("Frequency [Hz]");
PyPlot.ylabel(raw"Spectral radiance [W/sr/m$^2$/Hz]");
```


# Calcolo approssimato

<center>![](blackbody.png)</center>


# Calcolo approssimato

Definiamo una funzione \texttt{C} che faccia il calcolo, ed eseguiamola per diversi valori del passo $\delta\nu$:

```julia
using Printf
function C(ν0, bwidth, T, δν)
    fullnu = 0.5e13:δν:1e15  # [0, ∞)
    partialnu = (ν0 - bwidth/2):δν:(ν0 + bwidth/2)
    sum(b.(fullnu, T)) / sum(b.(partialnu, T))
end

ν0, bwidth, T = c / 2.2e-6, 2.28e13, 3800
for δν in [1e13, 1e12, 1e11, 1e10, 1e9, 1e8]
    @printf("δν = %.0e Hz, T = %.1f K, C = %.2f\n",
            δν, T, C(ν0, bwidth, T, δν))
end
```



# Risultati del calcolo

```
δν = 1e+13 Hz, T = 3800.0 K, C = 15.58
δν = 1e+12 Hz, T = 3800.0 K, C = 20.16
δν = 1e+11 Hz, T = 3800.0 K, C = 20.19
δν = 1e+10 Hz, T = 3800.0 K, C = 20.27
δν = 1e+09 Hz, T = 3800.0 K, C = 20.28
δν = 1e+08 Hz, T = 3800.0 K, C = 20.28
```

È abbastanza diverso dal valore $C = 14.5$ riportato nell'articolo!


# Migliorare la stima di $C$

Ci sono due spiegazioni possibili per la discrepanza nel valore di $C$ che abbiamo osservato:
  
1. L'emissione delle stelle non segue esattamente una legge di
    corpo nero;
2. La banda di DIRBE non è perfettamente rettangolare.


# Spettro stellare

Per capire che correzione applicare, dobbiamo avere un'idea dello spettro di emissione del centro galattico.

Il centro galattico appare rosso, e il fatto che sia povero di gas indica un'età avanzata. Questi indizi suggeriscono che le stelle siano giganti rosse; una gigante rossa M0 ha $T \approx 3800\,\text{K}$ e $L \approx 400 L_\odot$.


# Catalogo di spettri stellari

<center>![](1998-pickles-title-page.svg)</center>


# Spettro stellare

Gli spettri di Pickles sono disponibili al sito
[www.eso.org/sci/facilities/paranal/decommissioned/isaac/tools/lib.html](https://www.eso.org/sci/facilities/paranal/decommissioned/isaac/tools/lib.html).

Noi scegliamo uno spettro «M iii», il file è `ukm0iii.dat.gz`, che è compresso usando il programma `gzip`.


# Contenuto del file

Si può ispezionare il contenuto del file decomprimendolo con `gunzip` e visualizzando le prime righe con `head`:

```
$ cat ukm0iii.dat.gz | gunzip | head
#iRMS=0.01722689532 0
#    lk ukf_m0iii uks_m0iii        fh        fk         fm
#
 1150.0  0.000000  0.000000  0.000000  0.000000  0.000000
 1155.0  0.000000  0.000000  0.000000  0.000000  0.000000
 1160.0  0.000000  0.000000  0.000000  0.000000  0.000000
 1165.0  0.000000  0.000000  0.000000  0.000000  0.000000
 1170.0  0.000000  0.000000  0.000000  0.000000  0.000000
 1175.0  0.000000  0.000000  0.000000  0.000000  0.000000
 1180.0  0.000000  0.000000  0.000000  0.000000  0.000000
```

Lo spettro è espresso in funzione di $\lambda$, non di $\nu$!



# Lettura dello spettro stellare

Le lunghezze d'onda sono espresse in \AA, così dobbiamo convertirle in metri. La densità di flusso è nella seconda colonna, ed è espressa in Jansky ($1\,\text{Jy} = 10^{-26}\,\text{W}/\text{m}^2/\text{Hz}$).

```julia
using DelimitedFiles
using GZip
spectrum = GZip.open("ukm0iii.dat.gz") do io
    readdlm(io, skipstart=3)
end
m0_λ_pts = spectrum[:, 1] * 1e-10
m0_flux_pts = spectrum[:, 2]

PyPlot.plot(m0_λ_pts, m0_flux_pts)
# Write \Angstrom and press <TAB> to get Å
PyPlot.xlabel("Wavelength [Å]");
PyPlot.ylabel("Flux density [Jy]");
```


# Spettro stellare

<center>![](stellar-spectrum.png)</center>


# Banda di DIRBE

Occorre ora avere la risposta in banda del canale a 2.2 µm di DIRBE, che si può scaricare qui:
  [lambda.gsfc.nasa.gov/product/cobe/c_spectral_res.cfm](https://lambda.gsfc.nasa.gov/product/cobe/c_spectral_res.cfm).



# Contenuto del file

```
$ head -n 20 DIRBE_SYSTEM_SPECTRAL_RESPONSE_TABLE.ASC
============================================================================
DIRBE SYSTEM SPECTRAL RESPONSE
Version:  Pass 3B data release, November 1996
          Only differs from the Pass 2B (1994) release in that wavelengths
          are now provided to three, rather than two, places after the
          decimal point.

This file tabulates normalized System Spectral Responses for the 10 DIRBE
photometric bands.
============================================================================


Wavelength                          DIRBE Band
  (um)    1      2      3      4      5      6      7      8      9      10
-----------------------------------------------------------------------------
  0.997   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00
  1.005   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00
  1.013   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00
  1.020   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00
  1.028   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00
```

A noi interessa la banda n. 2, ossia la terza colonna.


# Banda di DIRBE

Facciamo un grafico della banda (ancora espressa in termini di $\lambda$!), per renderci conto di come è fatto il dato:

```julia
dirbe_bands = readdlm("DIRBE_SYSTEM_SPECTRAL_RESPONSE_TABLE.ASC",
                      skipstart=15)

# Convert from μm to m
dirbe_λ = dirbe_bands[:, 1] * 1e-6
dirbe_band = dirbe_bands[:, 3]

PyPlot.plot(dirbe_λ, dirbe_band);
PyPlot.xlabel("Wavelength [m]");
```


# Banda di DIRBE

<center>![](dirbe_band_too_wide.png)</center>


# Banda di DIRBE

Meglio aggiustare la scala; mascheriamo tutti i valori della banda uguali a zero.

```julia
# Maschera di booleani: vera solo se
# la banda è maggiore di zero
mask = dirbe_band .> 0

PyPlot.plot(dirbe_λ[mask] * 1e6, dirbe_band[mask]);
# "raw" impedisce a Julia di interpretare "\mu"
PyPlot.xlabel(raw"Wavelength [$\mu$m]");
```


# Banda di DIRBE

<center>![](dirbe_band_ok.png)</center>

# Centro della banda

Calcoliamo il centro della banda di DIRBE, tramite la formula

$$
\lambda_0 = \frac{\int_0^\infty \lambda\times P_\lambda(\lambda)\,\text{d}\lambda}{\int_0^\infty P_\lambda(\lambda)\,\text{d}\lambda},
$$

che corrisponde a una media pesata.


```julia
@printf(
  "Band center: %.2f μm\n",
  1e6 * sum(dirbe_λ .* dirbe_band) / sum(dirbe_band),
)
```

Il risultato è 2.22 µm, che è quanto ci aspettavamo.



# Confronto tra spettro e banda

Anche se le unità di misure sono diverse, è interessante fare un grafico dello spettro stellare e della banda insieme.

```julia
PyPlot.plot(m0_λ_pts * 1e6, m0_flux_pts,
            label="M0 flux");
PyPlot.plot(dirbe_λ * 1e6, dirbe_band,
            label="DIRBE band");
PyPlot.xlim(0, 3);
PyPlot.xlabel("Wavelength [μm]");
PyPlot.ylabel("Flux density [Jy]");
PyPlot.legend();
```


# Confronto tra spettro e banda

<center>![](stellar-spectrum-and-band.png)</center>


# Calcolo di $C$

Abbiamo ora i dati per calcolare la correzione bolometrica $C$:

$$
C = \frac{\int_0^\infty B(\nu)\,\text{d}\nu}{\int_0^\infty B(\nu) \times P_\nu(\nu)\,\text{d}\nu}
= \frac{\int_0^\infty F(\lambda)\,\text{d}\lambda}{\int_0^\infty F(\lambda) \times P_\lambda(\lambda)\,\text{d}\lambda},
$$

dove siamo passati da $B$ a $F$, e da $\nu$ a $\lambda$.

Avendo noi un campionamento discreto per $F$ e $P$, convertiremo gli integrali in somme:

$$
C \approx = \frac{\sum_i F(\lambda_i)\,\text{d}\lambda}{\sum_i F(\lambda_i) \times P_\lambda(\lambda)\,\text{d}\lambda}
$$


# Campionamento di $B$ e di $P$

C'è però un problema nel campionamento delle curve, evidente se si fa un ingrandimento del grafico precedente:

```julia
PyPlot.scatter(m0_λ_pts * 1e6, m0_flux_pts,
               label="M0 flux", s=0.2);
PyPlot.scatter(dirbe_λ * 1e6, dirbe_band,
               label="DIRBE band");

PyPlot.xlim(2.0, 2.2);

PyPlot.xlabel("Wavelength [μm]");
PyPlot.ylabel("Flux density [Jy]");
PyPlot.legend();
```


# Campionamento di $B$ e di $P$

<center>![](interpolation-wrong.png)</center>


# Campionamento di $B$ e di $P$

Dobbiamo ricampionare la curva meno fitta ($P$) in modo che passi attraverso le stesse ascisse di $B$. Usiamo una libreria di Julia, [`Interpolations`](https://github.com/JuliaMath/Interpolations.jl), per implementare un'interpolazione lineare:

```julia
using Interpolations
# dirbe_band_interp: funzione con argomento λ
dirbe_band_interp = LinearInterpolation(
    dirbe_λ,
    dirbe_band,
    extrapolation_bc=Flat(),
)
```

# Campionamento di $B$ e di $P$

Verifichiamo ora il funzionamento dell'interpolazione:

```julia
PyPlot.scatter(m0_λ_pts * 1e6, m0_flux_pts,
               label="M0 flux", s=2);
PyPlot.scatter(dirbe_λ * 1e6, dirbe_band,
               label="DIRBE band");
PyPlot.scatter(m0_λ_pts * 1e6,
               dirbe_band_interp.(m0_λ_pts),
               label="DIRBE band (interpolated)", s=2);

PyPlot.xlim(2.02, 2.07);

PyPlot.xlabel("Wavelength [μm]");
PyPlot.ylabel("Flux density [Jy]");
```


# Campionamento di $B$ e di $P$

<center>![](interpolation-right.png)</center>


# Calcolo di $C$

Per calcolare $C$, applichiamo la formula

$$
C \approx = \frac{\sum_i B(\lambda_i)\,\text{d}\lambda}{\sum_i B(\lambda_i) \times P_\lambda(\lambda)\,\text{d}\lambda}.
$$

```julia
C(flux, band) = sum(flux) / sum(flux .* band)
@printf(
    "Bolometric correction: %.2f\n",
    C(m0_flux_pts, dirbe_band_interp.(m0_λ_pts)),
)
```

Il risultato è

```
Bolometric correction: 14.55
```

# Dipendenza del risultato dalle assunzioni

La prima stima che avevamo fornito per $C$ era 20, basata sulla formula

$$
C \sim \frac{\int_0^\infty B_{bb}(\nu, T)\,\text{d}\nu}{\int_{\nu_0
    - \Delta\nu/2}^{\nu_0 + \Delta\nu/2} B_{bb}(\nu, T)\,\text{d}\nu},
$$

che approssimava sia la banda di DIRBE che lo spettro stellare.

Qual è l'importanza relativa delle due assunzioni nel determinare la soluzione finale?


# Spettro realistico, banda ideale

Rifacciamo il calcolo usando la banda ideale ma lo spettro realistico:

```julia
tophat_band = zeros(length(m0_λ_pts))

let (λ1, λ2) = (λ(ν0 + Δν/2), λ(ν0 - Δν/2))
    # In Julia è possibile scrivere "a < x < b"
    # anziché "(a < x) && (x < b)"
    tophat_band[λ1 .< m0_λ_pts .< λ2] .= 1
end

PyPlot.plot(m0_λ_pts, tophat_band);
```


# Spettro realistico, banda ideale

<center>![](tophat-band.png)</center>


# Spettro realistico, banda ideale

Calcoliamo ora $C$ in questo caso:

```julia
@printf("C = %.2f\n", C(m0_flux_pts, tophat_band))
```

Il risultato è:

```
C = 13.99
```



# Spettro ideale, banda realistica

Facciamo ora il calcolo inverso: usiamo uno spettro di corpo nero e la banda effettiva di DIRBE. Ci occorre la formula del corpo nero in funzione di $\lambda$:

$$
B(\lambda, T) = \frac{2hc^2}{\lambda^5} \frac1{e^{hc / \lambda kT} - 1}.
$$


```julia
bλ(λ, T) = (2h*c^2 / λ^5) / (exp(h*c / (λ*k*T)) - 1))
```


# Spettro ideale, banda realistica

Facciamo ora il calcolo:

```julia
@printf(
    "C = %.2f\n",
    C(bλ.(m0_λ_pts, T), dirbe_band_interp.(m0_λ_pts)),
)
```

Il risultato è:

```
C = 18.90
```
