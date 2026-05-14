#import "@local/dtu-template:0.6.3": *
#import "@preview/unify:0.7.1": num, numrange, qty, qtyrange
#import "@preview/physica:0.9.8": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/plotsy-3d:0.2.1": plot-3d-parametric-curve

#show: super-T-as-transpose
#let vecrow = vecrow.with(delim: "[")
#let dmat = dmat.with(delim: "[")
#let hmat = hmat.with(delim: "[")
#let jmat = jmat.with(delim: "[")
#let dm = math.op("dm")

#show: dtu-note.with(
  course: "01002",
  course-name: "Mathematics 1b (Polytechnical Foundation)",
  title: "Seb's Collection of Solutions - Math 1b (v2, book-aligned)",
  date: datetime.today(),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

#set math.mat(delim: "[")
#set math.vec(delim: "[")

#outline()

= Quick Reference

#important[
  + *Tag alle MC* — ingen minuspoint. Selv et gæt giver 1/(antal valg).
  + *Skriv ALTID gradient ned først* i optimerings-/Taylor-opgaver — det er gratis point.
  + *Henvis til bogens sætninger/eksempler* — sparer tid. *ALDRIG* henvis til definitioner.
  + *Lav en skitse* — også selvom den er grim. Det er point.
  + *Skriv $bold("hvad")$ du gør* — partial credit for metode selvom svar er forkert.
]

== Vigtige formler — Lommekort

#align(
  center,
)[
  #table(
    columns: 2,
    stroke: 0.5pt,
    inset: 6pt,
    fill: (x, y) => if y == 0 { gray.lighten(80%) } else { none },
    table.header([*Hvad*], [*Formel*]),
    [Gradient af $f: RR^n -> RR$],
    [$grad f = vec(pdv(f, x_1), pdv(f, x_2), dots.v, pdv(f, x_n))$],
    [Jacobi-matrix af $va(V): RR^n -> RR^m$],
    [$vb(J)_(va(V)) = mat(pdv(V_1, x_1), dots, pdv(V_1, x_n);dots.v, , dots.v;pdv(V_m, x_1), dots, pdv(V_m, x_n))$],
    [Hesse-matrix af $f: RR^n -> RR$],
    [$vb(H)_f = mat(pdv(f, x_1, 2), pdv(f, x_1, x_2), dots;pdv(f, x_2, x_1), pdv(f, x_2, 2), dots;dots.v, , dots.down)$],
    [Determinant $2 times 2$],
    [$mdet(a, b;c, d) = a d - b c$],
    [Sarrus $3 times 3$],
    [$"hovd. - antid."$ se afsnit nedenfor],
    [Indre produkt i $RR^n$],
    [$iprod(va(u), va(v)) = sum u_i v_i$],
    [Norm],
    [$norm(va(v)) = sqrt(iprod(va(v), va(v)))$],
    [Projektion på $va(u)$],
    [$op("proj")_(va(u)) va(v) = iprod(va(v), va(u))/iprod(va(u), va(u)) va(u)$],
    [Polære koord.],
    [$x = r cos theta, y = r sin theta,$ Jac $= r$],
    [Cylindriske koord.],
    [$x = r cos theta, y = r sin theta, z = z,$ Jac $= r$],
    [Sfæriske koord. (bogens konv.)],
    [$x = r sin theta cos phi, y = r sin theta sin phi, z = r cos theta,$ Jac $= r^2 sin theta$],
  )
]

== Sarrus' regel (3×3 determinant)

#important[
  $
    mdet(a_1, a_2, a_3;b_1, b_2, b_3;c_1, c_2, c_3) = underbrace(a_1 b_2 c_3 + a_2 b_3 c_1 + a_3 b_1 c_2, "hoveddiagonaler ned") - underbrace(a_3 b_2 c_1 + a_1 b_3 c_2 + a_2 b_1 c_3, "antidiagonaler op")
  $

  *Trick:* Skriv de to første søjler igen til højre, tegn 3 diagonaler ned (+) og 3 op ($-$).
]

== Almindelige afledte og stamfunktioner

#align(center)[
  #table(
    columns: 4,
    stroke: 0.5pt,
    inset: 5pt,
    fill: (x, y) => if y == 0 { gray.lighten(80%) } else { none },
    table.header([*$f(x)$*], [*$f'(x)$*], [*$f(x)$*], [*$integral f dd(x)$*]),
    [$x^n$],
    [$n x^(n-1)$],
    [$x^n$ ($n eq.not -1$)],
    [$x^(n+1)/(n+1)$],
    [$e^x$],
    [$e^x$],
    [$e^x$],
    [$e^x$],
    [$e^(a x)$],
    [$a e^(a x)$],
    [$e^(a x)$],
    [$1/a e^(a x)$],
    [$ln(x)$],
    [$1/x$],
    [$1/x$],
    [$ln|x|$],
    [$sin(x)$],
    [$cos(x)$],
    [$sin(x)$],
    [$-cos(x)$],
    [$cos(x)$],
    [$-sin(x)$],
    [$cos(x)$],
    [$sin(x)$],
    [$tan(x)$],
    [$1/cos^2(x)$],
    [$1/cos^2(x)$],
    [$tan(x)$],
    [$arctan(x)$],
    [$1/(1+x^2)$],
    [$1/(1+x^2)$],
    [$arctan(x)$],
    [$arcsin(x)$],
    [$1/sqrt(1-x^2)$],
    [$1/sqrt(1-x^2)$],
    [$arcsin(x)$],
    [$abs(x)$],
    [$"sign"(x)$],
    [$sqrt(a^2+x^2)$],
    [$x/2 sqrt(a^2+x^2) + a^2/2 ln(x + sqrt(a^2+x^2))$],
  )
]

#math-hint()[
  *Kæderegel (chain rule):* $(f(g(x)))' = f'(g(x)) dot g'(x)$ \
  *Produktregel:* $(f g)' = f' g + f g'$ \
  *Kvotientregel:* $(f/g)' = (f' g - f g')/g^2$
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// FUNKTIONER I — 1D
// ═══════════════════════════════════════════════════════════════════════════

= Funktioner I (1D)

== Kontinuitet

#definition(title: [Kontinuitet i et punkt])[
  $f: RR -> RR$ er *kontinuert* i $x_0$ hvis:
  $
    lim_(x -> x_0) f(x) = f(x_0)
  $

  Dvs. både venstre- og højre-grænseværdi eksisterer og er lig med funktionsværdien.
]

#definition(
  title: [Stykkevis defineret funktion (piecewise)],
)[
  En funktion givet ved forskellige udtryk på forskellige intervaller. Kontinuitet skal undersøges på *grænsepunkterne* mellem stykker.
]

#note-box()[
  *Fremgangsmåde — Kontinuitet af stykkevis funktion ved $x_0$:*

  + Beregn $f(x_0)$ (brug det stykke der inkluderer $x_0$, dvs. den med $<=$ eller $>=$).
  + Beregn venstre-grænse: $lim_(x -> x_0^-) f(x)$ (brug udtrykket til venstre).
  + Beregn højre-grænse: $lim_(x -> x_0^+) f(x)$ (brug udtrykket til højre).
  + *Konklusion:*
    - Hvis alle tre er lig hinanden → kontinuert i $x_0$.
    - Ellers → ikke kontinuert.
]

#example(
  title: [Stykkevis kontinuitet],
)[
  Er $f(x) = cases(x^2 - x + 3 & "," x <= 2, a x + b & "," x > 2)$ kontinuert i $x_0 = 2$?

  #solution(
    )[
    *Trin 1:* $f(2) = 2^2 - 2 + 3 = 5$.

    *Trin 2:* Venstre-grænse: $lim_(x -> 2^-) (x^2 - x + 3) = 5$.

    *Trin 3:* Højre-grænse: $lim_(x -> 2^+) (a x + b) = 2a + b$.

    *Trin 4:* $f$ er kontinuert $<=>$ $2a + b = 5$.

    Så hvis $2a + b eq.not 5$ er $f$ *ikke* kontinuert. F.eks. er $a = 1, b = 3 ==> 2+3 = 5$ ✓ kontinuert. Men $a = -2, b = 1 ==> -4 + 1 = -3 eq.not 5$ ✗ ikke kontinuert.
  ]
]

#math-hint(
  )[
  *MC-trick:* For "hvilke værdier gør $f$ IKKE kontinuert" — beregn $2a + b$ for hver mulighed og find dem hvor $eq.not f(x_0)$.
]

== Differentiabilitet

#definition(title: [Afledet (Derivative) — Differenskvotient-definition])[
  $f$ er *differentiabel* i $x_0$ hvis grænsen eksisterer:
  $
    f'(x_0) = lim_(h -> 0) (f(x_0 + h) - f(x_0))/h
  $

  *Bemærk:* Differentiabel $==>$ kontinuert (men ikke omvendt).
]

#definition(
  title: [Epsilon-definition (Math 1a bog)],
)[
  $f$ er differentiabel i $x_0$ hvis der findes $c in RR$ og $epsilon: RR -> RR$ med $lim_(h->0) epsilon(h) = 0$ så:
  $
    f(x_0 + h) = f(x_0) + c h + epsilon(h) h quad forall h
  $
  Her er $c = f'(x_0)$.
]

#note-box()[
  *Fremgangsmåde — Differentiabilitet i $x_0$ (typisk for stykkevis funktion):*

  + *Tjek først kontinuitet* i $x_0$ — hvis ikke kontinuert, så ikke differentiabel.
  + Beregn $f'(x)$ for hvert stykke (almindelig differentiering).
  + Beregn venstre-afledet: $f'_-(x_0) = lim_(x -> x_0^-) f'(x)$.
  + Beregn højre-afledet: $f'_+(x_0) = lim_(x -> x_0^+) f'(x)$.
  + *Konklusion:* Hvis $f'_-(x_0) = f'_+(x_0)$ → differentiabel med $f'(x_0)$ = denne værdi.
]

#example(title: [Differentiabilitet af $f(x) = x dot abs(x)$])[
  Er $f(x) = x abs(x)$ differentiabel i $x_0 = 0$?

  #solution()[
    Først: $f(x) = cases(x^2 & "," x >= 0, -x^2 & "," x < 0)$.

    *Trin 1 — Kontinuitet:* $f(0) = 0$, $lim_(x -> 0) x abs(x) = 0$. ✓

    *Trin 2 — Differenskvotient:*
    $
      lim_(h -> 0) (f(0+h) - f(0))/h = lim_(h -> 0) (h abs(h))/h = lim_(h -> 0) abs(h) = 0
    $

    Grænsen eksisterer og er $0$, så $f$ er differentiabel i $0$ med $f'(0) = 0$.
  ]
]

#example(title: [Ikke-differentiabel: $f(x) = abs(x)$])[
  $f(x) = abs(x)$ er kontinuert overalt, men IKKE differentiabel i $x = 0$.

  $f'_-(0) = -1$, $f'_+(0) = 1$, så grænserne stemmer ikke overens.
]

#math-hint()[
  *Hurtigt tjek for stykkevis:* Beregn $f'_-(x_0)$ og $f'_+(x_0)$. Hvis lig → diff. Ellers → ikke diff.

  *Klassisk fælde:* $abs(x)$ er ikke diff i $0$. $x abs(x)$ ER diff i $0$ (med $f'(0) = 0$).
]

== Grænseværdier

#note-box()[
  *Tre vigtige trick:*

  + *Direkte indsættelse* — hvis $f$ er kontinuert: $lim_(x->a) f(x) = f(a)$.
  + *Faktorisering* — ved $0/0$: faktorisér og forkort.
  + *L'Hôpital* (kun ved $0/0$ eller $infinity/infinity$):
    $
      lim_(x->a) f(x)/g(x) = lim_(x->a) f'(x)/g'(x)
    $
]

