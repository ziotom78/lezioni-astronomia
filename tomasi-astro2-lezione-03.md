---
title: "Lezione di Astronomia II – 3"
author: "Maurizio Tomasi ([maurizio.tomasi@unimi.it](mailto:maurizio.tomasi@unimi.it))"
date: "30 Marzo 2023"
css:
- ./css/custom.css
...

# Il mezzo interstellare (ISM)

# Il piano galattico

L'evidenza del mezzo interstellare (*interstellar medium*, ISM) è data dalla presenza di regioni opache sul piano galattico, con uno spessore di $\sim 100\div500$ pc.

<center>![](images/milky-way-plane.jpg){height=420px}</center>


# Il disco gassoso

<center>![](images/milky-way-and-gaseous-disk.png){height=520px}</center>

<small>Adattato da B.\ Draine, *Physics of the interstellar and galactic medium*, Princeton University Press (2011).</small>

# Globuli e nubi

Il mezzo interstellare mostra addensamenti di materia la cui scala è
circa $\sim 1$ pc («globuli» e «nubi»).

<center>![](images/barnard68.jpg){height=420px}</center>

<small>Barnard 68 («Black cloud»)</small>


# Il mezzo interstellare

Ci sono due motivi per cui ISM è interessante:

#.  Contiene una parte importante della massa della Galassia ($10^{10}\,M_\odot$);
#.  È un luogo di formazione stellare:
    \[
      \begin{aligned}
        t_\text{O-star} &< 1\,\text{Gyr},\\
        t_\text{Via Lattea} \sim \max t_\text{gc} &\gtrsim
        10\,\text{Gyr}.
      \end{aligned}
    \]
    Quindi il fatto che oggi si osservino stelle O nella Via Lattea implica che la formazione stellare sia ancora in corso.

# Barioni nella Via Lattea

<center>![](images/ism-and-stars.png){height=520px}</center>

<small>Adattato da B.\ Draine, *Physics of the interstellar and galactic medium*, Princeton University Press (2011).</small>

# Componenti dell'ISM

ISM comprende tutto ciò che nella Galassia sta tra le stelle. Esso è composto da:

#.   **Gas**;
#.   **Polveri**;
#.   Raggi cosmici;
#.   Radiazione e.m.\ (luce stellare, CMB, \ldots);
#.   Campo magnetico interstellare;
#.   Campo gravitazionale;
#.   Materia oscura.

Oggi ci occuperemo solo di **gas** e **polveri**.


# Il mezzo interstellare

Metodi di osservazione:

-   Polvere:
    #.  Oscuramento (in banda V);
    #.  Emissione diretta (UV, IR, mm\ldots).
-   Gas: emissione/assorbimento di righe.

# Estinzione nell'ISM

<center>![](images/dust-and-light.png){height=240px}</center>

-   L'effetto della diffusione e dell'assorbimento è detto **estinzione**, e fa diminuire il flusso $b$ ($[b] = \text{W/m}^2$):
    \[
      b(L) = e^{-\tau(L)} b_0.
    \]

-   Il valore $\tau(L) = \sigma n L$ è detto **coefficiente di estinzione**, ed è un numero puro.

# Estinzione e magnitudine

-   Se il flusso misurato è inferiore a causa dell'estinzione, vuol dire che la magnitudine **aumenta**:
    \[
    A \equiv m' - m = 2.5\log_{10} \frac{b_0}{b(L)} = 1.0857\,\tau(L).
    \]

-   Si può quindi usare l'approssimazione
    \[
    A \approx \tau(L).
    \]

# ISM e misura delle distanze

In presenza di estinzione $A$, in generale si ha che
\[
\begin{aligned}
  m' &= m + A \\
  &= M + 5 \log_{10}\frac{d}{10\,\text{pc}} + A
\end{aligned}
\]
(la presenza di $A$ rende la stella più debole).


Quindi in presenza di estinzione non è più sufficiente conoscere $M$
per ricavare $d$!


# Misura dell'estinzione

-   Per convertire magnitudini relative in assolute ci occorre una stima indipendente di $A$.

-   Un metodo è quello di contare il numero di stelle in un campo. Supponiamo di avere un esposizione con magnitudine di soglia $m_0$. Se c'è estinzione, allora vedremo solo le stelle con $m$ tale che
    \[
    m < m_0 - A.
    \]

# Misura dell'estinzione

<center>![](images/barnard68-wavelengths.jpg){height=540px}</center>


# Misura dell'estinzione

Definiamo una «funzione di luminosità» delle stelle osservate
$N'(m)$, tale che
\[
N'(m)\,\text{d}m
\]
sia il numero di stelle compresa tra $m$ e $m + \text{d}m$, e misuriamo tale quantità per tanti intervalli $[m, m + \text{d}m)$ in due regioni vicine, una oscurata e l'altra no:

<center>![](images/extinction-and-star-count.png){height=280px}</center>

# Misura dell'estinzione

