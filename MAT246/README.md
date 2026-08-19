# MAT246 — Concepts in Abstract Mathematics

Slide decks for MAT246 (LEC0101), Fall 2026.

## Layout

| File | Textbook chapter |
| --- | --- |
| `slides-01.typ` | 1 — Introduction (+ Appendix A, Elements of Style) |
| `slides-02.typ` | 2 — Mathematics and Logic |
| `slides-03.typ` | 3 — Set Theory |
| `slides-04.typ` | 4 — Induction |
| `slides-07.typ` | 7 — Relations and Partitions |
| `slides-08.typ` | 8 — Functions |
| `slides-09.typ` | 9 — Cardinality |

`preamble.typ` holds the shared touying/metropolis configuration and the
`slide`, `exercise`, `parts`, `defn`, `thm` and `digraph` helpers. It is not a
standalone document and is not built by CI.

Chapters 5 and 6 of the textbook are not on the syllabus, so there are no decks
for them.

## Sources

Problems in `slides-02`, `slides-03`, `slides-04`, `slides-07` and `slides-08`
are ported from

> *Practicing Proofs: MAT246 Handouts*, Noha ElGarem, Gal Gross, Tonatiuh Matos
> Wiederhold and Stan Yoshinobu (University of Toronto, 2025).
> <https://danaernst.com/IBL-IntroToProof/PracticingProofs.pdf>

which accompanies the course textbook

> *An Introduction to Proof via Inquiry-Based Learning*, Dana C. Ernst.
> <https://danaernst.com/IBL-IntroToProof/>

The handouts cover §2.1 through §8.4 only. `slides-01` and `slides-09` have no
counterpart there, so their problems come from the textbook directly; those
slides are marked with an `Ernst, ...` attribution rather than a
`Practicing Proofs, Exercise N` one.

Both works are licensed
[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/), so these decks
are too.

## Deviations from the printed handouts

* Exercise 77 prints the product term as `(-1)^n/(n+1)` under an index running
  over `k`. The worked solution expands it as
  `(1 - 1/2)(1 + 1/3)(1 - 1/4)...`, so the index really is `k`; the deck uses
  `(-1)^k/(k+1)`.
* Exercise 57 asks to prove `(a,b) != (a,b)`; this is a typo for
  `(a,b) != (b,a)`, which is what the deck says.
* Exercise 134(c) names both functions `f`; the deck calls the first one `g`,
  matching how it is used.
* Exercise 141(h) declares `g' : X_odd -> X_even`; since `g(Y_even) = X_odd`,
  the inverse map lands in `Y_even`, which is what the deck says.
* Several exercises (91, 93, 99, 119) refer to figures. Those are images in the
  handout PDF, so the digraphs and tables here were drawn locally with the
  `digraph` helper and are not pixel-copies of the originals.

## Building

```sh
typst compile --font-path ../fonts MAT246/slides-02.typ
```

from the repository root. CI builds every deck listed above and publishes the
PDFs to the GitHub Pages site.