#example(title: [Grænseværdi via faktorisering])[
  $lim_(x -> 2) (x^2 - 4)/(x - 2) = lim_(x -> 2) ((x-2)(x+2))/(x-2) = lim_(x -> 2) (x+2) = 4$
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// FUNKTIONER II — MULTIVARIABLE
// ═══════════════════════════════════════════════════════════════════════════

= Funktioner II (Multivariable)

== Partielle afledte

#definition(title: [Partial afledet])[
  For $f: RR^n -> RR$ er den partielle afledte ifht. $x_i$:
  $
    pdv(f, x_i) = lim_(h -> 0) (f(x_1, dots, x_i + h, dots, x_n) - f(x_1, dots, x_n))/h
  $

  *I praksis:* Differentiér ifht. $x_i$ og behandl alle andre variable som *konstanter*.
]

#example(title: [Partial afledet])[
  $f(x_1, x_2) = x_1^2 + 2 x_1 x_2 - 5 x_2^2 + 14 x_2$.

  - $pdv(f, x_1) = 2 x_1 + 2 x_2$ ($x_2$ konstant)
  - $pdv(f, x_2) = 2 x_1 - 10 x_2 + 14$ ($x_1$ konstant)
]

== Gradient

#definition(title: [Gradient])[
  For $f: RR^n -> RR$:
  $
    grad f = vec(pdv(f, x_1), pdv(f, x_2), dots.v, pdv(f, x_n))
  $

  *Tolkning:* $grad f(va(x_0))$ peger i retningen hvor $f$ vokser hurtigst.
]

#note-box()[
  *Fremgangsmåde — Beregn gradient:*

  + Beregn alle partielle afledte $pdv(f, x_i)$.
  + Stil dem op som søjlevektor.
]

#example(title: [Gradient])[
  $f(x_1, x_2) = x_1^2 + 2 x_1 x_2 - 5 x_2^2 + 14 x_2$.

  $
    grad f = vec(2 x_1 + 2 x_2, 2 x_1 - 10 x_2 + 14)
  $
]

== Jacobi-matrix

#definition(
  title: [Jacobi-matrix],
)[
  For $va(V): RR^n -> RR^m$ med $va(V) = (V_1, V_2, dots, V_m)$:
  $
    vb(J)_(va(V)) = mat(
      pdv(V_1, x_1), pdv(V_1, x_2), dots, pdv(V_1, x_n);pdv(V_2, x_1), pdv(V_2, x_2), dots, pdv(V_2, x_n);dots.v, dots.v, , dots.v;pdv(V_m, x_1), pdv(V_m, x_2), dots, pdv(V_m, x_n);
    )
  $

  *Række $i$:* gradienten af $V_i$ (transponeret).
]

#note-box()[
  *Fremgangsmåde — Jacobi-matrix:*

  + Identificér $V_1, V_2, dots$ (komponenterne af $va(V)$).
  + For hver $V_i$: beregn $pdv(V_i, x_1), pdv(V_i, x_2), dots$.
  + Stil dem op som rækker.
]

#example(title: [Jacobi-matrix])[
  $va(V)(x_1, x_2, x_3) = vec(x_1 - 2 x_2, x_1 - x_2 + 3 x_3, -x_1 + x_3)$.

  $
    vb(J)_(va(V)) = mat(1, -2, 0;1, -1, 3;-1, 0, 1)
  $

  Bemærk: $vb(J)$ er konstant her fordi $va(V)$ er lineær.
]

== Hesse-matrix

#definition(
  title: [Hesse-matrix],
)[
  For $f: RR^n -> RR$:
  $
    vb(H)_f = mat(pdv(f, x_1, 2), pdv(f, x_1, x_2), dots;pdv(f, x_2, x_1), pdv(f, x_2, 2), dots;dots.v, , dots.down)
  $

  Element $(i,j)$: $pdv(f, x_i, x_j) = pdv(, x_i) (pdv(f, x_j))$.

  *Sætning 3.6.5 (Schwarz):* Hvis $f$ er $C^2$, så er $vb(H)_f$ *symmetrisk*: $pdv(f, x_i, x_j) = pdv(f, x_j, x_i)$. *Brug dette som referencepunkt på eksamen.*

  *Reference:* Definition 3.5.1 i bogen.
]

#note-box()[
  *Fremgangsmåde — Hesse-matrix for $f: RR^2 -> RR$:*

  + Beregn $grad f = vec(pdv(f, x_1), pdv(f, x_2))$.
  + Beregn $pdv(f, x_1, 2)$ (diff. den første komponent ifht. $x_1$ igen).
  + Beregn $pdv(f, x_2, 2)$.
  + Beregn $pdv(f, x_1, x_2)$ (diff. den første ifht. $x_2$).
  + Tjek symmetri: $pdv(f, x_2, x_1)$ skal være den samme (kontrol).

  $
    vb(H)_f = mat(pdv(f, x_1, 2), pdv(f, x_1, x_2);pdv(f, x_2, x_1), pdv(f, x_2, 2))
  $
]

#example(title: [Hesse-matrix])[
  $f(x_1, x_2) = x_1^2 + 2 x_1 x_2 - 5 x_2^2 + 14 x_2$.

  $grad f = vec(2 x_1 + 2 x_2, 2 x_1 - 10 x_2 + 14)$.

  - $pdv(f, x_1, 2) = 2$
  - $pdv(f, x_2, 2) = -10$
  - $pdv(f, x_1, x_2) = 2$

  $
    vb(H)_f = mat(2, 2;2, -10)
  $
]

== Kontinuitet og differentiabilitet i højere dim.

#important[
  *Praktisk regel:* Hvis alle partielle afledte eksisterer OG er kontinuerte i et område, så er $f$ differentiabel i området ($C^1 ==>$ diff.).
]

#note-box()[
  *Tilstrækkelig betingelse for diff. af $f: RR^n -> RR^m$:*

  Hvis alle indgangene i Jacobi-matricen $vb(J)_(va(V))$ er kontinuerte → $va(V)$ er differentiabel.
]

== Kæderegel for sammensætning

#lemma(name: "Kæderegel for sammensætning")[
  For $va(g): RR^k -> RR^n$ og $f: RR^n -> RR^m$ med sammensætning $f compose va(g)$:
  $
    vb(J)_(f compose va(g))(va(x)) = vb(J)_f (va(g)(va(x))) dot vb(J)_(va(g))(va(x))
  $

  *Matrix-produkt.* Pas på dimensioner og rækkefølge!
]

#math-hint(
  )[
  *MC-trick til Jacobi-determinant:*

  Hvis $va(V)$ er lineær, dvs. $va(V)(va(x)) = vb(A) va(x) + va(b)$, så er $vb(J)_(va(V)) = vb(A)$ (konstant). Brug Sarrus eller cofaktor-udvidelse for $det$.
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// INDREPRODUKTRUM
// ═══════════════════════════════════════════════════════════════════════════

= Indreproduktrum (Inner Product Spaces)

== Indre produkt og norm

#definition(
  title: [Definition 2.1.2 — Indre produkt på $RR^n$ og $CC^n$],
)[
  *Standard indre produkt på $RR^n$:* For $va(x), va(y) in RR^n$:
  $
    iprod(va(x), va(y)) = va(x) dot va(y) = x_1 y_1 + x_2 y_2 + dots + x_n y_n = sum_(k=1)^n x_k y_k
  $

  *Standard indre produkt på $CC^n$ (bogens konvention):* For $va(x), va(y) in CC^n$:
  $
    iprod(va(x), va(y)) = sum_(k=1)^n x_k overline(y_k) = va(y)^* va(x)
  $

  *Vigtigt:* Bogen konjugerer den ANDEN entry (lineær i den første, konjugat-lineær i den anden). Andre bøger gør det modsat — vær opmærksom.

  *Egenskaber:*
  - $iprod(va(x), va(y)) = overline(iprod(va(y), va(x)))$ (konjugat-symmetri)
  - $iprod(c va(x) + d va(y), va(z)) = c iprod(va(x), va(z)) + d iprod(va(y), va(z))$ (linearitet i 1. entry)
  - $iprod(va(x), c va(y) + d va(z)) = overline(c) iprod(va(x), va(y)) + overline(d) iprod(va(x), va(z))$ (konjugat-lineær i 2.)
]

#definition(title: [Norm])[
  $
    norm(va(v)) = sqrt(iprod(va(v), va(v))) = sqrt(sum v_i^2)
  $
]

#definition(title: [Ortogonal])[
  $va(u) perp va(v) <==> iprod(va(u), va(v)) = 0$.
]

#example(title: [Tjek ortogonalitet])[
  $va(v)_1 = vec(2, 0, 2, 1)$, $va(v)_2 = vec(-2, 1, 2, 0)$.

  $iprod(va(v)_1, va(v)_2) = 2(-2) + 0(1) + 2(2) + 1(0) = -4 + 0 + 4 + 0 = 0$ ✓
]

== Cauchy-Schwarz og trekantsulighed

#lemma(name: "Cauchy-Schwarz")[
  $
    abs(iprod(va(u), va(v))) <= norm(va(u)) dot norm(va(v))
  $
]

#lemma(name: "Trekantsulighed")[
  $
    norm(va(u) + va(v)) <= norm(va(u)) + norm(va(v))
  $
]

== Projektion

#lemma(
  name: "Projektion på vektor",
)[
  Projektionen af $va(v)$ på $va(u)$ (én vektor):
  $
    op("proj")_(va(u)) va(v) = iprod(va(v), va(u))/iprod(va(u), va(u)) va(u) = iprod(va(v), va(u))/norm(va(u))^2 va(u)
  $
]

#note-box()[
  *Fremgangsmåde — Projektion på underrum udspændt af ÉN vektor $va(u)$:*

  + Beregn $iprod(va(v), va(u))$ (tæller).
  + Beregn $iprod(va(u), va(u)) = norm(va(u))^2$ (nævner).
  + Skalér $va(u)$ med brøken.
]

#example(title: [Projektion])[
  $va(v) = vec(1, 1, 1, 1)$, $va(u) = vec(2, 0, 2, 1)$.

  $iprod(va(v), va(u)) = 1(2) + 1(0) + 1(2) + 1(1) = 5$ \
  $iprod(va(u), va(u)) = 4 + 0 + 4 + 1 = 9$

  $op("proj")_(va(u)) va(v) = 5/9 vec(2, 0, 2, 1) = vec(10/9, 0, 10/9, 5/9)$
]

#lemma(name: "Projektion på underrum (ortogonal basis)")[
  Hvis ${va(u)_1, dots, va(u)_k}$ er en *ortogonal* basis for $W$:
  $
    op("proj")_W va(v) = sum_(i=1)^k iprod(va(v), va(u)_i)/iprod(va(u)_i, va(u)_i) va(u)_i
  $

  *KUN gyldig hvis basis er ortogonal!* Hvis ikke, brug Gram-Schmidt først.
]

== Gram-Schmidt-processen (Sætning 2.5.1)

#important[
  *Gram-Schmidt: konvertér lin. uafh. vektorer ${va(v)_1, dots, va(v)_k}$ til ortonormal basis ${va(u)_1, dots, va(u)_k}$ for samme underrum.*

  *To ækvivalente formuleringer:*
  - *Bogens version:* Normalisér ved hvert skridt — $va(u)_k$ er allerede ONB direkte.
  - *Praktisk version (anbefalet til håndregning):* Ortogonalisér først (uden at normalisere), normalisér alle vektorer til sidst. Holder regnestykker simplere (færre kvadratrødder undervejs).

  Begge giver samme slut-ONB.
]