Il problema è che è difficile ricostruire $N'(m)$ nella zona
oscurata, se si vedono poche stelle.

<center>![](images/barnard68-wavelengths.jpg){height=480px}</center>


# Misura dell'estinzione

In tal caso si considera il numero di stelle sotto una data
magnitudine. Nelle due zone 1 (non oscurata) e 2 (oscurata) si
vedrà un numero di stelle pari a
\[
\begin{aligned}
  N_1(m_0) &= \int_{-\infty}^{m_0}
  N'(m')\,\text{d}m', \\
  N_2(m_0 - A) &= \int_{-\infty}^{m_0 - A} N'(m')\,\text{d}m',
\end{aligned}
\]
nell'ipotesi che $N'(m)$ sia la stessa.

Se ricostruisco $N'(m)$ nella zona **non oscurata**, posso dedurre il valore di $A$.


# Valori tipici di $A$

-   Se $A$ è elevato, il numero di stelle osservabili dietro la nube è troppo piccolo per permettere di fare la stima.
-   Se invece $A$ è piccolo, è difficile osservare l'effetto dell'estinzione.
-   L'intervallo tipico in cui si può stimare $A$ è
    \[
      1 \lesssim A \lesssim 6.
    \]


# Estinzione in funzione di $\lambda$

L'estinzione dipende dalla lunghezza d'onda: $A = A(\lambda)$.

<center>![](images/barnard68-wavelengths.jpg){height=500px}</center>


# Estinzione in funzione di $\lambda$

-   Intorno al visibile, l'estinzione è più intensa se $\lambda$ è piccola (luce blu).

-   Questo comporta che il numero di stelle osservate aumenta nell'IR.

-   Inoltre, le stelle appaiono più rosse (*stellar reddening*). Vediamo come si quantifica l'impatto dell'arrossamento sull'osservazione del flusso di una stella.


# Eccesso di colore

Misuriamo l'indice di colore in due filtri, es.\ B e V:
\[
\begin{aligned}
  m_V &= M_V + 5\log_{10}\frac{d}{10\,\text{pc}} + A_V, \\
  m_B &= M_B + 5\log_{10}\frac{d}{10\,\text{pc}} + A_B.
\end{aligned}
\]

Se considero le differenze, ottengo che
\[
m_V - m_B = (M_V - M_B) + (A_V - A_B).
\]

---

# Eccesso di colore

\[
m_V - m_B = (M_V - M_B) + (A_V - A_B).
\]

