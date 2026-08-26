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

`preamble.typ` holds the MAT246-specific pieces — the `exercise` helper and the
source citations — and re-exports everything from `../preamble.typ`. It is not a
standalone document and is not built by CI.

## Slide machinery

The slide machinery is **not** touying. It lives in [`../libs`](../libs), a copy
of the `book/libs/` tree of <https://github.com/siefkenj/IBLODEs>, shared with
MAT235 and MAT336; the course-agnostic helpers are in
[`../preamble.typ`](../preamble.typ). `slide`, `definition`, `theorem`,
`example` and `simple_table` behave exactly as they do upstream.

Two deliberate divergences from upstream:

* `../libs/cover.typ` is **removed**, and its import dropped from `lib.typ`.
  It draws a Van der Pol phase portrait over an IBLODEs background image, and
  its trailing self-preview call runs at *import* time, so merely importing
  `lib.typ` would fail without that image. The deck cover lives in
  `preamble.typ` instead.
* The `*.test.typ` files are removed; they reference IBLODEs modules we do not
  ship.

The library needs the fonts vendored in [`../fonts`](../fonts):
`Nimbus-Sans-L` (sans), `Bitstream-Charter` (serif) and `Latin-Mono` (mono),
all copied from IBLODEs. Always build with `--font-path`.

### Laying out a slide

`slide` measures its body and picks the layout itself: one column if it fits,
otherwise two columns, otherwise two columns scaled down. Work *with* that:

* Use `parts(...)` (a plain `enum`) for problem parts. Do not hand-roll a
  two-column grid — the autosizer will put your grid inside a column and
  squeeze it.
* Display maths cannot wrap, so a long `$...$` block is the one thing that
  reliably overflows a column. Prefer a list, or break the equation over
  several lines.
* `one-column: true` on `exercise` opts out of autosizing entirely (full frame
  width, no split, no scaling). It is right for wide tables, but it removes the
  overflow protection, so check the rendered page.
* The autosizer will not shrink past 0.85, so a slide can still be too full. The
  failure is easy to miss: the footer is painted *over* the body, so the
  overflowing text is hidden rather than overprinted. Split the slide in two.

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

The slide library in `libs/` is likewise CC BY-SA 4.0, by Jason Siefken and
Bernardo Galvão-Sousa.

## Attribution

All three upstream works are licensed
[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/), so these decks
are too, and the credit has to travel with the slides rather than sit only in
this file. It appears in three places:

* **Every slide footer** — `Adapted from <source>. © Jason Siefken, 2026 · CC
  BY-SA 4.0`. Which source is named comes from the `sources:` argument to
  `mat246-slides` at the top of each deck.
* **Each deck's cover** — the full citation for every upstream work the deck
  draws on, including the slide library, and the licence.
* **Individual slides** — a `Practicing Proofs, Exercise N` or
  `Ernst, ..., Problem N` line, from the `source:`/`book:` argument to
  `exercise`.

To add a source, extend the dictionaries near the top of `preamble.typ`
(`short` goes in the footer, `long` on the cover) and list it in the deck's
`sources:`.

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
typst compile --root . --font-path ./fonts MAT246/slides-02.typ
```

from the repository root. `--root .` is required: the deck imports
`../preamble.typ`, which is outside its own folder. CI builds every deck listed above and publishes the
PDFs to the GitHub Pages site.