#note-box(
  )[
  *Fremgangsmåde — Gram-Schmidt (praktisk version):*

  + $va(w)_1 = va(v)_1$ (uændret).
  + $va(w)_2 = va(v)_2 - op("proj")_(va(w)_1) va(v)_2 = va(v)_2 - iprod(va(v)_2, va(w)_1)/iprod(va(w)_1, va(w)_1) va(w)_1$.
  + $va(w)_3 = va(v)_3 - op("proj")_(va(w)_1) va(v)_3 - op("proj")_(va(w)_2) va(v)_3$.
  + Generelt: $va(w)_k = va(v)_k - sum_(i=1)^(k-1) op("proj")_(va(w)_i) va(v)_k$.
  + *Normalisering (ONB):* $va(u)_i = va(w)_i / norm(va(w)_i)$.

  *Tjek undervejs:* $iprod(va(w)_i, va(w)_j) = 0$ for $i eq.not j$.
]

#example(title: [Gram-Schmidt til ONB])[
  $va(v)_1 = vec(2, 0, 2, 1)$, $va(v)_2 = vec(-2, 1, 2, 0)$, $va(v)_3 = vec(1, 1, 1, 1)$.

  *Tjek først:* $iprod(va(v)_1, va(v)_2) = -4 + 0 + 4 + 0 = 0$. ✓ Allerede ortogonale!

  Så $va(w)_1 = va(v)_1$, $va(w)_2 = va(v)_2$.

  *$va(w)_3$:*
  $
    op("proj")_(va(w)_1) va(v)_3 & = 5/9 vec(2, 0, 2, 1) = vec(10/9, 0, 10/9, 5/9) \
    op("proj")_(va(w)_2) va(v)_3 & = 1/9 vec(-2, 1, 2, 0) = vec(-2/9, 1/9, 2/9, 0) \
    va(w)_3                      & = vec(1, 1, 1, 1) - vec(10/9, 0, 10/9, 5/9) - vec(-2/9, 1/9, 2/9, 0) \
                                 & = vec(1/9, 8/9, -3/9, 4/9) = 1/9 vec(1, 8, -3, 4)
  $

  *Normer:*
  $
    norm(va(w)_1) & = sqrt(4 + 0 + 4 + 1) = 3 \
    norm(va(w)_2) & = sqrt(4 + 1 + 4 + 0) = 3 \
    norm(va(w)_3) & = 1/9 sqrt(1 + 64 + 9 + 16) = sqrt(90)/9 = sqrt(10)/3
  $

  *ONB:*
  $
    { 1/3 vec(2, 0, 2, 1), quad 1/3 vec(-2, 1, 2, 0), quad 1/(3 sqrt(10)) vec(1, 8, -3, 4) }
  $
]

== Ortogonale og unitære matricer

#definition(title: [Ortogonal matrix (reelt)])[
  $vb(Q) in RR^(n times n)$ er *ortogonal* hvis $vb(Q)^T vb(Q) = vb(I)$, dvs. $vb(Q)^(-1) = vb(Q)^T$.

  *Ækvivalent:* Søjlerne (og rækkerne) er en ortoNORMAL basis for $RR^n$.
]

#definition(title: [Unitær matrix (kompleks)])[
  $vb(U) in CC^(n times n)$ er *unitær* hvis $vb(U)^* vb(U) = vb(I)$, hvor $vb(U)^* = overline(vb(U))^T$.

  *Ækvivalent:* Søjlerne er ortonormale ifht. det Hermitiske indre produkt.
]

#note-box()[
  *Tjek om søjlerne er ortonormale:*

  + Hver søjle har norm 1: $norm(k_i) = 1$.
  + Søjler er parvis ortogonale: $iprod(va(k)_i, va(k)_j) = 0$ for $i eq.not j$.
]

#math-hint()[
  *MC-trick for unitær matrix:* Sæt $omega = e^(i 2 pi/3) = -1/2 + i sqrt(3)/2$. Husk:
  - $omega^2 = -1/2 - i sqrt(3)/2$
  - $1 + omega + omega^2 = 0$
  - $abs(omega) = 1$, $abs(omega^2) = 1$

  Brug "søjle $perp$ søjle" til at finde ukendte indgange.
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// SPEKTRALSÆTNINGEN
// ═══════════════════════════════════════════════════════════════════════════

= Spektralsætningen (Eigenvalues & Diagonalization)

== Egenværdier og egenvektorer

#definition(
  title: [Egenværdi/Egenvektor],
)[
  For $vb(A) in FF^(n times n)$: $lambda in FF$ er *egenværdi* med tilhørende *egenvektor* $va(v) eq.not va(0)$ hvis:
  $
    vb(A) va(v) = lambda va(v)
  $
]

#note-box()[
  *Fremgangsmåde — Find egenværdier:*

  + Opskriv det karakteristiske polynomium: $p(lambda) = det(vb(A) - lambda vb(I))$.
  + Løs $p(lambda) = 0$ → rødderne er egenværdierne.

  *Fremgangsmåde — Find egenvektorer for egenværdi $lambda$:*

  + Opstil matricen $vb(A) - lambda vb(I)$.
  + Løs $(vb(A) - lambda vb(I)) va(v) = va(0)$ (find $ker$).
  + Egenrummet $E_lambda = ker(vb(A) - lambda vb(I))$.
]

#example(
  title: [Egenværdier af $2 times 2$],
)[
  $vb(A) = mat(2, 1;1, 2)$.

  $p(lambda) = mdet(2-lambda, 1;1, 2-lambda) = (2-lambda)^2 - 1 = lambda^2 - 4 lambda + 3 = (lambda-1)(lambda-3)$.

  Egenværdier: $lambda_1 = 1, lambda_2 = 3$.

  *Egenvektor for $lambda = 1$:* $(vb(A) - vb(I)) va(v) = mat(1, 1;1, 1) va(v) = va(0) ==> va(v) = vec(1, -1)$.

  *Egenvektor for $lambda = 3$:* $(vb(A) - 3vb(I)) va(v) = mat(-1, 1;1, -1) va(v) = va(0) ==> va(v) = vec(1, 1)$.
]

== Diagonalisering

#definition(
  title: [Diagonaliserbar],
)[
  $vb(A)$ er *diagonaliserbar* hvis $vb(A) = vb(P) vb(D) vb(P)^(-1)$ hvor $vb(D)$ er diagonal med egenværdier, og $vb(P)$ har egenvektorer som søjler.
]

#note-box()[
  *Fremgangsmåde — Diagonaliser $vb(A)$:*

  + Find alle egenværdier $lambda_1, dots, lambda_n$.
  + Find tilhørende egenvektorer $va(v)_1, dots, va(v)_n$.
  + Hvis der findes $n$ lin. uafh. egenvektorer (én pr. egenværdi tæller "multiplicitet"):
    - $vb(P) = [va(v)_1 mid(|) va(v)_2 mid(|) dots mid(|) va(v)_n]$
    - $vb(D) = "diag"(lambda_1, dots, lambda_n)$ (i samme rækkefølge som søjlerne i $vb(P)$).
]

== Spektralsætningen

#theorem(title: "Spektralsætningen (Sætning 2.8 i bogen)")[
  Lad $vb(A) in RR^(n times n)$ være *symmetrisk* ($vb(A) = vb(A)^T$). Da gælder:

  + Alle egenværdier er *reelle*.
  + Der findes en *ortoNORMAL* basis af egenvektorer.
  + $vb(A) = vb(Q) vb(D) vb(Q)^T$ hvor $vb(Q)$ er ortogonal og $vb(D)$ er diagonal.

  *For kompleks $vb(A)$ Hermitisk ($vb(A) = vb(A)^*$):* samme resultat med $vb(U)$ unitær.

  *Eksamenstrick:* På eksamen, skriv "iflg. Spektralsætningen ..." for at spare tid.
]

#note-box()[
  *Fremgangsmåde — Orthogonal diagonalisering af symmetrisk matrix:*

  + Find egenværdier $lambda_i$ og egenvektorer $va(v)_i$.
  + *Hvis to egenvektorer har samme egenværdi:* ortogonalisér dem med Gram-Schmidt indenfor det egenrum.
  + Normalisér hver egenvektor: $va(q)_i = va(v)_i / norm(va(v)_i)$.
  + $vb(Q) = [va(q)_1 mid(|) dots mid(|) va(q)_n]$ → ortogonal matrix.
  + $vb(D) = "diag"(lambda_1, dots, lambda_n)$ (samme rækkefølge!).

  *Tjek:* $vb(Q)^T vb(A) vb(Q) = vb(D)$.
]

== Kvadratiske former

#definition(
  title: [Kvadratisk form],
)[
  En *kvadratisk form* er $q: RR^n -> RR$ givet ved $q(va(x)) = va(x)^T vb(A) va(x)$ hvor $vb(A)$ er symmetrisk.

  *I 2D:* $q(x_1, x_2) = a_(11) x_1^2 + 2 a_(12) x_1 x_2 + a_(22) x_2^2$ med $vb(A) = mat(a_(11), a_(12);a_(12), a_(22))$.

  *Bemærk:* Blandet led $b x_1 x_2$ → $a_(12) = a_(21) = b/2$.
]

#important[
  *Reduktion af kvadratisk form (fjern blandede led):*

  Vha. spektralsætningen: $q(va(x)) = va(x)^T vb(A) va(x) = tilde(va(x))^T vb(D) tilde(va(x)) = lambda_1 tilde(x)_1^2 + dots + lambda_n tilde(x)_n^2$

  hvor $tilde(va(x)) = vb(Q)^T va(x)$ ($vb(Q)$ fra orthogonal diagonalisering).
]

#note-box(
  )[
  *Fremgangsmåde — Reducer kvadratisk form $q(x_1, x_2)$:*

  + Find symmetrisk matrix $vb(A)$ således $q_2(va(x)) = va(x)^T vb(A) va(x)$ (den rene 2.-grads del; lineære led tager man for sig).
  + Find egenværdier $lambda_1, lambda_2$ og normaliserede egenvektorer $va(q)_1, va(q)_2$.
  + $vb(Q) = [va(q)_1 mid(|) va(q)_2]$.
  + I de nye koord. $tilde(va(x)) = vb(Q)^T va(x)$:
    $
      q = lambda_1 tilde(x)_1^2 + lambda_2 tilde(x)_2^2 + "(transformerede lin. led)" + "konst."
    $
  + Saml til "completing the square" form $a(tilde(x)_1 - b)^2 + c(tilde(x)_2 - d)^2 + dots$.
]

