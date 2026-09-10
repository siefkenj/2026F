// MAT246-specific setup. Everything course-agnostic lives in
// `../preamble.typ`, which this re-exports.

#import "../preamble.typ": *

// ---------------------------------------------------------------------------
// Sources
// ---------------------------------------------------------------------------

// Everything the MAT246 decks are built from is licensed CC BY-SA 4.0, so the
// decks are too — which means every slide has to carry the credit, not just
// the README. `sources` on `mat246-slides` picks the ones a given deck uses;
// the short forms go in the footer, the long forms on the cover.

#let practicing_proofs = (
  short: [_Practicing Proofs_ (ElGarem, Gross, Matos Wiederhold, Yoshinobu)],
  long: [
    Problems adapted from *Practicing Proofs: MAT246 Handouts* by Noha ElGarem, Gal Gross,
    Tonatiuh Matos Wiederhold and Stan Yoshinobu (University of Toronto, 2025).
  ],
)

#let ernst_textbook = (
  short: [Ernst, _An Introduction to Proof via IBL_],
  long: [
    Problems adapted from *An Introduction to Proof via Inquiry-Based Learning* by Dana C. Ernst.
  ],
)

#let ernst_style = (
  short: none,
  long: [
    Appendix A, *Elements of Style for Proofs*, is by Anders Hendrickson, as revised by Ernst.
  ],
)

// Attribution lines for a single problem. `source:` cites the Practicing
// Proofs handouts; `book:` cites the Ernst textbook.
#let src(n) = attribution[Practicing Proofs, Exercise #n]
#let bsrc(n) = attribution[Ernst, _An Introduction to Proof via IBL_, #n]

// ---------------------------------------------------------------------------
// Exercises
// ---------------------------------------------------------------------------

// A worksheet problem. `goal` is the italicised "the goal of this exercise
// is ..." blurb; `body` is the problem itself.
//
// `num_prefix` is passed straight through to `slide` and keeps its default of
// `none`. Pass `auto` to number the exercise; a warm-up simply leaves it off.
//
// `one-column: true` opts out of autosizing entirely (full frame width, no
// column split, no shrinking). Use it only when a display equation or table is
// wider than a column would be; it gives up the overflow protection, so check
// the result.
#let exercise(
  title: none,
  source: none,
  book: none,
  goal: none,
  size: none,
  two-column: none,
  one-column: false,
  num_prefix: none,
  body,
) = slide(
  title: title,
  autosize: not one-column,
  force_scale: size,
  two_columns: two-column,
  num_prefix: num_prefix,
)[
  #if goal != none {
    block(
      inset: (bottom: .4em),
      text(size: .85em, style: "italic", fill: rgb("#00647d").darken(15%), goal),
    )
  }
  #body
  #if source != none {
    src(source)
  }
  #if book != none {
    bsrc(book)
  }
]

// ---------------------------------------------------------------------------
// Template
// ---------------------------------------------------------------------------

#let mat246-slides(chapter-title, sources: (), body) = course-slides(
  chapter-title,
  code: [MAT246],
  name: [Concepts in Abstract Mathematics],
  credits: sources.map(s => s.long) + (
    [#sym.copyright Jason Siefken, 2026. Released under #CC_BY_SA, as are all of the above.],
  ),
  footer-credit: {
    let named = sources.map(s => s.short).filter(s => s != none)
    if named != () [Adapted from #named.join([; ]). #CC_BY_SA]
  },
  body,
)
