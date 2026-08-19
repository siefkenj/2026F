// Shared setup for the MAT246 slide decks.
//
// Each `slides-NN.typ` starts with
//
//     #import "preamble.typ": *
//     #show: mat246-theme.with([Chapter Title])
//
// which pulls in the touying/metropolis configuration below together with the
// `slide`, `defn`, `thm`, `parts` and `exercise` helpers.

#import "@preview/touying:0.6.1": *
#import "@preview/cetz:0.4.2"
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/itemize:0.2.0"

// Shorthand: in this course `subset` always means "subset or equal", matching
// the textbook's convention. `psubset` is the proper (strict) version.
#let subset = math.subset.eq
#let psubset = math.subset.neq
#let supset = math.supset.eq
// Symmetric difference.
#let symdiff = math.triangle.stroked.t

// Lay content out at the true width of a frame body, in a `box` so it cannot
// be split across frames.
//
// Both halves matter. Autoscaling measures the body in a container of
// unbounded width, so relative widths (`1fr`, `100%`) collapse unless they are
// pinned to an absolute size first; and a breakable body gets split onto a
// second frame instead of being scaled down. The side margins are 0.5em each,
// which is 10pt per side at the theme's 20pt base.
#let frame-body(body) = context box(width: page.width - 20pt, body)

// A `slide` that shrinks its body to fit the frame (as in the MAT336 deck).
#let slide(..args) = {
  let named = args.named()
  let title = named.at("title", default: none)
  let autoscale = named.at("autoscale", default: true)
  let positional = args.pos()
  slide-orig(title: text(size: 18pt, title), ..positional.map(p => {
    if autoscale {
      utils.fit-to-height(100%, grow: false, frame-body(p))
    } else {
      p
    }
  }))
}

// Coloured box used for definitions/theorems quoted from the textbook.
//
// Deliberately built from plain blocks rather than a package such as
// `colorful-boxes`: those use `state` + `measure` internally, which does not
// converge inside the autoscaling `slide` below.
#let boxed(it, title: none, accent: rgb("#49164e")) = block(
  breakable: false,
  width: 100%,
  radius: 4pt,
  clip: true,
  stroke: .8pt + accent,
  fill: rgb("#e9e9ec"),
  stack(
    if title != none {
      block(
        width: 100%,
        fill: accent,
        inset: (x: .7em, y: .4em),
        text(fill: white, weight: "bold", title),
      )
    },
    block(width: 100%, inset: (x: .7em, y: .55em), it),
  ),
)

#let defn(title, it) = boxed(it, title: title)
#let thm(title, it) = boxed(it, title: title, accent: rgb("#1b4d3e"))

// Enumerated problem parts. With more than `threshold` parts they are split
// into two columns; `enum(start: ...)` keeps the (a), (b), (c), ... numbering
// running across the break.
//
// The columns are `1fr`, which only does the right thing because `exercise`
// lays its body out inside a fixed-width box (see `frame-body` below) --- the
// autoscaling `slide` measures in an unbounded container, where `1fr` would
// otherwise collapse to the natural width of the text.
#let parts(..items, threshold: 4) = {
  let its = items.pos()
  if its.len() <= threshold {
    enum(..its)
  } else {
    let half = calc.ceil(its.len() / 2)
    grid(
      columns: (1fr, 1fr),
      column-gutter: 1.5em,
      enum(..its.slice(0, half)),
      enum(start: half + 1, ..its.slice(half)),
    )
  }
}

// A small directed graph, for drawing relations.
//
// `nodes` is an array of `(label, (x, y))`; `edges` an array of
// `(from-label, to-label)`; `loops` an array of labels that get a self-loop.
// Edges are drawn before the node discs so their endpoints are hidden under
// the discs, and each edge is nudged sideways so that a two-cycle a -> b,
// b -> a shows as two distinct arrows rather than one overprinted pair.
#let digraph(nodes, edges: (), loops: (), r: .3, gap: .1, scale: 1) = cetz.canvas(length: scale * 1cm, {
  import cetz.draw: *
  let pos = (:)
  for (name, p) in nodes { pos.insert(name, p) }
  for (a, b) in edges {
    let (ax, ay) = pos.at(a)
    let (bx, by) = pos.at(b)
    let (dx, dy) = (bx - ax, by - ay)
    let len = calc.sqrt(dx * dx + dy * dy)
    let (ux, uy) = (dx / len, dy / len)
    let (ox, oy) = (-uy * gap, ux * gap)
    // The end is pushed slightly past the disc so the arrowhead is not hidden
    // when the node is drawn on top.
    line(
      (ax + ux * r + ox, ay + uy * r + oy),
      (bx - ux * (r + .1) + ox, by - uy * (r + .1) + oy),
      mark: (end: "stealth", fill: black, scale: .5),
      stroke: .6pt,
    )
  }
  for name in loops {
    let (x, y) = pos.at(name)
    arc(
      (x - r * .72, y + r * .82),
      start: 205deg,
      stop: -25deg,
      radius: r * .8,
      mark: (end: "stealth", fill: black, scale: .5),
      stroke: .6pt,
    )
  }
  for (name, p) in nodes {
    circle(p, radius: r, fill: white, stroke: .7pt)
    content(p, text(size: .75em, name))
  }
})

// Attribution lines. `source:` cites the Practicing Proofs handouts; `book:`
// cites the Ernst textbook (used for the chapters the handouts do not cover).
#let attribution(it) = align(right, text(size: .6em, fill: gray.darken(15%), it))
#let src(n) = attribution[Practicing Proofs, Exercise #n]
#let bsrc(n) = attribution[Ernst, _An Introduction to Proof via IBL_, #n]

// A worksheet problem. `goal` is the italicised "the goal of this exercise
// is ..." blurb; `body` is the problem itself.
// The usable (light) part of a frame is short, so `slide` scales each body down
// to fit. Keep an exercise to roughly one screenful; split long ones across
// several `exercise` calls rather than letting one shrink to nothing.
#let exercise(title: none, source: none, book: none, goal: none, size: 1em, body) = slide(title: title)[
  #set text(size: size)

  #if goal != none {
    block(inset: (bottom: .4em), text(
      size: .85em,
      style: "italic",
      fill: rgb("#49164e"),
      goal,
    ))
  }
  #body
  #if source != none {
    src(source)
  }
  #if book != none {
    bsrc(book)
  }
]

#let mat246-theme(chapter-title, body) = {
  show: metropolis-theme.with(
    aspect-ratio: "16-9",
    footer: self => {
      show: pad.with(x: -.51em, bottom: -.51em)
      block(width: 100%, height: 100%, fill: self.colors.neutral-darkest)
    },
    config-info(
      title: [MAT246 --- #chapter-title],
      subtitle: [Jason Siefken],
    ),
    footer-progress: false,
    footer-right: none,
    config-page(margin: (top: 1.3em, bottom: 8.5cm, x: .5em)),
  )

  // (a), (i), ... nesting for enumerated problem parts.
  set enum(
    full: true,
    numbering: (..n) => {
      let level = n.pos().len() - 1
      let pattern = ("(a)", "(i)", "1.", "(A)").at(level, default: "1.")
      numbering(pattern, n.pos().last())
    },
  )
  show: itemize.default-enum-list

  set text(font: "Fira Sans")

  body
}
