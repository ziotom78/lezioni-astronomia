---
title: "Lezione di astronomia 2"
author: "Maurizio Tomasi ([maurizio.tomasi@unimi.it](mailto:maurizio.tomasi@unimi.it))"
date: "24 Novembre 2023"
css:
- ./css/custom.css
...

# Teoria dei sistemi binari

# Sistemi binari

-   I sistemi binari sono fondamentali per permettere la determinazione della *massa delle stelle*.

-   A parte quei pochi sistemi in cui si può usare il lensing gravitazionale, sono gli unici casi in cui sia possibile determinare la massa di una stella.

# Osservazione di sistemi binari

<center>![](./images/circular_orbit_inclination.png)</center>

Per binarie ad eclisse, $i \approx 90^\circ$.


# Osservazione di sistemi binari

<iframe width="1120" height="630" src="https://www.youtube.com/embed/6MyBy-jObrY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


# Osservazione di sistemi binari



<table>
    <tr>
        <td style="vertical-align:middle">
            ![](./images/circular_orbit.png)
        </td>
        <td>

-   Nel sistema del c.d.m.\ vale che
    $$
    \begin{cases}
      M_1 v_1 &= M_2 v_2, \\
      \frac{2\pi r_1}{v_1} &= \frac{2\pi r_2}{v_2} = P,
    \end{cases} \Rightarrow \frac{r_1}{r_2} = \frac{v_1}{v_2} = \frac{M_2}{M_1}.
    $$

-   Dalle leggi di Newton ricaviamo che
    $$
    \begin{cases}
      G \frac{M_1 M_2}{R^2} = M_1 \frac{v_1^2}{r_1}, \\
      G \frac{M_1 M_2}{R^2} = M_2 \frac{v_2^2}{r_2},
    \end{cases} \Rightarrow M_1 + M_2 = \frac{P \bigl(v_1 + v_2\bigr)^3}{2\pi G}.
    $$
        </td>
    </tr>
</table>


# Osservazione di sistemi binari

Le equazioni
$$
\begin{aligned}
      \frac{r_1}{r_2} &= \frac{v_1}{v_2} = \frac{M_2}{M_1}, \\
      M_1 + M_2 &= \frac{P}{2\pi G} \bigl(v_1 + v_2\bigr)^3
\end{aligned}
$$
descrivono la dinamica di un sistema binario con orbite circolari.


# Osservazione di sistemi binari

-   Dalla Terra possiamo misurare facilmente queste quantità:

    1.  $v_{r1} \equiv v_1 \sin i$, $v_{r2} \equiv v_2 \sin i$;
    2.  Il periodo dell'orbita $P$.

-   Determinare $r_1$ ed $r_2$ è estremamente difficile.

-   In termini di $v_{r1}$ e $v_{r2}$, la seconda equazione diventa

    $$
    M_1 + M_2 = \frac{P}{2\pi G} \frac{\bigl(v_{r1} + v_{r2}\bigr)^3}{\sin^3 i}.
    $$


# Metodi numerici

L'equazione analitica è utile solo per mettere in relazione diverse quantità fisiche. Per ridurre misurazioni da telescopio si usano invece metodi numerici, più robusti e in grado anche di tenere conto di altri effetti:

#.  Ellitticità delle orbite;
#.  Deformazione della stella causata dalla rotazione (importante nelle eclissi);
#.  Limb darkening (minore luminosità al bordo);
#.  Gravity darkening (minore temperatura all'Equatore a causa del rigonfiamento rotazionale);
#.  Mutua interazione gravitazionale tra le due stelle (forze mareali);
#.  Etc.


# Metodi numerici

<center>![](./images/1971Wilson-title.png){width=60%}</center>

---