#example(
  title: [Reducer kvadratisk form],
)[
  $q(x_1, x_2) = -4 x_1 x_2 + 3 x_2^2 - 4 x_1 + 2 x_2 + 2$.

  #solution(
    )[
    *2.-grads del:* $-4 x_1 x_2 + 3 x_2^2$.

    Symmetrisk matrix: $vb(A) = mat(0, -2;-2, 3)$ (blandet led $-4 x_1 x_2 ==> a_(12) = -2$).

    *Egenværdier:*
    $
      det(vb(A) - lambda vb(I)) = mdet(-lambda, -2;-2, 3-lambda) = -lambda(3-lambda) - 4 = lambda^2 - 3 lambda - 4 = (lambda-4)(lambda+1)
    $
    $==> lambda_1 = 4, lambda_2 = -1$.

    *Egenvektorer:*
    - $lambda = 4$: $(vb(A) - 4 vb(I)) va(v) = mat(-4, -2;-2, -1) va(v) = va(0) ==> va(v) = vec(1, -2)$ (eller $vec(-1, 2)$).
    - $lambda = -1$: $(vb(A) + vb(I)) va(v) = mat(1, -2;-2, 4) va(v) = va(0) ==> va(v) = vec(2, 1)$.

    *Tjek ortogonal:* $iprod(vec(1, -2), vec(2, 1)) = 2 - 2 = 0$ ✓.

    *Normér:* $norm(vec(1, -2)) = sqrt(5)$, $norm(vec(2, 1)) = sqrt(5)$.

    $
      vb(Q) = 1/sqrt(5) mat(1, 2;-2, 1) quad "(eller varianter med ombyttede søjler/fortegn)"
    $

    *Verifikation MC-style:* Test om søjlerne er egenvektorer for $vb(A)$ med rigtige egenværdier.
  ]
]

== Definitehed

#important[
  *Klassifikation af $vb(A)$ symmetrisk via egenværdier:*

  - Alle $lambda_i > 0$: *positiv definit* — $q(va(x)) > 0$ for $va(x) eq.not va(0)$.
  - Alle $lambda_i >= 0$: *positiv semidefinit*.
  - Alle $lambda_i < 0$: *negativ definit*.
  - Alle $lambda_i <= 0$: *negativ semidefinit*.
  - Mindst én $> 0$ og mindst én $< 0$: *indefinit*.

  *2×2 shortcut:* $vb(A) = mat(a, b;b, c)$:
  - Pos. def. $<==>$ $a > 0$ og $det(vb(A)) > 0$.
  - Neg. def. $<==>$ $a < 0$ og $det(vb(A)) > 0$.
  - Indefinit $<==>$ $det(vb(A)) < 0$.
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// TAYLOR-APPROKSIMATIONER
// ═══════════════════════════════════════════════════════════════════════════

= Taylor-approksimationer

== Taylor-polynomium i 1D

#definition(
  title: [Taylor-polynomium af grad $n$ i $x_0$],
)[
  For $f$ $n$ gange differentiabel i $x_0$:
  $
    P_n(x) = sum_(k=0)^n (f^((k))(x_0))/(k!) (x - x_0)^k = f(x_0) + f'(x_0)(x-x_0) + (f''(x_0))/2 (x-x_0)^2 + dots
  $

  *Specialtilfælde — Maclaurin ($x_0 = 0$):* $P_n(x) = sum_(k=0)^n (f^((k))(0))/(k!) x^k$.
]

#lemma(
  name: "Lemma 4.3.1 — Taylor's formel",
)[
  Lad $f: I -> RR$ være vilkårligt ofte differentiabel, $x_0 in I$. For ethvert $x in I$ findes et $xi$ mellem $x$ og $x_0$ således at:
  $
    R_K(x) = f(x) - P_K(x) = (f^((K+1))(xi))/((K+1)!) (x - x_0)^(K+1)
  $
]

#lemma(
  name: "Sætning 4.3.3 — Taylor's theorem (fejlvurdering)",
)[
  Hvis $abs(f^((k))(x)) <= C$ for alle $k in NN$ og alle $x in I$:
  $
    abs(R_K(x)) = abs(f(x) - P_K(x)) <= C/((K+1)!) abs(x - x_0)^(K+1)
  $

  *I praksis:* Det er nok at finde et $M >= abs(f^((K+1))(t))$ for $t$ mellem $x$ og $x_0$. Bruger man dette $M$:
  $
    abs(R_K(x)) <= M/((K+1)!) abs(x - x_0)^(K+1)
  $
]

#note-box()[
  *Fremgangsmåde — Konstruér $P_n$:*

  + Beregn $f(x_0)$, $f'(x_0)$, $f''(x_0)$, $dots$, $f^((n))(x_0)$.
  + Sæt ind i formlen.

  *Fremgangsmåde — Find $f(x_0)$, $f'(x_0)$, $f''(x_0)$ FRA et givet $P_n$:*

  Hvis $P_2(x) = c_0 + c_1 (x - x_0) + c_2 (x - x_0)^2$ (skrevet på "centreret" form):
  - $f(x_0) = c_0$
  - $f'(x_0) = c_1$
  - $f''(x_0) = 2 c_2$

  *Hvis $P_2(x)$ er givet på standardform $a + b x + c x^2$:*
  - $f(x_0) = P_2(x_0)$ (sæt $x_0$ ind)
  - $f'(x_0) = P'_2(x_0)$ (differentiér og sæt ind)
  - $f''(x_0) = P''_2(x_0)$ (differentiér to gange og sæt ind)
]

#example(title: [Find $f(1), f'(1), f''(1)$ fra $P_2$])[
  $P_2(x) = 7/2 - 3x + 1/2 x^2$, udviklingspunkt $x_0 = 1$.

  #solution()[
    *$f(1)$:* $P_2(1) = 7/2 - 3 + 1/2 = 1$. Så $f(1) = 1$.

    *$f'(1)$:* $P'_2(x) = -3 + x$. Indsæt $x = 1$: $P'_2(1) = -3 + 1 = -2$. Så $f'(1) = -2$.

    *$f''(1)$:* $P''_2(x) = 1$ (konstant). Så $f''(1) = 1$.
  ]
]

#example(
  title: [Fejlvurdering],
)[
  Givet $P_2$ ovenfor med udviklingspunkt $x_0 = 1$, og $abs(f^((3))(x)) < 5$. Vurdér fejlen ved tilnærmelsen $f(0) approx P_2(0)$.

  #solution()[
    $P_2(0) = 7/2$.

    Lagrange-restled: $abs(R_2(0)) <= M/(3!) abs(0 - 1)^3 = 5/6 dot 1 = 5/6$.

    Så $f(0) = 7/2 plus.minus 5/6$.
  ]
]

== Standard Taylor-rækker (MEMORERE)

#align(center)[
  #table(
    columns: 2,
    stroke: 0.5pt,
    inset: 6pt,
    fill: (x, y) => if y == 0 { gray.lighten(80%) } else { none },
    table.header([*Funktion*], [*Maclaurin-række (udvikling om $0$)*]),
    [$e^x$],
    [$sum_(k=0)^infinity x^k/k! = 1 + x + x^2/2 + x^3/6 + dots$],
    [$sin(x)$],
    [$x - x^3/6 + x^5/120 - dots$],
    [$cos(x)$],
    [$1 - x^2/2 + x^4/24 - dots$],
    [$ln(1+x)$],
    [$x - x^2/2 + x^3/3 - x^4/4 + dots$ ($abs(x) < 1$)],
    [$1/(1-x)$],
    [$1 + x + x^2 + x^3 + dots$ ($abs(x) < 1$)],
    [$(1+x)^alpha$],
    [$1 + alpha x + (alpha(alpha-1))/2 x^2 + dots$],
  )
]

== Taylor i 2D (multivariable)

#definition(
  title: [Definition 4.5.1 — Taylor-polynomium af 2. orden, 2 variable],
)[
  For $f: U -> RR$ ($U$ åben i $RR^n$) med alle partielle afledte af 1. og 2. orden i $va(x)_0 in U$:
  $
    P_2(va(x)) = f(va(x)_0) + iprod((va(x) - va(x)_0), grad f(va(x)_0)) + 1/2 iprod((va(x) - va(x)_0), vb(H)_f(va(x)_0)(va(x) - va(x)_0))
  $

  *Udskrevet for 2D ($va(x)_0 = (a, b)$):*
  $
    P_2 &= f(a,b) + pdv(f, x_1)(a,b)(x_1 - a) + pdv(f, x_2)(a,b)(x_2 - b) \
        &+ 1/2 [pdv(f, x_1, 2)(a,b)(x_1 - a)^2 + 2 pdv(f, x_1, x_2)(a,b)(x_1 - a)(x_2 - b) + pdv(f, x_2, 2)(a,b)(x_2 - b)^2]
  $
]

#theorem(title: "Sætning 4.6.1 — Taylor's formel (multivariat)")[
  For $C^2$-funktion $f$, har restleddet $R_2 = f - P_2$ formen:
  $
    R_2(va(x)) = epsilon(va(x) - va(x)_0) norm(va(x) - va(x)_0)^2
  $
  hvor $epsilon(va(x) - va(x)_0) -> 0$ når $va(x) -> va(x)_0$.

  *Bemærk:* Ikke en lige så eksplicit fejlgrænse som i 1D — men bekræfter at $P_2$ er en god lokal tilnærmelse.
]

#note-box()[
  *Fremgangsmåde — $P_2$ for $f: RR^2 -> RR$ i $(a, b)$:*

  + Beregn $f(a, b)$.
  + Beregn $grad f$ og evaluér i $(a, b)$.
  + Beregn $vb(H)_f$ og evaluér i $(a, b)$.
  + Sæt ind i formlen.

  *Fremgangsmåde — Find udviklingspunkt $(a, b)$ FRA givet $P_2$ (MC-trick):*

  + Hvis $P_2$ allerede er "udvidet": Sammenlign 2.-ordens-led for at få $vb(H)_f(a,b)$.
  + 1.-ordens-led og funktionsværdi giver $grad f(a,b)$ og $f(a,b)$ via:
    - $P_2(a, b) = f(a, b)$
    - $pdv(P_2, x_1)(a, b) = pdv(f, x_1)(a, b)$, $pdv(P_2, x_2)(a, b) = pdv(f, x_2)(a, b)$
  + Match med kendt formel for $grad f$ → løs for $(a, b)$.

  *I praksis (MC):* Tjek hver mulighed: beregn $f(a,b)$ og $grad f(a,b)$ og se om $P_2(a, b) = f(a, b)$.
]

#example(
  title: [Find $P_2$ fra $f$ (forward direction)],
)[
  $f(x_1, x_2) = e^(x_1) cos(x_2)$. Find $P_2$ i $(0, 0)$.

  #solution(
    )[
    *Trin 1:* $f(0, 0) = e^0 cos 0 = 1$.

    *Trin 2 — gradient:*
    - $pdv(f, x_1) = e^(x_1) cos(x_2) ==> pdv(f, x_1)(0, 0) = 1$.
    - $pdv(f, x_2) = -e^(x_1) sin(x_2) ==> pdv(f, x_2)(0, 0) = 0$.

    *Trin 3 — Hesse:*
    - $pdv(f, x_1, 2) = e^(x_1) cos(x_2) ==> = 1$ i $(0,0)$.
    - $pdv(f, x_2, 2) = -e^(x_1) cos(x_2) ==> = -1$ i $(0,0)$.
    - $pdv(f, x_1, x_2) = -e^(x_1) sin(x_2) ==> = 0$ i $(0,0)$.

    *Trin 4 — sæt ind:*
    $
      P_2(x_1, x_2) & = 1 + 1 dot x_1 + 0 dot x_2 + 1/2 [1 dot x_1^2 + 2 dot 0 dot x_1 x_2 + (-1) dot x_2^2] \
                    & = 1 + x_1 + 1/2 x_1^2 - 1/2 x_2^2
    $

    *Tjek:* $e^x = 1 + x + x^2/2 + dots$ og $cos y = 1 - y^2/2 + dots$. Produkt op til grad 2: $(1 + x + x^2/2)(1 - y^2/2) approx 1 + x + x^2/2 - y^2/2 - dots$. ✓
  ]
]

