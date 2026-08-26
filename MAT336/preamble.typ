// MAT336-specific setup. Everything course-agnostic lives in
// `../preamble.typ`, which this re-exports.

#import "../preamble.typ": *

// The plots in this deck were written against lilaq 0.5; `../libs` pulls in
// 0.6, so pin the older one here. This binding shadows the library's `lq`.
#import "@preview/lilaq:0.5.0" as lq

#let mat336-slides(chapter-title, body) = course-slides(
  chapter-title,
  code: [MAT336],
  name: [Elements of Analysis],
  credits: ([
    Problems are a mixture of Jason Siefken's own and others'; copyright in those remains with
    their authors.
  ],),
  footer-credit: iblodes_libs_short,
  body,
)
