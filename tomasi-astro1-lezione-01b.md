---
title: Lezione di astronomia 1b
author: Maurizio Tomasi ([maurizio.tomasi@unimi.it](mailto:maurizio.tomasi@unimi.it))
date: 15 Ottobre 2021
...


# Calcolo delle correzioni bolometriche

Nella [lezione precedente](tomasi-astro1-lezione-01a.html) abbiamo calcolato la luminosità totale del centro galattico a partire da misurazioni dello strumento DIRBE.

[Abbiamo però usato](tomasi-astro1-lezione-01a.html#/dal-flusso-alla-luminosità) una stima della correzione bolometrica $C$ senza capire come fosse ricavata. Ora colmeremo questa lacuna.


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

Le altre quantità che servono per calcolare $C$ cambiano se si passa da $\nu$ a $\lambda$?


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

L'energia ricevuta da un rivelatore resta la stessa se si usa $\nu$ o $\lambda$, quindi

$$
\int_0^\infty P_\nu(\nu) \times B(\nu)\,\text{d}\nu =
\int_0^\infty P_\lambda(\lambda) \times B(\lambda)\,\text{d}\lambda.
$$

Se $B(\nu)\,\text{d}\nu = B(\lambda)\,\text{d}\lambda$ allora

$$
\int_0^\infty P_\nu(\nu) \times B(\nu)\,\text{d}\nu =
\int_0^\infty P_\lambda\bigl(\lambda(\nu)\bigr) \times B(\nu)\,\text{d}\nu,
$$

che è vero se $P_\lambda(\lambda) = P_\lambda(c / \nu) = P_\nu(\nu)$. Quindi la forma analitica della banda non cambia, basta sostituire $\lambda \rightarrow c/\nu$.


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
C \approx \frac{\int_0^\infty B_{bb}(\nu, T)\,\text{d}\nu}{\int_{\nu_0
    - \Delta\nu/2}^{\nu_0 + \Delta\nu/2} B_{bb}(\nu, T)\,\text{d}\nu}.
$$

L'integrale al numeratore è \(\propto \sigma T^4\) (ma non integriamo su $\Omega$ come nella formula di Stefan-Boltzmann), mentre il denominatore richiede un calcolo numerico.


# Calcolo analitico della correzione bolometrica

Ricordiamo l'espressione per la radianza spettrale di corpo nero:

$$
  B_{bb}(\nu, T) = \frac{2 h\nu^3}{c^2}\,\frac1{\exp\bigl(h\nu / k T\bigr) - 1},
$$

con \([B_{bb}] = \text{W/sr/m$^2$/Hz}\).

# Calcolo approssimato

L'espressione di $C$ non è calcolabile analiticamente a causa dell'integrale al denominatore, ma possiamo valutarla approssimando gli integrali con somme:

$$
C \approx \frac{\int_0^\infty B_{bb}(\nu, T)\,\text{d}\nu}{\int_{\nu_0
    - \Delta\nu/2}^{\nu_0 + \Delta\nu/2} B_{bb}(\nu, T)\,\text{d}\nu} \approx
\frac{\sum_{i=0}^\infty B_{bb}(i \times \delta\nu, T)}{\sum_{i=i_1}^{i_2} B_{bb}(i \times \delta\nu, T)},
$$

dove $\delta\nu$ è il passo con cui campioniamo gli addendi (semplificato nell'espressione perché compare sia al numeratore che al denominatore).


# Julia

Oggi useremo [Julia](http://julialang.org/) per calcolare la correzione bolometrica $C$.

Julia è un linguaggio di programmazione pensato per il calcolo scientifico, che permette di implementare i calcoli necessari al nostro scopo in maniera molto comoda e veloce.

Nelle prossime slide includo tutti i comandi necessari per effettuare i calcoli; è possibile anche guardare una vecchia registrazione sul sito [Asciinema](https://asciinema.org/a/0mBzdfUy3HYn9bLkRZxtoytyt), che usa la libreria [`UnicodePlots`](https://github.com/JuliaPlots/UnicodePlots.jl) per generare grafici da terminale (molto *nerd*!).

Useremo l'interfaccia [JupyterLab](https://jupyter.org/), che è accessibile da Julia attraverso il pacchetto [IJulia](https://github.com/JuliaLang/IJulia.jl). Vediamo come installarla.


# Installazione di JupyterLab

<asciinema-player src="cast/install-ijulia-73x21.cast" cols="73" rows="21" font-size="medium"></asciinema-player>

# Installazione di librerie

Una volta installato Julia e fatto partire IJulia, potrete creare un *notebook* (vedi video seguente). I comandi nel *notebook* si scrivono all'interno di *celle*, che si eseguono premendo `Maiusc + Invio`.

Inizieremo scaricando da Internet una serie di librerie molto utili:

```julia
import Pkg
# Download and install these libraries:
# - GZip: work with .gz compressed files
# - Interpolations: create interpolating functions from discrete data
# - Plots: guess what?
for name in ["GZip", "Interpolations", "Plots"]
    Pkg.add(name)
end
```

# Calcolo approssimato di $C$

La prima cosa che facciamo è implementare la formula di corpo nero $B_{bb}(\nu, T)$ (v. il video):

```julia
import Plots
const k, h, c = 1.38e-23, 6.626e-34, 3e8
# Write \lambda and press <TAB> to get λ
λ(ν) = c / ν
b(ν, T) = (2h*ν^3 / c^2) / (exp(h*ν / (k*T)) - 1)

let ν = 0.5e13:1e13:1e15
    plot(ν, b.(ν, 3800), 
    label = "", xlabel = "Frequency [Hz]", ylabel = "Spectral radiance [W/sr/m²/Hz]")
end
```
---

<iframe src="https://player.vimeo.com/video/632187442?h=3e91fe6ed4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" width="1280" height="720" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="julia-recording-01 - Installation and blackbody.mkv"></iframe>

---

<center>![](./images/blackbody.svg){width=80%}</center>

# Calcolo approssimato

Definiamo una funzione \texttt{C} che calcoli la correzione bolometrica $C$ con la formula

$$
C \approx \frac{\sum_{i=0}^\infty B_{bb}(i \times \delta\nu, T)}{\sum_{i=i_1}^{i_2} B_{bb}(i \times \delta\nu, T)},
$$

```julia
function C(ν0, bwidth, T, δν)
    fullnu = 0.5e13:δν:1e15  # [0, ∞)
    partialnu = (ν0 - bwidth/2):δν:(ν0 + bwidth/2)
    sum(b.(fullnu, T)) / sum(b.(partialnu, T))
end
```

# Calcolo approssimato

Dobbiamo decidere il valore del passo $\delta\nu$; proviamo con una serie di valori via via più piccoli, e vediamo quando converge:

```julia
ν0, bwidth, T = c / 2.2e-6, 2.28e13, 3800
for δν in [1e13, 1e12, 1e11, 1e10, 1e9, 1e8]
    @printf("δν = %.0e Hz, T = %.1f K, C = %.2f\n",
            δν, T, C(ν0, bwidth, T, δν))
end
```

(Vedi il video).

---

<iframe src="https://player.vimeo.com/video/632189138?h=844ad3079a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" width="1280" height="720" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="julia-recording-02 - Simple bolometric constant.mkv"></iframe>

# Risultati del calcolo

```
δν = 1e+13 Hz, T = 3800.0 K, C = 15.58
δν = 1e+12 Hz, T = 3800.0 K, C = 20.16
δν = 1e+11 Hz, T = 3800.0 K, C = 20.19
δν = 1e+10 Hz, T = 3800.0 K, C = 20.27
δν = 1e+09 Hz, T = 3800.0 K, C = 20.28
δν = 1e+08 Hz, T = 3800.0 K, C = 20.28
```

Converge senza dubbio, ma è abbastanza diverso dal valore $C = 14.5$ riportato nell'articolo!


# Migliorare la stima di $C$

Ci sono due spiegazioni possibili per la discrepanza nel valore di $C$ che abbiamo osservato:
  
#. La banda di DIRBE non è perfettamente rettangolare.

#. L'emissione delle stelle non segue esattamente una legge di
    corpo nero.

# Banda di DIRBE

Occorre avere la risposta in banda del canale a 2.2 µm di DIRBE, che si può scaricare qui:
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
dirbe_bands = readdlm(
    "DIRBE_SYSTEM_SPECTRAL_RESPONSE_TABLE.ASC",
    skipstart=15,
)

# Convert from μm to m
dirbe_λ = dirbe_bands[:, 1] * 1e-6
dirbe_band = dirbe_bands[:, 3]

plot(dirbe_λ, dirbe_band,
     xlabel = "Wavelength [m]")
```

(Vedi il video).

---

<iframe src="https://player.vimeo.com/video/632190633?h=4b16990d2c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" width="1280" height="720" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="julia-recording-03 - DIRBE band.mkv"></iframe>

---

<center>![](./images/dirbe_band_too_wide.svg){width=80%}</center>


# Banda di DIRBE

Meglio aggiustare la scala; mascheriamo tutti i valori della banda uguali a zero.

```julia
# Maschera di booleani: vera solo se
# la banda è maggiore di zero
mask = dirbe_band .> 0

plot(dirbe_λ[mask] * 1e6, dirbe_band[mask],
    xlabel = "Wavelength [$\mu$m]")
```

(Vedi il video).

---

<iframe src="https://player.vimeo.com/video/632213391?h=1dde8edbfe&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" width="1280" height="720" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="julia-recording-04 - DIRBE band zoomed.mkv"></iframe>

---

<center>![](./images/dirbe_band_ok.svg){width=80%}</center>


# Centro della banda

Calcoliamo il centro della banda di DIRBE, tramite la formula

$$
\lambda_0 = \frac{\int_0^\infty \lambda\times P_\lambda(\lambda)\,\text{d}\lambda}{\int_0^\infty P_\lambda(\lambda)\,\text{d}\lambda} \approx
\frac{\sum_{i=1}^N \lambda_i \times P_\lambda(\lambda_i)}{\sum_{i=1}^N P_\lambda(\lambda_i)},
$$

che corrisponde a una media pesata.


```julia
@printf(
  "Band center: %.2f μm\n",
  1e6 * sum(dirbe_λ .* dirbe_band) / sum(dirbe_band),
)
```

Il risultato è 2.22 µm, che è quanto ci aspettavamo.


# Spettro stellare

Dobbiamo anche avere un'idea più precisa dello spettro di emissione del centro galattico.

Il centro galattico appare rosso, e il fatto che sia povero di gas indica un'età avanzata. Questi indizi suggeriscono che le stelle siano giganti rosse; una gigante rossa M0 ha $T \approx 3800\,\text{K}$ e $L \approx 400 L_\odot$.

Per conoscere qual è lo spettro di una gigante rossa M0, dobbiamo fare affidamento a un catalogo di spettri stellari.

# Catalogo di spettri stellari

<center>![](./images/1998-pickles-title-page.svg){width=75%}</center>


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

Le lunghezze d'onda sono espresse in Å, così dobbiamo convertirle in metri. La densità di flusso è nella seconda colonna, ed è espressa in Jansky ($1\,\text{Jy} = 10^{-26}\,\text{W}/\text{m}^2/\text{Hz}$).

```julia
using DelimitedFiles
using GZip
spectrum = GZip.open("ukm0iii.dat.gz") do io
    readdlm(io, skipstart=3)
end
m0_λ_pts = spectrum[:, 1] * 1e-10
m0_flux_pts = spectrum[:, 2]

plot(m0_λ_pts, m0_flux_pts,
    xlabel = "Wavelength [Å]",
    ylabel = "Flux density [Jy]")
```

---

<center>![](./images/stellar-spectrum.svg){width=80%}</center>


# Confronto tra spettro e banda

Anche se le unità di misura sono diverse, è interessante fare un grafico dello spettro stellare e della banda insieme.

```julia
plot(m0_λ_pts * 1e6, m0_flux_pts,
    label = "M0 flux",
    xlim = (0, 3),
    xlabel = "Wavelength [μm]",
    ylabel = "Flux density [Jy]",
)
plot!(dirbe_λ * 1e6, dirbe_band,
    label = "DIRBE band")
```

La frequenza a 2.2 µm non è centratissima: DIRBE ha la [frequenza a 1.25 µm](tomasi-astro1-lezione-01a.html#/dwek-et-al.-apj-1995) che sarebbe più adatta…

---

<center>![](./images/stellar-spectrum-and-band.svg){width=80%}</center>


# Calcolo di $C$

In teoria saremmo pronti per calcolare la correzione bolometrica $C$:

$$
C = \frac{\int_0^\infty B(\nu)\,\text{d}\nu}{\int_0^\infty B(\nu)\,\text{d}\nu \times P_\nu(\nu)}
= \frac{\int_0^\infty F(\lambda)\,\text{d}\lambda}{\int_0^\infty F(\lambda)\,\text{d}\lambda \times P_\lambda(\lambda)},
$$

dove siamo passati da $B$ (densità spettrale) a $F$ (densità di flusso), e da $\nu$ a $\lambda$. Ovviamente dobbiamo però convertire gli integrali in somme:

$$
C \approx = \frac{\sum_i F(\lambda_i)\,\text{d}\lambda}{\sum_i F(\lambda_i)\,\text{d}\lambda \times P_\lambda(\lambda_i)}
$$


# Campionamento (1/4)

Non possiamo però applicare subito la formula per $C$.

C'è infatti un problema nel campionamento delle curve, evidente se si fa un ingrandimento del grafico precedente:

```julia
scatter(m0_λ_pts * 1e6, m0_flux_pts,
        xlim = (2.0, 2.2),
        label="M0 flux",
        xlabel="Wavelength [µm]",
        ylabel = "Flux density [Jy]",ù
        markersize=1)
scatter!(dirbe_λ * 1e6, dirbe_band,
         label="DIRBE band")
```

---

<center>![](./images/interpolation-wrong.svg){width=80%}</center>


# Campionamento (2/4)

Nella formula per $C$, dobbiamo valutare il prodotto $F(\lambda_i)\,\text{d}\lambda \times P_\lambda(\lambda_i)$ per gli stessi valori di $\lambda_i$:

$$
C \approx = \frac{\sum_i F(\lambda_i)\,\text{d}\lambda}{\sum_i F(\lambda_i)\,\text{d}\lambda \times P_\lambda(\lambda_i)}
$$

Ma qui ci sono dei valori di $\lambda_i$ per cui $P(\lambda_i)$ è ignoto!


# Campionamento (3/4)

Dobbiamo ricampionare la curva meno fitta ($P$) in modo che passi attraverso le stesse ascisse di $F$. Usiamo una libreria di Julia, [`Interpolations`](https://github.com/JuliaMath/Interpolations.jl), per implementare un'interpolazione lineare:

```julia
using Interpolations

# dirbe_band_interp: funzione con argomento λ
dirbe_band_interp = LinearInterpolation(
    dirbe_λ,
    dirbe_band,
    extrapolation_bc=Flat(),
)
```

(Vedi video).

---

<iframe src="https://player.vimeo.com/video/632196520?h=dcd2aaa910&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" width="1280" height="720" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="julia-recording-09 - Interpolation.mkv"></iframe>

# Campionamento (4/4)

Verifichiamo ora il funzionamento dell'interpolazione:

```julia
scatter(m0_λ_pts * 1e6, m0_flux_pts,
        label="M0 flux",
        xlim = (2.02, 2.07),
        xlabel = "Wavelength [µm]",
        ylabel = "Flux density [Jy]",
        markersize = 2,
)
scatter!(dirbe_λ * 1e6, dirbe_band,
         label="DIRBE band", markersize=8);
scatter!(m0_λ_pts * 1e6, dirbe_band_interp.(m0_λ_pts),
         label="DIRBE band (interpolated)",
         markersize=2)
```

(Vedi il video).

---

<iframe src="https://player.vimeo.com/video/632196520?h=dcd2aaa910&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" width="1280" height="720" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="julia-recording-09 - Interpolation.mkv"></iframe>

---

<center>![](./images/interpolation-right.svg){width=80%}</center>


# Calcolo di $C$

Per calcolare $C$, applichiamo la formula

$$
C \approx = \frac{\sum_i F(\lambda_i)\,\text{d}\lambda}{\sum_i F(\lambda_i)\,\text{d}\lambda \times P_\lambda(\lambda_i)}.
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

in perfetto accordo con quanto usato da Dwek et al. (1995).

# Dipendenza dalle assunzioni

La prima stima che avevamo fornito per $C$ era basata sulla formula

$$
C \approx \frac{\int_0^\infty B_{bb}(\nu, T)\,\text{d}\nu}{\int_{\nu_0
    - \Delta\nu/2}^{\nu_0 + \Delta\nu/2} B_{bb}(\nu, T)\,\text{d}\nu} \approx 20.28,
$$

che usava un'approssimazione sia per la banda di DIRBE che per lo spettro stellare.

Qual è l'importanza relativa delle due assunzioni nel determinare la soluzione finale?


# Spettro realistico, banda ideale

Rifacciamo il calcolo usando la banda ideale ma lo spettro realistico:

```julia
tophat_band = zeros(length(m0_λ_pts))  # Vector of zeros

let (λ1, λ2) = (λ(ν0 + Δν/2), λ(ν0 - Δν/2))
    # In Julia you can write "a < x < b" instead of "(a < x) && (x < b)"
    tophat_band[λ1 .< m0_λ_pts .< λ2] .= 1 # Set to 1 the points within the interval
end

plot(m0_λ_pts * 1e6, tophat_band,
     label = "Top-hat band",
     xlabel = "Wavelength [µm]",
     legend = :topleft)
plot!(dirbe_λ[mask] * 1e6, dirbe_band[mask],
      label = "True DIRBE band")
```


---

<center>![](./images/tophat-band.svg){width=80%}</center>


# Spettro realistico, banda ideale

Calcoliamo ora $C$ in questo caso:

```julia
@printf("C = %.2f\n", C(m0_flux_pts, tophat_band))
```

Il risultato è:

```
C = 13.99
```

che mostra che l'approssimazione della banda ideale conta molto poco!


# Spettro ideale, banda realistica

Consideriamo ora la seconda ipotesi: usiamo uno spettro di corpo nero e la banda effettiva di DIRBE.

Ci occorre la formula del corpo nero in funzione di $\lambda$:

$$
B(\lambda, T) = \frac{2hc^2}{\lambda^5} \frac1{e^{hc / \lambda kT} - 1}.
$$

che in Julia si implementa così:

```julia
bλ(λ, T) = (2h * c^2 / λ^5) / (exp(h*c / (λ*k*T)) - 1))
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

Quindi l'approssimazione dello spettro di corpo nero è decisamente grossolana per una stella di questo tipo!


# Avvisi

# Questionari per la didattica

Preoccupatevi di compilare con cura i questionari! Sono esaminati una volta all'anno dalla Commissione Paritetica Docenti-Studenti, e i risultati sono presi molto sul serio.

Dovrete dare una valutazione per il corso e per queste esercitazioni. Se potete, date un vostro giudizio (nei commenti liberi) sull'utilità di queste lezioni di approfondimento rispetto alle lezioni nel loro complesso, e mettetelo nei commenti generali del corso.