#example(
  title: [Find udviklingspunkt fra $P_2$ (omvendt)],
)[
  $f(x_1, x_2) = 8/(x_1^2 + x_2^2 + 2)$, $P_2 = -x_1 x_2 - 2 x_1 + 2 x_2 + 5$.

  #solution(
    )[
    *MC-strategi:* Tjek $f(a,b) = P_2(a,b)$ for hver kandidat.

    Prøv $(1, -1)$: $f(1, -1) = 8/(1 + 1 + 2) = 2$. $P_2(1, -1) = -(1)(-1) - 2(1) + 2(-1) + 5 = 1 - 2 - 2 + 5 = 2$. ✓

    Tjek også $grad$: $grad f = -8 vec(2 x_1, 2 x_2) / (x_1^2 + x_2^2 + 2)^2 = -16/16 vec(x_1, x_2) = -vec(x_1, x_2)$ i $(1, -1)$.

    $grad f(1, -1) = -vec(1, -1) = vec(-1, 1)$.

    $grad P_2 = vec(-x_2 - 2, -x_1 + 2)$, i $(1, -1)$: $vec(1 - 2, -1 + 2) = vec(-1, 1)$. ✓

    *Svar:* $(a, b) = (1, -1)$.
  ]
]

#math-hint(
  )[
  *Kæderegel via Maclaurin:* Hvis $f(x) = g(h(x))$ og du kender $g$'s Maclaurin-række, substituér $h(x)$. F.eks. $e^(x^2) = 1 + x^2 + x^4/2 + dots$.

  *Pas på koefficienter:* Hvis $P_2(x) = a + b x + c x^2$ i $x_0 = 0$, så er $f(0) = a$, $f'(0) = b$, $f''(0) = 2 c$ (ikke $c$!).
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// EXTREMUM OG OPTIMERING
// ═══════════════════════════════════════════════════════════════════════════

= Extremum og Optimering

== Stationære punkter

#definition(title: [Stationært punkt])[
  $va(x)_0$ er et *stationært punkt* for $f$ hvis $grad f(va(x)_0) = va(0)$.

  Alle lokale ekstrema (af glatte $f$ på et åbent område) er stationære punkter.
]

#note-box()[
  *Fremgangsmåde — Find stationære punkter:*

  + Beregn $grad f$.
  + Sæt hver komponent = 0 og løs det resulterende ligningssystem.
  + List alle løsninger som stationære punkter.

  *Tips til løsning:*
  - Isolér én variabel i én ligning og indsæt i de andre.
  - Bemærk symmetri (f.eks. $x = y$ eller $x = -y$).
]

#example(title: [Find stationære punkter])[
  $f(x_1, x_2) = x_1^2 + 2 x_1 x_2 - 5 x_2^2 + 14 x_2$.

  #solution()[
    $grad f = vec(2 x_1 + 2 x_2, 2 x_1 - 10 x_2 + 14) = va(0)$

    $==>$ $x_1 + x_2 = 0 ==> x_1 = -x_2$.

    Indsæt: $2(-x_2) - 10 x_2 + 14 = 0 ==> -12 x_2 = -14 ==> x_2 = 7/6$.

    Så $x_1 = -7/6$.

    *Stationært punkt:* $(-7/6, 7/6)$.
  ]
]

== Klassifikation via Hesse-matrix

#theorem(
  title: "Sætning 5.2.4 — Anden-ordens partiel afledet-test",
)[
  Lad $va(x)_0$ være et stationært punkt for $C^2$-funktionen $f: U -> RR$ ($U$ åben i $RR^n$). Lad $vb(H) = vb(H)_f(va(x)_0)$. Da gælder:

  + *Alle egenværdier $> 0$* (positiv definit) $==>$ $va(x)_0$ er *strikt lokalt minimum*.
  + *Alle egenværdier $< 0$* (negativ definit) $==>$ $va(x)_0$ er *strikt lokalt maksimum*.
  + *Både positive og negative egenværdier* (indefinit) $==>$ $va(x)_0$ er *saddelpunkt*.
  + *Nogle egenværdier $= 0$ (singulær)*, øvrige med samme fortegn $==>$ *inkonklusiv* — kræver yderligere analyse.

  *Eksamenstrick:* Skriv "iflg. Sætning 5.2.4 ..." og angiv egenværdierne.
]

#important[
  *2D-shortcut (bevises ud fra Sætning 5.2.4):*

  Beregn $vb(H) = mat(A, B;B, C)$. Lad $det(vb(H)) = A C - B^2$.

  - $det(vb(H)) > 0$ og $A > 0$ → *lokalt minimum* (begge egenværdier $> 0$).
  - $det(vb(H)) > 0$ og $A < 0$ → *lokalt maksimum* (begge egenværdier $< 0$).
  - $det(vb(H)) < 0$ → *saddelpunkt* (egenværdier med modsat fortegn).
  - $det(vb(H)) = 0$ → *inkonklusiv*.

  *Hvorfor virker det:* For symmetrisk $2 times 2$ er $det(vb(H)) = lambda_1 lambda_2$ og $"tr"(vb(H)) = A + C = lambda_1 + lambda_2$. Så $det > 0$ betyder samme fortegn, $det < 0$ betyder modsat fortegn.

  *Hvilken at bruge på eksamen:* I 2D bruges shortcut'en typisk — men hvis spørgsmålet beder om "klassificér via egenværdier", så regn egenværdier direkte.
]

#example(
  title: [Klassifikation (2D)],
)[
  Fortsættelse: $f(x_1, x_2) = x_1^2 + 2 x_1 x_2 - 5 x_2^2 + 14 x_2$ i $(-7/6, 7/6)$.

  #solution(
    )[
    $vb(H)_f = mat(2, 2;2, -10)$ (konstant her).

    *Shortcut:* $det(vb(H)_f) = 2 dot (-10) - 2 dot 2 = -20 - 4 = -24 < 0$.

    *Konklusion:* $(-7/6, 7/6)$ er et *saddelpunkt* (iflg. Sætning 5.2.4 / 2D-shortcut).

    *Alternativ via egenværdier:* $det(vb(H) - lambda vb(I)) = (2-lambda)(-10-lambda) - 4 = lambda^2 + 8 lambda - 24$. Diskriminant $64 + 96 = 160$, så $lambda = (-8 plus.minus sqrt(160))/2 = -4 plus.minus 2 sqrt(10)$. Da $2 sqrt(10) approx 6.3 > 4$, har vi $lambda_1 > 0$ og $lambda_2 < 0$ → saddelpunkt iflg. Sætning 5.2.4 punkt (iii).
  ]
]

#example(
  title: [Klassifikation (3D — via egenværdier)],
)[
  Antag at stationært punkt $va(x)_0$ er fundet, og $vb(H)_f(va(x)_0) = mat(2, 0, 0;0, 3, 0;0, 0, 1)$.

  #solution(
    )[
    Matricen er diagonal, så egenværdierne er bare $lambda_1 = 2, lambda_2 = 3, lambda_3 = 1$ — alle $> 0$.

    *Konklusion:* $vb(H)_f(va(x)_0)$ er positiv definit, så $va(x)_0$ er et *strikt lokalt minimum* iflg. Sætning 5.2.4.
  ]
]

#math-hint()[
  *Klassifikations-shortcut for $n times n$ Hessens:*
  - Hvis $vb(H)$ er *diagonal* eller *triangulær*: egenværdier = diagonalindgange. Færdig.
  - Hvis $vb(H)$ er $2 times 2$: brug shortcut'en med $det$ og $A$.
  - Hvis $vb(H)$ er $3 times 3$ eller højere: regn karakteristisk polynomium $det(vb(H) - lambda vb(I)) = 0$.

  *MC-trick:* Hvis svarmulighederne nævner "saddelpunkt", "min", "max" — vurder egenværdiernes fortegn hurtigt:
  - Alle diag-elementer samme tegn + matricen "tæt på diagonal" → samme klassifikation.
  - Skiftende fortegn på diag → ofte saddel.
]

== Optimering på et lukket og begrænset område

#theorem(
  title: "Sætning 5.2.1 — Eksistens af globale ekstrema",
)[
  Lad $B subset.eq RR^n$ være *lukket og begrænset*, og $f: B -> RR$ kontinuert. Da har $f$ en minimal og en maksimal værdi på $B$.

  Hvis $B$ desuden er *sammenhængende*, har $f$'s billedmængde formen $f(B) = [m, M]$.
]

#theorem(title: "Sætning 5.2.2 — Hvor findes ekstrema?")[
  Hvis $f: A -> RR$ opnår min eller max i $va(x)_0 in A$, så er ét af følgende sandt:

  + $va(x)_0$ ligger på *randen* $partial A$.
  + $va(x)_0$ er et indre punkt hvor $f$ ikke er differentiabel.
  + $va(x)_0$ er et indre punkt hvor $grad f(va(x)_0) = va(0)$ (stationært punkt).
]

#note-box()[
  *Fremgangsmåde — Global ekstrema på lukket området $A$:*

  + Find alle stationære punkter af $f$ *i det indre* af $A$. Beregn $f$ i hvert.
  + Find ekstrema på *randen* af $A$:
    - Parametrisér randen (f.eks. cirkel: $(R cos t, R sin t)$, $t in [0, 2pi]$).
    - Indsæt → få en 1D-funktion $g(t)$ → diff. og find dens stationære punkter.
    - Evaluér $g$ ved stationære punkter og i endepunkter.
  + *Sammenlign alle $f$-værdier* → største er global max, mindste er global min.

  *Husk:* Lukket og begrænset → ekstrema findes garanteret (Sætning 5.2.1).
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// INTEGRATION I EN OG TO DIM
// ═══════════════════════════════════════════════════════════════════════════

= Integration i en og to dimensioner

== 1D-integration — Grundlæggende

#important[
  *Fundamentalsætningen:* $integral_a^b f(x) dd(x) = F(b) - F(a)$ hvor $F'(x) = f(x)$.
]

#note-box(
  )[
  *Fremgangsmåde — Integration ved substitution:*

  + Vælg $u = g(x)$.
  + Beregn $dd(u) = g'(x) dd(x)$.
  + Erstat $g(x)$ med $u$, og $g'(x) dd(x)$ med $dd(u)$.
  + Ændr grænserne: nye grænser er $g(a)$ og $g(b)$.
  + Integrér ifht. $u$.

  *Fremgangsmåde — Partiel integration:*
  $
    integral u dd(v) = u v - integral v dd(u)
  $
  Vælg $u$ (let at diff.) og $dd(v)$ (let at integrere). "LIATE"-prioritet: Logaritme, Inverse trig, Algebraisk, Trig, Eksponential.
]

#example(title: [Substitution])[
  $integral_0^1 2x e^(x^2) dd(x)$.

  $u = x^2 ==> dd(u) = 2x dd(x)$. Grænser: $x=0 ==> u=0$, $x=1 ==> u=1$.

  $= integral_0^1 e^u dd(u) = [e^u]_0^1 = e - 1$.
]

== Kurvelængde

#lemma(name: "Længde af parametriseret kurve")[
  For $va(r): [a, b] -> RR^n$:
  $
    L = integral_a^b norm(va(r)'(u)) dd(u)
  $
]

#note-box()[
  *Fremgangsmåde — Kurvelængde:*

  + Beregn $va(r)'(u)$ (komponentvis differentiering).
  + Beregn $norm(va(r)'(u)) = sqrt(sum (r_i'(u))^2)$.
  + Integrér fra $a$ til $b$.

  *Standardintegralet at huske:*
  $
    integral sqrt(a^2 + x^2) dd(x) = x/2 sqrt(a^2 + x^2) + a^2/2 ln(x + sqrt(a^2 + x^2)) + C
  $
]

