---
title: "Lezione di Astronomia II – 1"
author: "Maurizio Tomasi ([maurizio.tomasi@unimi.it](mailto:maurizio.tomasi@unimi.it))"
date: "24 Marzo 2022"
css:
- ./css/custom.css
...

# Come si usa Ariel

Per ricevere le notifiche via email, occorre abilitarle *in tutte
  le sezioni del sito*.

<center>![](images/ariel-notifica.png)</center>

# Struttura della Via Lattea

<center>![](images/milky-way.jpg){width=640px}</center>

# Masse e dimensioni

| Componente             | Massa              | Forma e dimensioni                                 |
|------------------------|--------------------|----------------------------------------------------|
| Alone stellare         | $10^9\,M_\odot$    | Sfera ($r > 20\,\text{kpc}$)                       |
| Disco (gas)            | $10^{10}\,M_\odot$ | Disco ($r = 25\,\text{kpc}$, $h=0.15\,\text{kpc}$) |
| Rigonfiamento centrale | $10^{10}\,M_\odot$ | Ellissoide ($6\times 2 \times 2 \,\text{kpc})$     |
| Disco (stelle)         | $10^{11}\,M_\odot$ | Disco ($r = 15\,\text{kpc}$, $h = 1\,\text{kpc}$)  |
| Alone materia oscura   | $10^{12}\,M_\odot$ | Sfera ($r >  60\,\text{kpc}$?)                     |


# Introduzione agli ammassi stellari

# NGC 290 (ammasso aperto)

<center>![](images/ngc290.jpg){height=600px}</center>

# M22 (ammasso globulare)

<center>![](images/m22.jpg){height=600px}</center>

---

|                      | Ammassi aperti                      | Ammassi globulari                       |
|----------------------|-------------------------------------|-----------------------------------------|
|                      | ![](images/ngc290.jpg){height=60px} | ![](images/m22.jpg){height=60px}        |
| # di stelle          | 10³–10⁴                             | 10⁴–10⁶                                 |
| Dimensioni           | 10 pc                               | 20–100 pc (core: 5 pc)                  |
| Gas e polvere?       | Sì                                  | No                                      |
| Nebulose planetarie? | No                                  | Sì                                      |
| # di ammassi noti    | 10³                                 | ~160                                    |
| Dove?                | Disco                               | Alone stellare (~1% della massa totale) |

# NGC104 (47 Tuc, ammasso g.)

<center>![](images/ngc104.jpg){height=500px}</center>

  $N \sim 3\times 10^5$, $2r \sim 100\,\text{ly}$, $D \sim
  20\,\text{kly}$, $m_V = 4.9\,\text{mag}$.

# M3 (ammasso g.)

<center>![](images/m3.jpg){height=500px}</center>

  $N \sim 5\times 10^5$, $2r \sim 150\,\text{ly}$, $D \sim
  35\,\text{kly}$, $m_V = 6.2\,\text{mag}$.

# M13 (ammasso g.)

<center>![](images/m13.jpg){height=500px}</center>

  $N \sim 6\times 10^5$, $2r \sim 145\,\text{ly}$, $D \sim
  22\,\text{kly}$, $m_V = 5.8\,\text{mag}$.

# Termodinamica e astrofisica

<center>![](images/ideal-gas.png){height=460px}</center>

Essendo sistemi composti da molte particelle, possiamo pensare di
usare la termodinamica classica per descriverli?

# Termodinamica e astrofisica

-   **NO!**

-   La teoria del gas ideale funziona solo in sistemi privi di forze a lungo raggio.