Il codice di Wilson & Devinney era stato scritto per [IBM System/360 Model 91](https://en.wikipedia.org/wiki/IBM_System/360_Model_91):

<center>![](images/360-91-panel.jpg){width=60%}</center>

<p style="text-align:right">Fonte: [Wikipedia](https://en.wikipedia.org/wiki/IBM_System/360_Model_91#/media/File:360-91-panel.jpg)</p>


# Il sistema CV Velorum

# Il sistema binario CV Velorum

-   È un sistema binario spettroscopico per il quale sono visibili anche eclissi. (Costellazione della Vela, nel cielo australe).

-   È un sistema molto interessante, studiato in più lavori. Quelli a cui facciamo riferimento noi sono:

    -   Andersen (A&A 44, 1975, pagg. 355–362);
    -   Clausen & Grønbeck (A&A 58, 1977, pagg. 131–137);
    -   Yakut et al. (A&A 467, 2007, pagg. 647 655).


# Periodo dell'orbita

Il periodo è stato determinato da Andersen (1975) e Clausen \& Grønbeck (1977). Noi facciamo riferimento a quest'ultimo.

<center>![](./images/1977-clausen-1.png){width=60%}</center>


# Filtri e stelle calibratrici

<center>![](./images/1977-clausen-2.png){width=50%}</center>

---

<center>![](./images/CV-Vel-two-reference-stars.svg){width=50%}</center>

# Tabella delle magnitudini

<center>![](./images/1977-clausen-3.png){width=60%}</center>


---

<center>![](./images/1977-clausen-4.png){width=40%}</center>

---

Cosa si può dedurre sul sistema binario CV Velorum dal grafico precedente a proposito delle due stelle che lo compongono e della loro orientazione nello spazio?


# Caratteristiche di CV Vel

-   Le due stelle hanno luminosità e raggio simile…
-   …quindi probabilmente il centro delle orbite coincide col centro di massa…
-   …quindi le due stelle hanno velocità orbitali uguali in modulo.
-   Clausen \& Grønbeck stimano il periodo col numero
    $$
    P = 6.889\ 494\,\text{d}.
    $$


# Spettroscopia di CV Velorum

Nel 2007 Yakut et al.\ hanno pubblicato un lavoro in cui si fa un'analisi spettroscopica di CV Velorum.

---

<center>![](./images/2007-yakut-first-page.png){width=80%}</center>

---

<table>
    <tr>
        <td style="vertical-align:middle">![](./images/2007-yakut-SiIII-HeI.png){width=14000px}</td>
        <td style="vertical-align:middle">Determiniamo la velocità radiale massima $v_r$ dalla riga di SiIII e di HeI, assumendo che i grafici mostrino i due estremi delle oscillazioni Doppler delle righe.</td>
    </tr>
</table>


# Effetto Doppler

-   Quando la velocità radiale è massima ($\pm v_r$), le lunghezze d'onda sono:
    $$
    \begin{aligned}
      \lambda_1 &=& \frac{c + v_0 + v_r}c \lambda_0, \\
      \lambda_2 &=& \frac{c + v_0 - v_r}c \lambda_0,
    \end{aligned}
    $$
    
-   Da ciò segue che
    $$
    v_0 = \left(\frac{\lambda_1 + \lambda_2}{2\lambda_0} - 1\right) c, \quad v_r = c \frac{\Delta \lambda}{2 \lambda_0}.
    $$


# Velocità radiale (SiIII)

$$
\begin{aligned}
v_0 &=& \left(\frac{4553.0\,\mathring{\mathrm{A}}}{4552.6\,\mathring{\mathrm{A}}}\right) c \approx 26.3\,\text{km\,s$^{-1}$},\\
v_r &=& c \frac{4555.0\,\mathring{\mathrm{A}} - 4551.0\,\mathring{\mathrm{A}}}{2 \times 4552.6\,\mathring{\mathrm{A}}} \approx
132\,\text{km\,s$^{-1}$}.
\end{aligned}
$$

# Velocità radiale (HeI)

$$
\begin{aligned}
v_0 &=& \left(\frac{6678.75\,\mathring{\mathrm{A}}}{6678.1\,\mathring{\mathrm{A}}}\right) c \approx 29.2\,\text{km\,s$^{-1}$},\\
v_r &=& c \frac{6681.5\,\mathring{\mathrm{A}} - 6676.0\,\mathring{\mathrm{A}}}{2 \times 6678.1\,\mathring{\mathrm{A}}} \approx
123\,\text{km\,s$^{-1}$}.
\end{aligned}
$$


# Velocità radiale

-  Il valor medio delle nostre stime di $v_r$ è
   $$
   \left<v_r\right> = 128\,\text{km\,s$^{-1}$}.
   $$

-  Yakut et al.\ citano $v_1 = 126\,\text{km\,s$^{-1}$}$ e $v_2 = 128\,\text{km\,s$^{-1}$}$.



# Velocità stimate da Yakut et al.

<center>![](./images/2007-yakut-velocity.png){width=40%}</center>

(Perché i dati formano dei cluster?)


# Determinazione delle masse

-   Se $v_1 = v_2 = v_r$ e $i = 90^\circ$, allora
    $$
    M_1 + M_2 = \frac{P}{2\pi G} \bigl(2 v_r \bigr)^3
    $$

-   La massa totale è
    $$
    M_1 + M_2 = \frac{6.89\,\text{d}\,(2 \cdot
    128\,\text{km/s})^3}{2\pi\cdot6.67\times10^{-11}\text{N m$^2$/kg$^2$}} = 11.2\,M_\odot.
    $$

-   Se le due stelle sono simili, assumiamo che $M_1 \approx M_2 \approx 5.6\,M_\odot$.



# Parametri orbitali (Yakut et al.)

<center>![](./images/2007-yakut-table.png){width=70%}</center>

(Notare le discrepanze in $V_0$, non ancora spiegate).


---

<table>
    <tr>
        <td>![](./images/2007-yakut-line.png){width=80%}</td>
        <td style="vertical-align:middle">Quale stella ruota più velocemente?</td>
    </tr>
</table>


# Classe spettrale

<table>
    <tr>
        <td>![](./images/2007-yakut-mass-luminosity.png)</td>
        <td style="vertical-align:middle">Sono stelle di tipo B ($T \approx 18\,000\,\text{K}$).</td>
    </tr>
</table>


# Il database [SIMBAD](http://simbad.u-strasbg.fr/simbad/)

<center>![](./images/simbad-1.png){width=50%}</center>


# Il database [SIMBAD](http://simbad.u-strasbg.fr/simbad/)

<center>![](./images/simbad-2.png){width=50%}</center>


# Il database [SIMBAD](http://simbad.u-strasbg.fr/simbad/)

<center>![](./images/simbad-cv-vel-1.png){width=50%}</center>


# Il database [SIMBAD](http://simbad.u-strasbg.fr/simbad/)

<center>![](./images/simbad-cv-vel-2.png){width=50%}</center>


# Yakut et al. (2014)

<center>![](./images/2014Yakut-corrigendum.png){width=50%}</center>


# Come vanno di solito le cose


# Williams et al.\ (ApJ, 2013)

<center>![](./images/2013-williams-title.png){width=70%}</center>


# HDE 229232

<center>![](./images/2013-williams-plot-HDE229232.png){width=85%}</center>


# HDE 308813

<center>![](./images/2013-williams-plot-HDE308813.png){width=85%}</center>