#example(title: [Kurvelængde])[
  $va(r)(u) = (u^2, u + 3)$, $u in [0, 3]$.

  #solution()[
    $va(r)'(u) = (2 u, 1)$, $norm(va(r)'(u)) = sqrt(4 u^2 + 1)$.

    $L = integral_0^3 sqrt(4 u^2 + 1) dd(u)$.

    Brug standardintegralet med $x = 2u, dd(x) = 2 dd(u)$, men nemmest direkte:
    $
      integral sqrt(4 u^2 + 1) dd(u) = u/2 sqrt(4 u^2 + 1) + 1/4 ln(2u + sqrt(4 u^2 + 1)) + C
    $

    $L = [u/2 sqrt(4u^2+1) + 1/4 ln(2u + sqrt(4 u^2+1))]_0^3 = 3/2 sqrt(37) + 1/4 ln(6 + sqrt(37))$.
  ]
]

== Dobbeltintegraler — Rektangel

#lemma(
  name: "Fubini",
)[
  For $f$ kontinuert på $R = [a, b] times [c, d]$:
  $
    integral.double_R f dd(A) = integral_a^b integral_c^d f(x, y) dd(y) dd(x) = integral_c^d integral_a^b f(x, y) dd(x) dd(y)
  $
]

#note-box()[
  *Fremgangsmåde — Dobbeltintegral over rektangel:*

  + Vælg integrationsrækkefølge (det letteste først).
  + Beregn det *indre* integral (behandl den ydre variabel som konstant).
  + Beregn det *ydre* integral af resultatet.
]

== Dobbeltintegraler — Generelle områder

#note-box()[
  *Fremgangsmåde — Område $A$ givet ved $a <= x <= b$, $g_1(x) <= y <= g_2(x)$:*

  $
    integral.double_A f dd(A) = integral_a^b integral_(g_1(x))^(g_2(x)) f(x, y) dd(y) dd(x)
  $

  *Trin:*
  + Skitsér området.
  + Identificér $x$-grænser (lodret strip).
  + For hver $x$: find $y$-grænser (oppefra og nedefra).
  + Beregn indefra og udad.
]

== Polære koordinater (2D)

#important[
  *Substitution til polære koord.:*
  $
    x = r cos theta, quad y = r sin theta, quad x^2 + y^2 = r^2
  $

  *Jacobiant:* $r$ (HUSK!).

  $
    integral.double_A f(x, y) dd(A) = integral.double_(tilde(A)) f(r cos theta, r sin theta) dot r dd(r) dd(theta)
  $
]

#note-box()[
  *Fremgangsmåde — Polære koordinater:*

  + Substituér $x = r cos theta, y = r sin theta$.
  + Erstat $dd(A) = dd(x) dd(y)$ med $r dd(r) dd(theta)$.
  + Beskriv området i $(r, theta)$:
    - Cirkelskive radius $R$: $0 <= r <= R$, $0 <= theta <= 2 pi$.
    - Halvskive ($y >= 0$): $0 <= r <= R$, $0 <= theta <= pi$.
    - Ring: $R_1 <= r <= R_2$.
  + Integrér.
]

#example(
  title: [Areal/volumen via polære koord.],
)[
  Beregn $integral.double_A abs(x_1) dd(x_1, x_2)$ hvor $A = {x_1^2 + x_2^2 <= 4, x_2 >= 0}$.

  #solution(
    )[
    Halvcirkelskive radius $2$: $0 <= r <= 2$, $0 <= theta <= pi$.

    $abs(x_1) = abs(r cos theta) = r abs(cos theta)$.

    $
      integral.double_A abs(x_1) dd(x_1, x_2) & = integral_0^pi integral_0^2 r abs(cos theta) dot r dd(r) dd(theta) \
                                              & = (integral_0^2 r^2 dd(r)) (integral_0^pi abs(cos theta) dd(theta))
    $

    $integral_0^2 r^2 dd(r) = 8/3$.

    $integral_0^pi abs(cos theta) dd(theta) = integral_0^(pi/2) cos theta dd(theta) + integral_(pi/2)^pi (-cos theta) dd(theta) = 1 + 1 = 2$.

    Resultat: $8/3 dot 2 = 16/3$.
  ]
]

#math-hint(
  )[
  *Polære områder — visualisering:*
  - $0 <= r <= a$, $0 <= theta <= 2 pi$ → cirkelskive.
  - $theta <= r <= 2 theta$, $pi/4 <= theta <= 3 pi/2$ → spiral-segment (område mellem to spiraler).

  *MC-trick:* Når $r$ afhænger af $theta$ (f.eks. $r = theta$), så er det en spiral. Plot et par punkter for $theta = 0, pi/4, pi/2, dots$ for at se formen.
]

== Generel substitution (Jacobi-determinant)

#lemma(
  name: "Substitutionsformel — generel",
)[
  Lad $vb(T): U -> V$ være en $C^1$-diffeomorfi. Da gælder:
  $
    integral.double_V f(va(y)) dd(va(y)) = integral.double_U f(vb(T)(va(u))) abs(det vb(J)_(vb(T))(va(u))) dd(va(u))
  $

  *Husk absolutværdien!*
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// INTEGRATION I HØJERE DIM
// ═══════════════════════════════════════════════════════════════════════════

= Integration i højere dimensioner

== Tripel-integraler — Grundlæggende

#note-box()[
  *Fremgangsmåde — Volumen af område $V$ defineret af $z$-bounds over flade $A$:*

  Hvis $V = {(x, y, z) | (x, y) in A, g_1(x, y) <= z <= g_2(x, y)}$:
  $
    "Vol"(V) = integral.triple_V dd(V) = integral.double_A (g_2(x, y) - g_1(x, y)) dd(A)
  $

  *Generelt integral:*
  $
    integral.triple_V f dd(V) = integral.double_A integral_(g_1)^(g_2) f(x, y, z) dd(z) dd(A)
  $
]

#example(title: [Volumen mellem grafe])[
  $V = {(x_1, x_2, x_3) | (x_1, x_2) in A, 0 <= x_3 <= abs(x_1)}$ hvor $A = {x_1^2 + x_2^2 <= 4, x_2 >= 0}$.

  Volumen $= integral.double_A abs(x_1) dd(A) = 16/3$ (fra forrige eksempel).
]

== Cylindriske koordinater

#important[
  $
    x = r cos theta, quad y = r sin theta, quad z = z
  $
  $
    "Jacobiant" = r
  $
  $
    integral.triple_V f dd(V) = integral.triple_(tilde(V)) f(r cos theta, r sin theta, z) dot r dd(r) dd(theta) dd(z)
  $
]

#note-box()[
  *Bruges når:*
  - Området er en cylinder, kegle eller har rotationssymmetri om $z$-aksen.
  - Integrand afhænger af $x^2 + y^2 = r^2$.
]

== Sfæriske koordinater

#important[
  *Bogens konvention (Eksempel 6.6.3 / Formel 6.78):*
  $
    x = r sin(theta) cos(phi), quad y = r sin(theta) sin(phi), quad z = r cos(theta)
  $
  hvor $r >= 0$, $theta in [0, pi]$ (*polar vinkel — målt fra positiv $z$-akse*), $phi in [0, 2pi)$ (azimuthal vinkel i $x y$-planen).

  $
    "Jacobiant" = r^2 sin(theta) quad ("Bogens formel " J_s(r, theta, phi) = r^2 sin(theta))
  $

  *Bemærk:* Nogle bøger bruger $rho, phi, theta$ med ombyttede roller. Bogens konvention er den ovenstående. Tjek altid eksamen-opgaven for at se hvilken konvention der bruges.

  $
    integral.triple_V f dd(V) = integral.triple_(tilde(V)) f(r sin theta cos phi, r sin theta sin phi, r cos theta) dot r^2 sin theta dd(r) dd(theta) dd(phi)
  $
]

#note-box(
  )[
  *Bruges når:*
  - Området er en kugle eller har sfærisk symmetri.
  - Integrand afhænger af $x^2 + y^2 + z^2 = r^2$.

  *Klassiker (Eksempel 6.6.4 i bogen):* Volumen af kugle med radius $R$:
  $
    "Vol" = integral_0^(2 pi) integral_0^pi integral_0^R r^2 sin theta dd(r) dd(theta) dd(phi) = R^3/3 dot 2 dot 2 pi = 4 pi R^3/3 quad checkmark
  $
]

#example(
  title: [Volumen af halvkugle],
)[
  Halvkugle radius $R$, $z >= 0$: $0 <= r <= R$, $0 <= theta <= pi/2$ (kun øvre halvdel), $0 <= phi < 2 pi$.

  $
    "Vol" = (integral_0^R r^2 dd(r))(integral_0^(pi/2) sin theta dd(theta))(integral_0^(2 pi) dd(phi)) = R^3/3 dot 1 dot 2 pi = (2 pi R^3)/3
  $
]

#math-hint(
  )[
  *Faktor-trick:* Hvis integranden kan skrives som produkt $f_1(r) f_2(theta) f_3(z)$ (eller tilsvarende i sfæriske), og grænserne er konstante, så er integralet et produkt af 1D-integraler:

  $
    integral.triple = integral f_1 dd(r) dot integral f_2 dd(theta) dot integral f_3 dd(z)
  $

  Dette sparer MASSER af tid.
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// VEKTORFELTER & INTEGRATION
// ═══════════════════════════════════════════════════════════════════════════

= Parametriske kurver, kurve- og fladeintegraler (afsnit 7.1, 7.2)

== Parametriske kurver

#definition(title: [Parametriseret kurve])[
  En *parametriseret kurve* i $RR^n$ er en kontinuert funktion $va(r): [a, b] -> RR^n$.

  *Regulær:* $va(r)$ er $C^1$ og $va(r)'(u) eq.not va(0)$ for alle $u in (a, b)$.

  $va(r)'(u)$ er *tangentvektoren* til kurven i punktet $va(r)(u)$.
]

#example(
  title: [Almindelige kurver],
)[
  - *Cirkel (radius $R$):* $va(r)(u) = (R cos u, R sin u)$, $u in [0, 2 pi]$.
  - *Halvcirkel (øvre):* $va(r)(u) = (cos u, sin u)$, $u in [0, pi]$.
  - *Helix:* $va(r)(u) = (cos u, sin u, u)$, $u in [0, 2 pi]$.
  - *Lige linje fra $va(a)$ til $va(b)$:* $va(r)(u) = (1 - u) va(a) + u va(b) = va(a) + u(va(b) - va(a))$, $u in [0, 1]$.
]

== Linjeintegral af skalar funktion (afsnit 7.2)

#definition(
  title: [Definition 7.2.1 — Linjeintegral af skalar funktion],
)[
  For en kontinuert funktion $f: A -> RR$ ($A subset.eq RR^n$) og en regulær, stykkevis $C^1$ kurve $C = va(r)([a, b]) subset.eq A$:
  $
    integral_C f dd(s) = integral_a^b f(va(r)(u)) norm(va(r)'(u)) dd(u)
  $

  *Specialtilfælde — kurvelængde:* Sæt $f equiv 1$:
  $
    "length"(C) = integral_C 1 dd(s) = integral_a^b norm(va(r)'(u)) dd(u)
  $

  *Bemærk:* Integralet er uafhængigt af parametrisering (Bemærkning 7.2.1).
]

#note-box()[
  *Fremgangsmåde — Linjeintegral af skalar funktion:*

  + Find $va(r)'(u)$ (komponentvis afledet).
  + Find $norm(va(r)'(u)) = sqrt(sum (r_i '(u))^2)$.
  + Beregn $f(va(r)(u))$ (indsæt parametrisering i $f$).
  + Integrér $f(va(r)(u)) norm(va(r)'(u))$ fra $a$ til $b$.
]

#example(title: [Længde af halvcirkel])[
  $va(r)(u) = (cos u, sin u)$, $u in [0, pi]$.

  $va(r)'(u) = (-sin u, cos u)$, $norm(va(r)'(u)) = sqrt(sin^2 u + cos^2 u) = 1$.

  $"length" = integral_0^pi 1 dd(u) = pi$. ✓ (Halvdelen af cirklens omkreds $2 pi r = 2 pi$.)
]

