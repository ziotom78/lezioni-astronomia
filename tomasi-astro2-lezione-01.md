# How to use Ariel

To receive email notifications, you must enable them *in all
  sections of the site*.

<center>![](images/ariel-notifica.png)</center>

# Course Evaluation

-   Three critical points highlighted by the students:

    #.   I speak too fast!
    #.   I don't encourage enough student participation.
    #.   The slides are sometimes strangely formatted.

-   This year I have tried to implement a solution for each problem.


# The Milky Way

# Structure of the Milky Way

<center>![](images/milky-way.jpg){width=640px}</center>

# Masses and sizes

| Component          | Mass               | Shape and size                                     |
|--------------------|--------------------|----------------------------------------------------|
| Stellar halo       | $10^9\,M_\odot$    | Sphere ($r > 20\,\text{kpc}$)                      |
| Disk (gas)         | $10^{10}\,M_\odot$ | Disk ($r = 25\,\text{kpc}$, $h=0.15\,\text{kpc}$)  |
| Central bulge      | $10^{10}\,M_\odot$ | Ellipsoid ($6\times 2 \times 2 \,\text{kpc})$      |
| Disk (stars)       | $10^{11}\,M_\odot$ | Disk ($r = 15\,\text{kpc}$, $h = 1\,\text{kpc}$)   |
| Dark matter halo   | $10^{12}\,M_\odot$ | Sphere ($r >  60\,\text{kpc}$?)                    |


# Stellar clusters

# NGC 290 (open cluster)

<center>![](images/ngc290.jpg){height=600px}</center>

# M22 (globular cluster)

<center>![](images/m22.jpg){height=600px}</center>

---

|                     | Open clusters                       | Globular clusters                |
|---------------------|-------------------------------------|----------------------------------|
|                     | ![](images/ngc290.jpg){height=60px} | ![](images/m22.jpg){height=60px} |
| # of stars          | 10³–10⁴                             | 10⁴–10⁶                          |
| Size                | 10 pc                               | 20–100 pc (core: 5 pc)           |
| Gas and dust?       | Yes                                 | No                               |
| Planetary nebulae?  | No                                  | Yes                              |
| # of known clusters | 10³                                 | ~160                             |
| Where?              | Disk                                | Stellar halo (~1% of total mass) |


# Thermodynamics and astrophysics

<center>![](images/ideal-gas.png){height=460px}</center>

Essendo sistemi composti da molte particelle, possiamo pensare di usare la termodinamica classica per descriverli?

# Termodinamica e astrofisica

-   **NO!**

-   La teoria del gas ideale funziona solo in sistemi privi di forze a lungo raggio.