- Il valore $m_V - m_B$ è misurato direttamente.
- Il valore $M_V - M_B$ si stima dal tipo spettrale (le righe non sono influenzate dall'estinzione).
- Il valore $A_V - A_B$ si può quindi ricavare facilmente, ed è chiamato **eccesso di colore**, o **arrossamento** («reddening», vedi Draine, *Physics of the interstellar and galactic medium*, pag. 238).


# Assorbimento e diffusione

-   L'estinzione è l'effetto combinato di assorbimento e diffusione. La loro importanza relativa dipende dalle proprietà fisiche dei grani e da $\lambda$.

-   Si definisce *albedo* $a_{\lambda,\text{diff}}$ la frazione dell'estinzione dovuta alla diffusione:
    \[
    b(L) = b_0 \exp(-\tau) = b_0 \exp\bigl(-\tau (a_{\lambda,\text{diff}} + a_{\lambda,\text{ass}})\bigr),
    \]
    con
    \[
    a_{\lambda,\text{diff}} + a_{\lambda,\text{ass}} = 1.
    \]

# Nebulose a riflessione

Nelle **nebulose a riflessione** («reflection nebulae») si ha $a_{\lambda,\text{diff}} \sim 60\,\%$, e c'è una stella brillante nelle loro vicinanze (con spettro molto simile).

<center>![](images/m78.jpg){height=400px}</center>

<small>M78 (costellazione di Orione)</small>


# Fisica dell'estinzione

# Fisica dell'estinzione

-   Ricordiamo la definizione di A:
    \[
    A = 2.5\log_{10} e^\tau \approx \tau.
    \]

-   Il valore $\tau$ («coefficiente di estinzione) è uguale a
    \[
    \tau = \sigma n L,
    \]
    dove $L$ è lo spessore della nube, $n$ la densità numerica, e $\sigma$ la sezione d'urto totale (assorbimento e diffusione), nell'ipotesi che $\sigma$ sia piccola: quest'ultimo è il parametro che rivela la natura dell'estinzione!


# Fisica dell'estinzione

-   Si ha quindi che
    \[
    A \propto n\, L \equiv N_\text{col},
    \]
    dove $N_\text{col}$ è detta **densità colonnare**: l'estinzione è il risultato di un integrale lungo la linea di vista.

-   Vale che
    \[
    [N_\text{col}] = \text{cm}^{-2}.
    \]


# Fisica dell'estinzione

-   Se $A \propto N_\text{col}$, ciò vuol dire che osservare nubi di polvere di diverse dimensioni/densità porta a valori diversi di $A$, anche se $\sigma$ è la stessa.

-   Se si vuole studiare la dipendenza dell'estinzione da $\lambda$, si usa la quantità (numero puro)
    \[
    f(\lambda) \equiv \frac{A(\lambda)}{A_V},
    \]

    perché in questo modo la dipendenza dalla densità colonnare scompare: $f(\lambda) \approx \sigma(\lambda) / \sigma_V$.


# Fisica dell'estinzione

Dallo studio di $f(\lambda)$ si osserva che:

#.  Nel visibile/IR, $f(\lambda) \propto 1/\lambda \propto \nu$ (la luce blu viene assorbita maggiormente);
#.  C'è un picco nell'UV;
#.  Si vedono strutture nello spettro dell'IR.


La forma di $f(\lambda)$ dipende comunque anche dalla direzione di
osservazione (c'è polvere e polvere!), soprattutto nell'UV.


# Estinzione in funzione di $\lambda$

Si definisce **rapporto di estinzione** la quantità
\[
R_V \equiv \frac{A_V}{A_B - A_V} = \frac{A_V}{E(B - V)} \approx 3.1,
\]
ricavabile stimando $A_V$ dai conteggi di stelle per $A_V$ e $E(B - V)$ dagli indici di colore. Come $f(\lambda)$, anche $R_V$ non dipende dalla densità colonnare; è legato soprattutto alla dimensione dei grani di polvere.

Il valore $R_V \approx 3.1$ è tipico, ma come $f(\lambda)$ può mostrare variazioni significative a seconda della regione osservata.


---

<center>![](images/1989Cardelli-title.png){height=660px}</center>

---

<center>![](images/cardelli-extinction-curve.png){height=660px}</center>


# Estinzione in funzione di $\lambda$

Se si ha una stima ragionevole di $R$, noto $A_B - A_V$ (facile)
posso stimare $A_V$:
\[
A_V \approx 3.1 (A_B - A_V),
\]
che è comodo in quei casi in cui il metodo dei conteggi per stimare
direttamente $A_V$ è di difficile applicazione.


Tutto ciò è fattibile senza conoscere la distanza $d$ della stella!


# Esercizio per casa

Una stella di tipo B viene osservata con $m_B = 11.0\,\text{mag}$,
$m_V = 10.0\,\text{mag}$.


Se per una stella B, $M_V \approx -0.9$ e $M_B - M_V \approx -0.17$,
qual è il valore di $A_V$ e la sua distanza? (Supporre che $R = 3.1$).


[Soluzione: $A_V \approx 3.6$, $d \approx 280\,\text{pc}$].


# Fisica dell'estinzione

<center>![](images/gordon-title-page.png){height=560px}</center>


# Fisica dell'estinzione

<center>![](images/2005gordon-introduction.png){height=560px}</center>


# Fisica dell'estinzione

<center>![](images/gordon-plot.png){height=500px}</center>

Notare che sull'asse $x$ c'è $1/\lambda$ anziché $\lambda$: perché?

# La polvere nel mezzo interstellare

# Polvere nel ISM

Ci chiediamo: qual è la dimensione tipica $r_g$ dei grani di polvere?

-   Se $r_g \gg \lambda$, vale l'ottica geometrica, e $A(\lambda)$ è costante;
-   Se $r_g \ll \lambda$, allora $\sigma \sim 0$ e dunque $A(\lambda)$ è piccolo e costante;
-   Se $r_g \sim \lambda$, allora la diffrazione è importante, e $A(\lambda)$ dipende fortemente da $\lambda$.


# Polvere nel ISM: dimensione dei grani

Esistono due tipi di grani di polvere:

#.  Grani grossi (µm–mm) generano uno spettro IR. Si osservano strutture spettrali a ~1÷10 µm, indicative di silicati (SiO, SiO₂) e ghiaccio (H₂O);
#.  Grani piccoli (1–10 nm) generano estinzione in UV, e sono aggregati di ~100 atomi (idrocarburi, carbonio, grafite).


# Polvere nel ISM: composizione

<center>![](images/draine_fig_21_1.png){height=450px}</center>

<small>B.\ Draine, *Physics of the interstellar and galactic medium*, Princeton University Press (2011).</small>


# Forma dei grani di polvere

-   Indicazioni sulla forma dei grani vengono da misure di **polarizzazione**.

-   La luce delle stelle che attraversa lo ISM è polarizzata. Si suppone che questo dipenda dalla forma dei grani nel ISM, perché HI, HII ed He hanno simmetria sferica e non possono indurre polarizzazione.

-   La polarizzazione della luce di stelle sul piano galattico è maggiore se tra noi e la stella sono presenti polveri.

---

<center>![](images/harwit-starlight-polarization.png){height=660px}</center>

<small>Harwit, *Astrophysical concepts* (4th edition), pag.\ 426, Springer (2006)</small>