-   Da questo punto di vista la gravità è un problema!

    > Properties of systems with long range interactions are still poorly understood despite being of importance in most areas of physics.
    
    ([*Dynamics and Thermodynamics of Systems with Long Range Interactions*](https://link.springer.com/book/10.1007/3-540-45835-2), Springer)

# Teorema del viriale

-   Esiste uno strumento adatto per la descrizione di sistemi gravitazionalmente legati: il *teorema del viriale*.
-   Consideriamo un sistema fisico di $N$ particelle confinato in un volume $V$ da forze interne.
-   Ogni particella si trova nella posizione $\vec r_i$ (rispetto a un certo sistema di riferimento), la forza risultante su di essa è $\vec F_i$, e $K_i$ è la sua energia cinetica.

# Medie temporali

-   Le quantità $\vec r_i$, $\vec F_i$ e $K_i$ variano nel tempo
-   Siamo però interessati più al loro **valore medio** che alla loro evoluzione istante per istante.
-   Data una quantità $f = f(t)$ dipendente dal tempo, il valore di
    \[
    \left< f \right>_t = \lim_{\tau \rightarrow \infty} \frac1\tau \int_0^\tau f(t)\,\text{d}t
    \]
    è la media temporale di $f$.


# Definizione di «viriale»

-   Si dice «viriale» la quantità (dipendente dal sistema di riferimento)
    \[
    G \equiv \sum_{i=1}^N \vec r_i \cdot \vec p_i.
    \]
-   Nel caso in cui le particelle si trovino in un volume limitato $V$, esso gode di due proprietà:
    1.  $G$ è una quantità limitata;
    2.  Dopo un certo tempo, $G$ tende a diventare costante.


# Limitatezza del viriale

-   Se il sistema è limitato in un volume $V$ e la sua energia è finita, allora esistono degli estremi superiori $P$ e $R$ per la quantità di moto $p_i$ e $r_i$.
-   Di conseguenza,
    \[
    \left| G \right| = \left|\sum_{i=1}^N \vec r_i \cdot \vec p_i\right| \leq \sum_{i=1}^N
    \left|\vec r_i\right| \cdot \left|\vec p_i\right| \leq N R P,
    \]
    e l'ipotesi è dimostrata.

# Variazione nel tempo del viriale

-   La variazione nel tempo del viriale ha media nulla:
    \[
    \begin{aligned}
      \left|\left< \dot G \right>_t\right| &=
      \left|\lim_{t\rightarrow\infty} \frac1\tau \int_0^\tau \dot
        G(t)\,\text{d}t\right| \\
      &= \left|\lim_{\tau\rightarrow\infty} \frac{G(\tau) -
          G(0)}\tau\right| \\
      &\leq \lim_{\tau\rightarrow\infty} \frac{2 N R P}\tau = 0.
    \end{aligned}
    \]
-   Dopo un certo *tempo di rilassamento*, $G$ diventa circa costante.


# Teorema del viriale

Il teorema del viriale dice che in un sistema limitato in un volume
$V$, passato il tempo di rilassamento, vale l'uguaglianza
\[
2\left<K\right>_t = - \left<\sum_{i=1}^N \vec r_i \cdot \vec
  F_i \right>_t,
\]
dove $K = \sum_{i=1}^N K_i$ è l'energia cinetica totale del sistema.


# Dimostrazione del teorema

Usando la proprietà $\left< \dot G \right>_t = 0$ si ottiene subito
la tesi:
\[
\begin{aligned}
  \left<\frac{\text{d}}{\text{d} t} \sum_{i=1}^N \vec r_i \cdot
      \vec p_i\right>_t &=& 0 \\
  \left<2 \sum_{i=1}^N K_i + \sum_{i=1}^N \vec r_i \cdot
      \vec F_i\right>_t &=& 0 \\
  2\left<\sum_{i=1}^N K_i\right>_t &=& -\left<\sum_{i=1}^N \vec r_i \cdot
      \vec F_i\right>_t.
\end{aligned}
\]

# Caso di forze centrali

Dimostriamo ora che per forze con potenziale $U_i = k r_i^\alpha$
(«forze centrali») in sistemi sferici il teorema del viriale si riduce a:
\[
\alpha \left<U\right>_t = 2\left< K \right>_t,
\]
dove $U = \sum_{i=1}^N U_i$ è l'energia potenziale totale.

<center>![](images/virial-coordinate-system.png){height=300px}</center>

---

\[
  \vec F_i
  = -\vec\nabla U_i(r_i)
  = - \partial_r U_i(r_i)\,\hat e_r
  = -\alpha\,k\,r_i^{\alpha - 1} \hat e_r,
\]
implica che
\[
  \begin{aligned}
    2\left< K \right>_t &= -\left<\sum_{i=1}^N \vec r_i \cdot \vec
      F_i \right>_t =\\
    &= \left<\sum_{i=1}^N \vec r_i \cdot \vec
      \nabla U_i(r_i) \right>_t =\\
    &= \left<\sum_{i=1}^N \alpha\,k\,r_i^\alpha \right>_t =
    \alpha \left<U_\mathrm{tot}\right>_t.
  \end{aligned}
\]


# Il viriale in sistemi gravitazionali

In un sistema di corpi di massa $m$ dove l'unica forza è quella gravitazionale, $U = k r^{-1}$ (con $k = -G m^2$), e quindi $\alpha = -1$:
\[
  \left<U\right>_t = -2\left< K \right>_t.
\]

In un sistema virializzato dominato dalla gravità, l'energia potenziale è *doppia* (in modulo) rispetto all'energia cinetica.


# Livello di energia potenziale

-   Ricordate che l'energia potenziale è definita a meno di una costante additiva (deriva da un integrale indefinito).
-   Il teorema del viriale assume però una costante ben precisa per $U$: siccome abbiamo supposto che $U = k r^{-1}$, significa che assumiamo che l'energia potenziale di $i$ e $j$ tenda a zero se le due particelle vengono allontanate indefinitamente.


# Applicazioni del teorema (1/2)

-   Come esempio, stimiamo la temperatura media del Sole usando il teorema del viriale.
-   Il Sole è un sistema di volume sferico limitato, sicuramente rilassato, quindi il teorema è applicabile.

# Applicazioni del teorema (1/2)

L'energia potenziale gravitazionale del Sole (sfera di raggio $R$) è
\[
U = \frac35 G \frac{M^2}R,
\]
mentre l'energia cinetica totale è
\[
K = \sum_{i=1}^N \frac32 k T
\]
(assumiamo che la temperatura sia costante nell'interno).


# Applicazioni del teorema (1/2)

Usando il teorema del viriale
\[
2 \left< K \right>_t = -\left< U \right>_t
\]
otteniamo che la **temperatura viriale** è
\[
T = \frac15 \frac{G M_\odot^2}{N k R_\odot} \sim 10^6 \div 10^7\,\text{K}.
\]
Essa corrisponde circa alla temperatura del nucleo.


# Applicazioni del teorema (2/2)

-   Calcoliamo ora l'energia media di legame per nucleone in un nucleo atomico.
-   Anche in questo caso abbiamo un sistema di particelle ovviamente rilassato e confinato in un volume limitato, ma **non è classico**: proviamo comunque ad applicare il teorema del viriale.

# Applicazioni del teorema (2/2)

-   Un nucleo atomico ha raggio $R \sim 10^{-15}\,\text{m}$.
-   L'energia cinetica media classica $p^2/(2m)$ è stimabile dal principio di indeterminazione:
    \[
    \Delta p_x \Delta x \sim \frac\hbar2.
    \]
-   Siccome $p^2 = p_x^2 + p_y^2 + p_z^2 \approx 3 p_x^2 \approx 3 \hbar^2/4 R^2$, allora
    \[
    K \approx A \frac{p^2}{2 m_p} \approx A \frac{3 \hbar^2}{8 R^2 m_p} \sim A \frac{\hbar^2}{R^2 m_p}.
    \]


# Applicazioni del teorema (2/2)

Nell'ipotesi che $U \propto r^\alpha$, e che $\left|\alpha\right|$
non sia troppo distante dall'unità, dal teorema del viriale vale che
$K \sim U$ (stesso ordine di grandezza), ossia
\[
A \frac{\hbar^2}{R^2 m_p} \sim U
\]

Noi siamo interessati all'energia di legame **per nucleone**,
ossia $U/A$:
\[
U/A \sim \frac{\hbar^2}{R^2 m_p} \sim 10\,\text{MeV/nucleone}.
\]

# Dinamica degli a.g.

-   Consideriamo ora un ammasso globulare.
-   Usando il teorema del viriale, calcoliamo le seguenti quantità per un ammasso tipico ($R = 5\,\text{pc}$, $N = 10^6$):
    #.   Velocità di fuga;
    #.   Energia potenziale;
    #.   Energia cinetica;
    #.   Velocità quadratica media;
    #.   Massa.


# Velocità di fuga

-   È sensato supporre che un ammasso globulare sia legato? Per rispondere a questo, dobbiamo stimare la velocità di fuga.
-   Se la velocità media delle stelle fosse maggiore della velocità di fuga, allora l'ammasso non potrebbe essere legato: «evaporerebbe» lasciando sfuggire le sue stelle nello spazio.

# Velocità di fuga

<center>![](images/escape_speed.png){height=460px}</center>

Per stimare la velocità di fuga $v_f$ si impone la conservazione
dell'energia tra i due istanti mostrati in figura.


# Velocità di fuga

Nel caso di una stella posta inizialmente a una distanza $R$ dal
centro di massa dell'ammasso, l'equazione di conservazione
dell'energia diventa:
\[
\frac12 M_* v_f^2 - G \frac{M_*\, M_\text{GC}}R = 0,
\]
da cui
\[
  v_f = \sqrt{\frac{2 G M_\text{GC}}R} \approx 29\,\text{km/s}.
\]


Notate che per una particella che sfugge l'energia totale è
**nulla**.

# Energia potenziale di un a.g.

Sappiamo che per una distribuzione di massa con simmetria sferica
vale che
\[
U = -\frac35 \frac{G M^2}R,
\]
anche nel caso in cui $\rho$ dipenda dal raggio $r$.


# Energia potenziale di un a.g.

Per un ammasso globulare si ha tipicamente che
\[
N \sim 10^6, \quad M_* \sim 0.5 M_\odot, \quad R_\text{core} \sim 5\,\text{pc}.
\]
La sua energia potenziale è quindi
\[
U = -\frac35 \frac{G (N M_*)^2}{R_\text{core}} = -2.5\times 10^{51}\,\text{erg}.
\]
(Per confronto, il Sole ha un'energia potenziale gravitazionale di
$\sim 10^{48}\,\text{erg}$).


# Energia cinetica di un a.g.

Se l'ammasso è dinamicamente rilassato, allora
\[
K = -\frac{U}2 \sim 1.2\times 10^{51}\,\text{erg},
\]
e quindi l'energia totale è
\[
  E = K + U = -1.2 \times 10^{51}\,\text{erg}.
\]

L'energia totale di un sistema virializzato è **negativa**.

# Velocità quadratica media

Vogliamo calcolare la velocità (quadratica) media delle stelle in un
ammasso globulare. Questa quantità è legata all'energia cinetica $K$:
\[
\begin{aligned}
  K &= \sum_{i=1}^N \frac12 M_* v_i^2 = \frac12 M_* N \frac1N
  \sum_{i=1}^N v_i^2 \\
  &= \frac12 M_\text{GC} v_\text{rms}^2
\end{aligned}
\]


# Velocità quadratica media
Di conseguenza, dal teorema del viriale
\[
2 \left< K \right>_t = -\left< U \right>_t = -\left< \frac35 \frac{G
    M_\text{GC}^2}R \right>_t
\]
abbiamo che
\[
  v_\text{rms} = \sqrt{\frac{3 G M_\text{GC}}{5 R}} \approx 16\,\text{km/s}.
\]


# Velocità di fuga e velocità quadratica media

Dal momento che
\[
\left(v_\text{rms} = \sqrt{\frac{3 G M_\text{GC}}{5 R}}\right) < \left(v_f = \sqrt{\frac{2 G M_\text{GC}}R}\right),
\]
ciò conferma l'ipotesi che l'ammasso globulare (e in generale
qualsiasi sistema gravitazionale virializzato) sia un sistema legato.

# Massa viriale degli a.g.

-   Calcoliamo ora la massa totale di un ammasso globulare da parametri
    osservativi.
-   L'energia potenziale e cinetica dell'ammasso è
    \[
    K = \frac12 M_\text{GC} \left<v^2\right>_t, \quad U = -\frac35
    \frac{G M_\text{GC}^2}R.
    \]
-   Dal fatto che $2 \left<K\right>_t + \left<U\right>_t = 0$ si ha
    che
    \[
    M = \frac5{3 G}\left<v^2\right>_t R.
    \]


# Massa viriale degli a.g.

Per il nostro ammasso tipico con $R = 5\,\text{pc}$ e $v =
16\,\text{km/s}$ abbiamo che
\[
M \sim 10^{39}\,\text{g} \approx 5\times 10^5\,M_\odot.
\]

Questo valore della massa è detto **massa viriale**.

# Tempo di rilassamento

# Tempo di rilassamento

-   Veniamo ora al tempo necessario perché un ammasso diventi dinamicamente rilassato.

-   Inizialmente le stelle di un ammasso possono *non* essere rilassate: in tal caso le più veloci ($v > v_f$) escono dall'ammasso, e questa «evaporazione» cambia la distribuzione delle $v$.

-   In più, le interazioni gravitazionali provocano una ridistribuzione dell'energia, che porta l'ammasso verso lo stato rilassato.


# Tempo di rilassamento

-   Per quantificare il tempo di rilassamento, possiamo supporre che esso sia il tempo necessario affinché ciascuna delle stelle dell'ammasso interagiscano un certo numero $N$ di volte con le sue compagne.
-   (Questo è analogo al modo in cui si studia un gas ideale che sta raggiungendo l'equilibrio termodinamico).


# Tempo di rilassamento

Possiamo definire un'interazione tra due stelle come la condizione
in cui l'energia cinetica diventa uguale all'energia potenziale tra
le due (perché?):
\[
\frac12 M_* v^2 \sim G \frac{M_*^2}r.
\]
Ciò avviene quando la distanza tra le due stelle è
\[
r_c \sim 2 G \frac{M_*}{v^2}.
\]
Definiamo questo come il **raggio collisionale**.


# Tempo di rilassamento

-   Quanto è probabile che una stella interagisca con altre? Dipende da quanto velocemente la stella si muove e dalla densità delle sue compagne:

    <center>![](images/cross-section.png){height=300px}</center>

-   Nel volume $V = \pi r^2\,\Delta x$ ci sono $V n = (\pi r^2\,\Delta x)\,n$ stelle (con $n$ densità numerica).


# Tempo di rilassamento

<center>![](images/cross-section.png){height=180px}</center>

Se la distanza percorsa dalla stella è $\Delta x = v \Delta t$, allora durante il tempo di rilassamento $\Delta t_r$ la stella interagisce collisionalmente con le $N_\text{int}$ stelle nel cilindro che ha base $r = r_c$:
\[
(\pi r_c^2\,v\,\Delta t_r)\,n = N_\text{int} \quad \Rightarrow \quad \Delta t_r = \frac{N_\text{int}}{\pi r_c^2\,v\,n}.
\]


# Tempo di rilassamento

Se ora poniamo $N_\text{int} \approx 1$ e sostituiamo l'espressione $r_c \sim 2 G \frac{M_*}{v^2}$ in
\[
\Delta t_r = \frac{N_\text{int}}{\pi r_c^2\,v\,n}
\]
otteniamo:
\[
\Delta t_r = \frac{v^3}{4 \pi G^2 M_*^2\,n}.
\]


# Tempo di rilassamento

L'espressione di $\Delta t_r$ può essere molto semplificata.
Innanzitutto, $n = N/\bigl(\frac43 \pi R^3\bigr)$; inoltre possiamo
usare il teorema del viriale:
\[
\begin{aligned}
K &= -\frac12 U, \\
\frac12 N M_* v^2 &= \frac35 G \frac{(N M_*)^2}R, \\
G M_* N &\approx R v^2\quad\text{(supponendo $\frac35
  \approx \frac12$)}.
\end{aligned}
\]

# Tempo di rilassamento

Sostituendo le espressioni di $n$ e $G M_* N$, otteniamo
\[
\Delta t_r \approx \frac{N R}{3 v},
\]
quindi il tempo di rilassamento è dello stesso ordine di grandezza
del tempo richiesto a compiere $N$ attraversamenti dell'ammasso
($R/v$ è il tempo per *un* attraversamento), con $N$ numero di stelle.


# Tempo di rilassamento

La nostra stima porta a un valore di $\Delta t_r$ pari a
\[
\Delta t_r \approx \frac13 \times
\frac{10^6 \times 5\,\text{pc}}{16\,\text{km/s}} \approx 100\,\text{Gyr},
\]
che è implausibile! (L'universo ha meno di 14 miliardi di anni).


Questo contrasta col fatto che la maggior parte degli ammassi
globulari sembri essere già rilassata.