-   Da questo punto di vista la gravità è un problema!

    > Properties of systems with long range interactions are still poorly understood despite being of importance in most areas of physics.

    ([*Dynamics and Thermodynamics of Systems with Long Range Interactions*](https://link.springer.com/book/10.1007/3-540-45835-2), Springer)

# Virial Theorem

-   There is a suitable tool for the description of gravitationally bound systems: the *virial theorem*.
-   Let's consider a physical system of $N$ particles confined in a volume $V$ by internal forces.
-   Each particle is located at point $P_i$, the resulting force on it is $\vec F_i$, and $K_i$ is its kinetic energy.

# Time Averages

-   The quantities $P_i$, $\vec F_i$ and $K_i$ vary over time.
-   However, we are more interested in their **average value** than in their instantaneous evolution.
-   Given a time-dependent quantity $f = f(t)$, the value of
    \[
    \left< f \right>_t = \lim_{\tau \rightarrow \infty} \frac1\tau \int_0^\tau f(t)\,\text{d}t
    \]
    is the time average of $f$.


# Definition of «Virial»

-   Given an origin O of the reference frame, the quantity
    \[
    G \equiv \sum_{i=1}^N (P_i - O) \cdot \vec p_i = \sum_{i=1}^N \vec r_i \cdot \vec p_i,
    \]
    where $\vec r_i = P_i - O$ is the vector pointing towards the $i$-th particle, is called «virial».

-   If the particles are located in a limited volume $V$, then
    1.  $G$ is a limited quantity;
    2.  After a certain time, $G$ tends to become constant.


# Upper bounds for the virial

-   If the system is confined in a volume $V$ and its energy is finite, then there exist upper bounds $P$ and $R$ for the momentum $p_i$ and $r_i$.
-   Consequently,
    \[
    \left| G \right| = \left|\sum_{i=1}^N \vec r_i \cdot \vec p_i\right| \leq \sum_{i=1}^N
    \left|\vec r_i\right| \cdot \left|\vec p_i\right| \leq N R P,
    \]
    and the hypothesis is proven.

# Time Variation of the Virial

-   The time variation of the virial has zero average:
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
-   After a certain *relaxation time*, $G$ becomes approximately constant.


# Virial Theorem

The virial theorem states that in a system confined in a volume $V$, after the relaxation time, the following equality holds:
\[
2\left<K\right>_t = - \left<\sum_{i=1}^N \vec r_i \cdot \vec
  F_i \right>_t,
\]
where $K = \sum_{i=1}^N K_i$ is the total kinetic energy of the system.


# Proof of the theorem

Using the property $\left< \dot G \right>_t = 0$ we immediately obtain
the thesis:
\[
\begin{aligned}
  \left<\frac{\text{d}}{\text{d} t} \sum_{i=1}^N \vec r_i \cdot
      \vec p_i\right>_t &= 0, \\
  \left<2 \sum_{i=1}^N K_i + \sum_{i=1}^N \vec r_i \cdot
      \vec F_i\right>_t &= 0, \\
  2\left<\sum_{i=1}^N K_i\right>_t &= -\left<\sum_{i=1}^N \vec r_i \cdot
      \vec F_i\right>_t.
\end{aligned}
\]

# Case of central forces

We now show that for forces with potential $U_i = k r_i^\alpha$
(«central forces») in spherical systems the virial theorem reduces to:
\[
\alpha \left<U\right>_t = 2\left< K \right>_t,
\]
where $U = \sum_{i=1}^N U_i$ is the total potential energy.

<center>![](images/virial-coordinate-system.png){height=300px}</center>

---

\[
  \vec F_i
  = -\vec\nabla U_i(r_i)
  = - \partial_r U_i(r_i)\,\hat e_r
  = -\alpha\,k\,r_i^{\alpha - 1} \hat e_r,
\]
implies that
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


# The Virial Theorem in Gravitational Systems

-   In a system of bodies of mass $m$ where the only force is gravitational, $U = k r^{-1}$ (with $k = -G m^2$), and therefore $\alpha = -1$:
    \[
      \left<U\right>_t = -2\left< K \right>_t.
    \]

-   In a virialized system dominated by gravity, the potential energy is *twice* (in absolute value) the kinetic energy.

-   (Actually, the relationship $U \propto r^{-1}$ is valid only far from the center, where instead $U \propto M(r) / r \propto r^2$ and the motion is like that of a spring).


# “Virialized” Systems

-   A system for which the virial theorem holds is called “virialized”

-   Virialized systems exhibit considerable symmetry, because the kinetic energy of their components is statistically distributed

-   It is a condition similar to that of thermodynamic equilibrium

-   The next animation shows a very nice and effective 2D example

---

<iframe width="960" height="540" src="https://www.youtube.com/embed/C6eY6HMBa2Q?si=iDW_tZ2ul2aXUByf" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

[Gravitational collapse of Spongebob](https://www.youtube.com/watch&v=C6eY6HMBa2Q)


# Potential Energy Level

-   Remember that potential energy is defined up to an additive constant (it derives from an indefinite integral).
-   The virial theorem, however, assumes a very specific constant for $U$: since we assumed that $U = k r^{-1}$, it means that we assume that the potential energy of $i$ and $j$ tends to zero if the two particles are moved infinitely far apart.


# Applications of the theorem (1/2)

-   As an example, let's estimate the average temperature of the Sun using the virial theorem.
-   The Sun is a bounded spherical volume system, certainly relaxed, so the theorem is applicable.

# Applications of the theorem (1/2)

The gravitational potential energy of the Sun (sphere of radius $R$) is
\[
U = \frac35 G \frac{M^2}R,
\]
while the total kinetic energy is
\[
K = \sum_{i=1}^N \frac32 k T
\]
(we assume that the temperature is constant inside).


# Applications of the theorem (1/2)

Using the virial theorem
\[
2 \left< K \right>_t = -\left< U \right>_t
\]
we obtain that the **virial temperature** is
\[
T = \frac15 \frac{G M_\odot^2}{N k R_\odot} \sim 10^6 \div 10^7\,\text{K}.
\]
It roughly corresponds to the core temperature.


# Applications of the theorem (2/2)

-   Let's now calculate the average binding energy per nucleon in an atomic nucleus.
-   Also in this case we have a system of particles obviously relaxed and confined in a limited volume, but it is **not classical**: let's try to apply the virial theorem anyway.

# Applications of the theorem (2/2)

-   An atomic nucleus has a radius $R \sim 10^{-15}\,\text{m}$.
-   The average classical kinetic energy $p^2/(2m)$ can be estimated from the uncertainty principle:
    \[
    \Delta p_x \Delta x \sim \frac\hbar2 \qquad\Rightarrow\qquad p_x \approx \frac{\hbar}{2R}.
    \]
-   Since $p^2 = p_x^2 + p_y^2 + p_z^2 \approx 3 p_x^2 \approx 3 \hbar^2/4 R^2$, then
    \[
    K \approx A \frac{p^2}{2 m_p} \approx A \frac{3 \hbar^2}{8 R^2 m_p} \sim A \frac{\hbar^2}{R^2 m_p}.
    \]


# Applications of the theorem (2/2)

Under the hypothesis that $U \propto r^\alpha$, and that $\left|\alpha\right|$
is not too far from unity, from the virial theorem it holds that
$K \sim U$ (same order of magnitude), i.e.
\[
A \frac{\hbar^2}{R^2 m_p} \sim U
\]

We are interested in the binding energy **per nucleon**,
i.e., $U/A$:
\[
U/A \sim \frac{\hbar^2}{R^2 m_p} \sim 10\,\text{MeV/nucleon}.
\]

# Globular cluster dynamics
-   Globular clusters are spherically symmetric, therefore virialized.
-   Using the virial theorem, we calculate the following quantities for a typical cluster:
    #.   Escape velocity;
    #.   Root mean square velocity;
    #.   Mass.


# Escape Velocity

-   Is it reasonable to assume that a globular cluster is bound? To answer this, we need to estimate the escape velocity.
-   If the average velocity of the stars were greater than the escape velocity, then the cluster could not be bound: it would «evaporate» letting its stars escape into space.

# Escape Velocity

<center>![](images/escape_speed.png){height=460px}</center>

To estimate the escape velocity $v_f$ we impose the conservation of energy between the two instants shown in the figure.


# Escape Velocity

-   In the case of a star initially located at a distance $R$ from the center of mass of the cluster, the energy conservation equation becomes:
    \[
    \frac12 M_* v_f^2 - G \frac{M_*\, M_\text{GC}}R = 0,
    \]

-   If $M_\text{GC} \sim 10^6\,M_\odot$ and $R \sim 10\,\text{pc}$, we have that
    \[
      v_f = \sqrt{\frac{2 G M_\text{GC}}R} \sim 30\,\text{km/s}.
    \]

-   Note that for an escaping particle the total energy is **zero**.


# Root Mean Square Velocity

We want to calculate the root mean square velocity of the stars in a globular cluster. This quantity is related to the kinetic energy $K$:
\[
\begin{aligned}
  K &= \sum_{i=1}^N \frac12 M_* v_i^2 = \frac12 M_* N \frac1N
  \sum_{i=1}^N v_i^2 \\
  &= \frac12 M_\text{GC} v_\text{rms}^2
\end{aligned}
\]


# Root Mean Square Velocity

Consequently, from the virial theorem
\[
2 \left< K \right>_t = -\left< U \right>_t = -\left< \frac35 \frac{G
    M_\text{GC}^2}R \right>_t
\]
we have that
\[
  v_\text{rms} = \sqrt{\frac{3 G M_\text{GC}}{5 R}} \sim 15\,\text{km/s}.
\]


# Escape Velocity and Root Mean Square Velocity

Since
\[
\left(v_\text{rms} = \sqrt{\frac{3 G M_\text{GC}}{5 R}}\right) < \left(v_f = \sqrt{\frac{2 G M_\text{GC}}R}\right),
\]
this confirms the hypothesis that the globular cluster (and in general
any virialized gravitational system) is a bound system.

# Virial mass of a GC

-   Let's now calculate the total mass of a globular cluster from observational parameters.

-   The potential and kinetic energy of the cluster is
    \[
    K = \frac12 M_\text{GC} \left<v^2\right>_t, \quad U = -\frac35
    \frac{G M_\text{GC}^2}R.
    \]
-   From the fact that $2 \left<K\right>_t + \left<U\right>_t = 0$ we have that
    \[
    M = \frac5{3 G}\left<v^2\right>_t R.
    \]


# Virial Mass of g.c.

For our typical cluster with $R = 5\,\text{pc}$ and $v = 15\,\text{km/s}$ we have that
\[
M \sim 10^{39}\,\text{g} \approx 5\times 10^5\,M_\odot.
\]

This value of the mass is called **virial mass**.


---
title: "Astrofisica Generale II — 1"
author: "Maurizio Tomasi ([maurizio.tomasi@unimi.it](mailto:maurizio.tomasi@unimi.it))"
date: "13 marzo 2025"
css:
- ./css/custom.css
...
