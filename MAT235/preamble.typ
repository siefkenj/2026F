// MAT235-specific setup. Everything course-agnostic lives in
// `../preamble.typ`, which this re-exports.

#import "../preamble.typ": *

// The plots in these decks were written against lilaq 0.4/0.5; `../libs` pulls
// in 0.6, so pin the older one here. This binding shadows the library's `lq`.
#import "@preview/lilaq:0.5.0" as lq

#let mat235-slides(chapter-title, body) = course-slides(
  chapter-title,
  code: [MAT235],
  name: [Multivariable Calculus],
  credits: ([
    Problems are a mixture of Jason Siefken's own and others'; copyright in those remains with
    their authors.
  ],),
  footer-credit: credit_line_libs_short,
  body,
)