#example(title: [Længde af helix])[
  $va(r)(u) = (cos u, sin u, u)$, $u in [0, 2 pi]$.

  $va(r)'(u) = (-sin u, cos u, 1)$, $norm(va(r)'(u)) = sqrt(sin^2 + cos^2 + 1) = sqrt(2)$.

  $"length" = integral_0^(2 pi) sqrt(2) dd(u) = 2 sqrt(2) pi$.
]

== Fladeintegral af skalar funktion (afsnit 7.2)

#definition(
  title: [Fladeintegral],
)[
  For flade $F = va(r)(Omega)$ ($Omega subset.eq RR^2$, $va(r): Omega -> RR^n$ regulær):
  $
    integral.double_F f dd(S) = integral.double_Omega f(va(r)(va(u))) norm(pdv(va(r), u_1) times pdv(va(r), u_2)) dd(u_1) dd(u_2)
  $
  (kun $n = 3$; for højere $n$ bruges $sqrt(det(vb(J)_(va(r))^T vb(J)_(va(r))))$).

  *Specialtilfælde — fladeareal:* Sæt $f equiv 1$.
]

#math-hint(
  )[
  *Fladeintegraler er sjældne på 1b-eksamen* (kun grundbegrebet). Du behøver kun at kende formlen og kunne bruge den hvis spurgt.

  *Bemærk:* User-specifik undtagelse — sidste 4 sider af 7.2 ("Surface integrals of vector fields" og forfremde stykker) er IKKE pensum.
]

#pagebreak()

= Vektorfelter & Integration (afsnit 7.3, 7.4)

== Vektorfelter — Definitioner

#definition(
  title: [Vektorfelt],
)[
  Et *vektorfelt* er en funktion $va(V): U subset.eq RR^n -> RR^n$, dvs. til hvert punkt $va(x)$ knyttes en vektor $va(V)(va(x))$.
]

#definition(
  title: [Definition 7.3.1 — Gradientfelt (konservativt felt)],
)[
  $va(V)$ er et *gradientfelt* (har et *skalarpotentiale*) hvis der findes en $C^1$-funktion $f: U -> RR$ så:
  $
    va(V) = grad f
  $
  $f$ kaldes en *stamfunktion* eller *skalarpotentiale*.

  *Fysisk navn:* "konservativt vektorfelt"; $f$ er det "skalare potentiale". I fysik bruges nogle gange $va(V) = -grad f$ (modsat fortegn).
]

== Test: Er $va(V)$ et gradientfelt?

#lemma(
  name: "Lemma 7.3.1 — Symmetri-test (nødvendig betingelse)",
)[
  Lad $U subset.eq RR^n$ være åben, og $va(V): U -> RR^n$ være $C^1$.

  Hvis $va(V)$ er gradientfelt, så er $vb(J)_(va(V))(va(x))$ symmetrisk for alle $va(x) in U$:
  $
    pdv(V_i, x_j) = pdv(V_j, x_i) quad forall i, j
  $

  *Bevis (skitse):* Hvis $va(V) = grad f$, så er $V_i = pdv(f, x_i)$, og derfor $pdv(V_i, x_j) = pdv(f, x_i, x_j)$. Iflg. Schwarz' sætning er Hessens symmetrisk.
]

#lemma(
  name: "Lemma 7.3.2 — Symmetri er TILSTRÆKKELIG på simply connected",
)[
  Lad $U subset.eq RR^n$ være *åben og enkelt sammenhængende (simply connected)*, og $va(V): U -> RR^n$ være $C^1$.

  Hvis $vb(J)_(va(V))(va(x))$ er symmetrisk for alle $va(x) in U$, så *er* $va(V)$ et gradientfelt.

  *I 2D:* Tjek kun: $pdv(V_1, x_2) = pdv(V_2, x_1)$.
]

#important[
  *Hvad er "simply connected"?* Et åbent område der er sammenhængende OG "uden huller". Specielt:

  - *$RR^n$ er stjerneformet* (Definition 7.3.3) og dermed simply connected. ✓
  - *Konvekse mængder* (rektangler, kugler) er stjerneformede. ✓
  - $RR^2 backslash {bold(0)}$ er IKKE simply connected (har et hul).
  - $RR^3 backslash {bold(0)}$ ER simply connected.

  *På eksamen:* Det er som regel nok at sige *"$RR^n$ er stjerneformet, derfor enkelt sammenhængende"* og henvise til Lemma 7.3.2.
]

#note-box()[
  *Fremgangsmåde — Vis at $va(V)$ er gradientfelt på $RR^n$:*

  + Bemærk at $RR^n$ er stjerneformet (Definition 7.3.3) og derfor enkelt sammenhængende.
  + Beregn Jacobi-matricen $vb(J)_(va(V))$.
  + Tjek at $vb(J)_(va(V))$ er symmetrisk (alle "krydsafledte" stemmer overens).
  + *Skriv:* "Iflg. Lemma 7.3.2 er $va(V)$ et gradientfelt."
]

#example(title: [Vis $va(V)$ er gradientfelt])[
  $va(V)(x, y) = vec(2 x y + cos x, x^2 + 1)$.

  #solution()[
    *Skitse:* $RR^2$ er stjerneformet.

    Beregn de blandede partielle:
    - $pdv(V_1, y) = pdv((2 x y + cos x), y) = 2 x$
    - $pdv(V_2, x) = pdv((x^2 + 1), x) = 2 x$

    De er lig hinanden, så $vb(J)_(va(V))$ er symmetrisk. Derfor er $va(V)$ et gradientfelt på $RR^2$.
  ]
]

== Find stamfunktion (skalarpotentiale)

#note-box()[
  *Fremgangsmåde 1 — Direkte integration ("stykke for stykke"):*

  Givet $va(V)(x, y) = vec(V_1, V_2)$ (et 2D gradientfelt).

  + Integrér $V_1$ ifht. $x$: $f(x, y) = integral V_1 dd(x) + g(y)$ ($g(y)$ er "konstant" ifht. $x$).
  + Differentiér resultatet ifht. $y$ og sæt = $V_2$.
  + Løs for $g'(y)$, så $g(y)$.
  + Læg evt. konstant $C$ til.

  *Hvis værdi i punkt er givet:* Indsæt punkt og løs for $C$.
]

#note-box()[
  *Fremgangsmåde 2 — Linje-integral fra $va(0)$ langs $va(r)(t) = t va(x)$ (sikker metode):*

  Hvis $va(V)$ er gradientfelt og $f(va(0)) = 0$:
  $
    f(va(x)) = integral_0^1 iprod(va(V)(t va(x)), va(x)) dd(t)
  $

  + Beregn $va(V)(t va(x))$ (indsæt $t va(x)$ i $va(V)$).
  + Beregn skalarproduktet med $va(x) = vec(x_1, dots, x_n)$.
  + Integrér ifht. $t$ fra 0 til 1.
]

#example(title: [Find stamfunktion (metode 1)])[
  $va(V)(x_1, x_2) = vec(2 x_2^2, 4 x_1 x_2)$. Find $f$ med $f(1,1) = 12$.

  #solution()[
    *Trin 1:* $f(x_1, x_2) = integral 2 x_2^2 dd(x_1) = 2 x_1 x_2^2 + g(x_2)$.

    *Trin 2:* $pdv(f, x_2) = 4 x_1 x_2 + g'(x_2)$. Sæt $= V_2 = 4 x_1 x_2$:
    $==> g'(x_2) = 0 ==> g(x_2) = C$ (konstant).

    *Trin 3:* $f(x_1, x_2) = 2 x_1 x_2^2 + C$.

    *Trin 4 (konstant):* $f(1, 1) = 2 + C = 12 ==> C = 10$.

    Svar: $f(x_1, x_2) = 2 x_1 x_2^2 + 10$.
  ]
]

#example(title: [Stamfunktion via linjeintegral (metode 2)])[
  $va(V)(x, y) = vec(2 x y + cos x, x^2 + 1)$. Antag $f(0,0) = 0$.

  #solution()[
    Linje fra $va(0)$ til $(x, y)$: $va(r)(t) = (t x, t y)$, $va(r)'(t) = (x, y)$.

    $
      va(V)(va(r)(t)) = vec(2 (t x)(t y) + cos(t x), (t x)^2 + 1) = vec(2 t^2 x y + cos(t x), t^2 x^2 + 1)
    $

    $
      iprod(va(V)(va(r)(t)), va(r)'(t)) & = (2 t^2 x y + cos(t x)) x + (t^2 x^2 + 1) y \
                                        & = 2 t^2 x^2 y + x cos(t x) + t^2 x^2 y + y \
                                        & = 3 t^2 x^2 y + y + x cos(t x)
    $

    Integrér ifht. $t$ fra 0 til 1:
    $
      f(x, y) & = integral_0^1 (3 t^2 x^2 y + y + x cos(t x)) dd(t) \
              & = x^2 y [t^3]_0^1 + y [t]_0^1 + [sin(t x)]_0^1 \
              & = x^2 y + y + sin(x)
    $

    *Tjek:* $grad f = vec(2 x y + cos x, x^2 + 1) = va(V)$ ✓
  ]
]

== Tangentielt kurveintegral

#definition(
  title: [Definition 7.4.1 — Linjeintegral af vektorfelt],
)[
  For kurve $C$ med regulær, stykkevis $C^1$-parametrisering $va(r): [a, b] -> RR^n$:
  $
    integral_C va(V) dot dd(va(s)) = integral_a^b iprod(va(V)(va(r)(u)), va(r)'(u)) dd(u)
  $

  *Notation-advarsel:* "$va(V) dot dd(va(s))$" er KUN notation — man kan ikke tage et skalarprodukt mellem $va(V)$ og $dd(va(s))$.
]

#lemma(name: "Lemma 7.4.1 — Fundamentalsætningen for kurveintegraler")[
  Lad $va(V): U -> RR^n$ være kontinuert vektorfelt med stamfunktion $f$ (dvs. $va(V) = grad f$). Da gælder:
  $
    integral_C va(V) dot dd(va(s)) = f(va(r)(b)) - f(va(r)(a))
  $

  *Konsekvenser:*
  + Integralet afhænger KUN af endepunkterne, ikke af kurven.
  + For en *lukket* kurve er integralet 0 (cirkulationssætningen, Korollar 7.4.3).

  *Eksamenstrick:* Skriv "iflg. Lemma 7.4.1 ..." og indsæt endepunkter.
]

#theorem(
  title: "Sætning 7.4.2 — Beregning af stamfunktion via linjeintegral",
)[
  Hvis $va(V): U -> RR^n$ er gradientfelt og $va(x)_0 in U$, så er stamfunktionen $f$ der opfylder $f(va(x)_0) = 0$ givet ved:
  $
    f(va(x)) = integral_C va(V) dot dd(va(s))
  $
  for *enhver* stykkevis $C^1$-kurve $C$ fra $va(x)_0$ til $va(x)$.

  *I praksis:* Vælg $va(x)_0 = va(0)$ og $va(r)(t) = t va(x)$ (lige linje). Andre stamfunktioner er $f + c$ for konstant $c in RR$.
]

