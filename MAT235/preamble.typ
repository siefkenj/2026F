// MAT235-specific setup. Everything course-agnostic lives in
// `../preamble.typ`, which this re-exports.

#import "../preamble.typ": *
#import "../preamble.typ": slide as lib-slide

// The plots in these decks were written against lilaq 0.4/0.5; `../libs` pulls
// in 0.6, so pin the older one here. This binding shadows the library's `lq`.
#import "@preview/lilaq:0.5.0" as lq

/// These decks are built around figures, and the library's own autosizer only
/// resizes *text*: it would leave an oversized cetz canvas oversized, and its
/// two-column height estimate assumes content splits evenly, which a 6cm
/// unbreakable diagram does not. So MAT235 slides go through `fit-frame`,
/// which shrinks geometrically and chooses the column count itself.
///
/// Slides therefore do not wrap their own content in `#columns(2)[...]`.
#let slide(..args) = lib-slide(
  title: args.named().at("title", default: none),
  autosize: false,
  fit-frame(args.pos().at(0, default: [])),
)

#let mat235-slides(chapter-title, body) = course-slides(
  chapter-title,
  code: [MAT235],
  name: [Multivariable Calculus],
  credits: ([
    Problems are a mixture of Jason Siefken's own and others'; copyright in those remains with
    their authors.
  ],),
  footer-credit: iblodes_libs_short,
  body,
)