#note-box()[
  *Fremgangsmåde — Tangentielt kurveintegral:*

  *Metode A (HVIS gradientfelt):*
  + Find stamfunktion $f$.
  + Beregn $f(va(r)(b)) - f(va(r)(a))$. Færdig.

  *Metode B (direkte beregning):*
  + Beregn $va(r)'(u)$.
  + Indsæt $va(r)(u)$ i $va(V)$.
  + Beregn skalarproduktet $iprod(va(V)(va(r)(u)), va(r)'(u))$ (giver en 1D-funktion af $u$).
  + Integrér fra $a$ til $b$.

  *Tip:* Hvis $va(V)$ er gradientfelt, brug ALTID metode A — meget hurtigere!
]

#example(title: [Kurveintegral via fundamentalsætningen])[
  $va(V)(x_1, x_2) = vec(2 x_2^2, 4 x_1 x_2)$ (gradientfelt med $f = 2 x_1 x_2^2 + 10$).

  $va(r)(u) = (u^2 + u + 1, u + 1)$, $u in [0, 3]$.

  #solution()[
    Endepunkter:
    - $va(r)(0) = (1, 1)$
    - $va(r)(3) = (9 + 3 + 1, 4) = (13, 4)$

    $f(13, 4) = 2(13)(16) + 10 = 416 + 10 = 426$.
    $f(1, 1) = 2(1)(1) + 10 = 12$.

    $integral_C va(V) dot dd(va(s)) = 426 - 12 = 414$.
  ]
]

#math-hint(
  )[
  *Klassiske fælder:*

  + *Glem ikke at tjekke at $va(V)$ ER gradientfelt* før du bruger fundamentalsætningen.
  + Hvis området *ikke* er stjerneformet (f.eks. $RR^2$ uden et punkt), så er symmetri *nødvendig* men *ikke tilstrækkelig*.
  + Husk: stamfunktion er kun bestemt op til en konstant — konstanten betyder ingenting for integralet.
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════
// EXAMENS-CHEAT SHEET (sidste side)
// ═══════════════════════════════════════════════════════════════════════════

= Eksamens-cheat sheet

== Hvad du SKAL kunne udenad

#important[
  *Top 10 huskereglene:*

  + *Gradient*: $grad f = vec(pdv(f, x_1), pdv(f, x_2), dots)$.
  + *Hesse-matrix 2D*: $vb(H) = mat(f_(x x), f_(x y);f_(y x), f_(y y))$ — symmetrisk for $C^2$.
  + *Hesse-test 2D*: $det vb(H) > 0$ og $A > 0$ → min; $A < 0$ → max; $det vb(H) < 0$ → saddel.
  + *Polære Jacobiant*: $r$.
  + *Sfæriske Jacobiant* (bogens konv.): $r^2 sin theta$ (med $theta$ = vinkel fra +z-akse).
  + *Indre produkt*: $iprod(va(u), va(v)) = sum u_i v_i$.
  + *Projektion*: $op("proj")_(va(u)) va(v) = iprod(va(v), va(u))/iprod(va(u), va(u)) va(u)$.
  + *Taylor 1D*: $P_n(x) = sum (f^((k))(x_0))/k! (x-x_0)^k$.
  + *Lagrange-restled*: $abs(R_n) <= M/((n+1)!) abs(x - x_0)^(n+1)$.
  + *Gradientfelt-test*: symmetri af $vb(J)_(va(V))$ på stjerneformet område.
]

== Faste fraser ("script")

#note-box(
  )[
  *Til opgaver om gradientfelt (Lemma 7.3.2):*
  "Da $RR^n$ er stjerneformet (Definition 7.3.3) og dermed enkelt sammenhængende, og Jacobi-matricen $vb(J)_(va(V))$ er symmetrisk (da $pdv(V_i, x_j) = pdv(V_j, x_i)$), er $va(V)$ et gradientfelt iflg. Lemma 7.3.2."

  *Til Hesse-test (saddel, Sætning 5.2.4):*
  "Egenværdierne af $vb(H)_f(va(x)_0)$ har forskelligt fortegn (eller: $det(vb(H)_f(va(x)_0)) < 0$), så $va(x)_0$ er et saddelpunkt iflg. Sætning 5.2.4."

  *Til Hesse-test (min):*
  "Da $vb(H)_f(va(x)_0)$ har kun positive egenværdier (eller: $det > 0$ og $A > 0$), er $va(x)_0$ et strikt lokalt minimum iflg. Sætning 5.2.4."

  *Til Lagrange-restled (Sætning 4.3.3):*
  "Iflg. Taylors formel er $abs(R_K(x)) <= M/((K+1)!) abs(x - x_0)^(K+1)$, hvor $M >= abs(f^((K+1))(t))$ på intervallet. Med $M = ..., x = ..., x_0 = ...$ får vi $abs(R_K) <= ...$"

  *Til stamfunktion (Sætning 7.4.2):*
  "Da $va(V)$ er gradientfelt, eksisterer en stamfunktion $f$ med $grad f = va(V)$. Iflg. Sætning 7.4.2 kan $f$ beregnes som $integral_C va(V) dot dd(va(s))$ langs $va(r)(t) = t va(x), t in [0,1]$."

  *Til linjeintegral via Lemma 7.4.1:*
  "Da $va(V) = grad f$ er gradientfelt, er $integral_C va(V) dot dd(va(s)) = f(va(r)(b)) - f(va(r)(a))$ iflg. Lemma 7.4.1."

  *Til kvadratisk form (Spektralsætningen, Sætning 2.8):*
  "Iflg. Spektralsætningen kan $vb(A)$ (symmetrisk) skrives $vb(A) = vb(Q) vb(D) vb(Q)^T$ hvor $vb(Q)$ er ortogonal og $vb(D)$ diagonal. I de nye koordinater $tilde(va(x)) = vb(Q)^T va(x)$ er $q(va(x)) = lambda_1 tilde(x)_1^2 + lambda_2 tilde(x)_2^2$."
]

== Sætningsoversigt — Hvor i bogen?

#align(center)[
  #table(
    columns: 2,
    stroke: 0.5pt,
    inset: 6pt,
    fill: (x, y) => if y == 0 { gray.lighten(80%) } else { none },
    table.header([*Sætning/Lemma*], [*Hvad det siger*]),
    [Definition 3.3.X],
    [Gradient definition],
    [Definition 3.5.1],
    [Hesse-matrix definition],
    [Sætning 3.6.5 (Schwarz)],
    [$C^2 ==>$ Hesse symmetrisk],
    [Lemma 4.3.1],
    [Taylor's formel 1D med $xi$-form],
    [Sætning 4.3.3],
    [Taylor's theorem — fejlvurdering i 1D],
    [Definition 4.5.1],
    [Taylor-polynomium 2. orden multivariate],
    [Sætning 4.6.1],
    [Taylor's formel multivariate ($epsilon$-form)],
    [Sætning 5.2.1],
    [Eksistens af globale ekstrema på lukket+begrænset],
    [Sætning 5.2.2],
    [Hvor ligger ekstrema (rand, ikke-diff, stationær)],
    [Sætning 5.2.4],
    [*Anden-ordens test via egenværdier af Hesse*],
    [Sætning 2.8 (Spektralsætningen)],
    [Symm. matrix → ortog. diagonaliserbar],
    [Sætning 6.4.1 / 6.6.2],
    [Change of variables, $abs(det vb(J))$-faktor],
    [Eksempel 6.6.3],
    [Spheriske/cylindriske koord. definition],
    [Lemma 7.3.1],
    [Gradientfelt $==>$ symmetrisk Jacobi],
    [Lemma 7.3.2],
    [Simply connected + symm. Jacobi $==>$ gradientfelt],
    [Definition 7.4.1],
    [Linjeintegral af vektorfelt],
    [Lemma 7.4.1],
    [Fundamentalsætning — $integral va(V) dot dd(va(s)) = f("end") - f("start")$],
    [Sætning 7.4.2],
    [Stamfunktion via linjeintegral fra $va(x)_0$],
    [Korollar 7.4.3],
    [Cirkulationssætning — lukket kurve $==>$ integral $=0$],
  )
]

== MC-strategi

#math-hint()[
  + *Læs ALLE svarmuligheder først* — de fortæller dig ofte hvilken form svaret skal have.
  + *Sæt værdier ind baglæns* — hurtigere end at regne forfra. Især for matrix-spørgsmål.
  + *Dimensions-tjek* — eliminér svar med forkert form/dimension.
  + *Plug $0$ eller $1$ ind* hvis muligt — funktioner skal stemme.
  + *Egenværdi-tjek*: For "er $va(v)$ egenvektor?" beregn $vb(A) va(v)$ og se om det er $lambda va(v)$.
  + *Tag aldrig minustegn* i MC — selv et tilfældigt gæt giver point i forventning.
  + *Skitsér grafer* i polære/grafiske MC-spørgsmål — plot 3-4 punkter for at se formen.

  *Tidsbudget:* Brug ikke mere end ~3 min pr. MC-spørgsmål. Gæt og gå videre hvis fastlåst.
]

== Almindelige typer opgaver — Hurtig genkendelse

#align(center)[
  #table(
    columns: 2,
    stroke: 0.5pt,
    inset: 6pt,
    fill: (x, y) => if y == 0 { gray.lighten(80%) } else { none },
    table.header([*Type*], [*Strategi*]),
    [Find gradient],
    [Diff. mht. hver variabel],
    [Find Hesse],
    [Diff. gradient mht. hver variabel],
    [Find stationære punkter],
    [$grad f = va(0)$ → løs lin/ulin. system],
    [Klassificér ekstremum],
    [$det(vb(H))$-test eller egenværdier],
    [Taylor-polynomium],
    [Beregn afledte i udviklingspunkt + indsæt formel],
    [Fejlvurdering],
    [Lagrange-restled $M/((n+1)!) abs(x-x_0)^(n+1)$],
    [Tjek kontinuitet (1D)],
    [$lim_(x->x_0^-) = lim_(x->x_0^+) = f(x_0)$],
    [Tjek diff. (1D)],
    [Differenskvotient eller $f'_- = f'_+$],
    [Gradientfelt?],
    [Jacobi-matrix symmetrisk på stjerneformet område],
    [Find stamfunktion],
    [Integrér en komp., diff. for $g(y)$, indsæt],
    [Tangentielt kurveintegral],
    [$f("end") - f("start")$ (hvis gradientfelt)],
    [Volumen mellem grafer],
    [$integral.double_A (g_2 - g_1) dd(A)$],
    [Volumen kugle],
    [Sfæriske koord., Jac. $r^2 sin theta$],
    [Volumen cylinder/kegle],
    [Cylindriske koord., Jac. $r$],
    [Ortogonal basis],
    [Gram-Schmidt + normér],
    [Reducer kvadr. form],
    [Find egenværdier af $vb(A)$ symmetrisk; $vb(Q)^T vb(A) vb(Q) = vb(D)$],
    [Diagonaliser symmetrisk],
    [Egenværdier + ortonormale egenvektorer → $vb(Q)$],
    [Definitehed],
    [Egenværdiernes fortegn (eller $det$ og spor i 2D)],
  )
]

#important[
  *Sidste råd:*

  + *Skriv selv hvis du er i tvivl.* Partial credit > tom svar.
  + *Henvis til sætninger* fra bogen — sparer tid og ord.
  + *Aldrig henvis til DEFINITIONER* (ifølge spørgetimen — kun sætninger og eksempler).
  + *Svar på alle MC* — ingen minuspoint.
]
