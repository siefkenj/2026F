// Shared setup for every slide deck in this repository.
//
// A course's deck starts with
//
//     #import "preamble.typ": *
//     #show: matNNN-slides.with([Chapter Title])
//
// where `MATNNN/preamble.typ` binds the course code and name and re-exports
// everything defined here.
//
// The slide machinery comes from `../libs/`, a verbatim copy of the
// `book/libs/` tree of https://github.com/siefkenj/IBLODEs — keep it that way
// so it can be re-synced from upstream. Everything repo-specific lives here.

#import "libs/lib.typ": *
#import "libs/environment-slides.typ": slides_template

// ---------------------------------------------------------------------------
// Notation
// ---------------------------------------------------------------------------

// In this course `subset` always means "subset or equal", matching the
// textbook's convention. `psubset` is the proper (strict) version.
#let subset = math.subset.eq
#let psubset = math.subset.neq
#let supset = math.supset.eq
// Symmetric difference.
#let symdiff = math.triangle.stroked.t

// ---------------------------------------------------------------------------
// Boxes
// ---------------------------------------------------------------------------

// `definition` and `theorem` come from the libs and are used directly:
//
//     #definition(title: [Definition 2.1])[An integer $n$ is *even* if ...]
//     #theorem(title: [Well-Ordering Principle])[Every nonempty subset ...]
//
// Note `theorem` already prints the word "Theorem", so its title should be a
// bare name or number.

// A neutral aside (hints, "one possible approach"), in the same visual grammar
// as the libs' definition/theorem boxes.
#let aside(title, body) = {
  let accent = rgb("#1b4d3e")
  block(
    width: 100%,
    fill: accent.lighten(90%),
    stroke: (left: accent + 3pt),
    inset: 7pt,
    {
      show emph: it => text(it, fill: accent.darken(10%), weight: "bold")
      if title != none {
        sans(text(title + [.], fill: accent.darken(10%), weight: "bold"))
        h(.4em)
      }
      body
    },
  )
}

#let bogus_proof(body) = {
  let accent = rgb("#a12b2b")
  block(
    width: 100%,
    fill: accent.lighten(88%),
    stroke: (left: accent + 3pt),
    inset: 7pt,
    {
      show emph: it => text(it, fill: accent.darken(20%), weight: "bold")
      body
    },
  )
}

// ---------------------------------------------------------------------------
// Lists
// ---------------------------------------------------------------------------

// Enumerated problem parts are written as plain `+` markup enums.
//
// Keep them plain: the `slide` element measures its body and, when it does not
// fit in one column, reflows it into two by itself. Do not hand-roll a
// two-column grid here — that fights the autosizer and produces columns inside
// columns.
//
// The handful of exercises whose parts are interrupted by a paragraph of
// set-up prose resume their numbering with an explicit marker (`3.`) on the
// first item after the break.

// ---------------------------------------------------------------------------
// Attribution
// ---------------------------------------------------------------------------

#let CC_BY_SA = link(
  "https://creativecommons.org/licenses/by-sa/4.0/",
  text(font: ("Bitstream Charter", "Libertinus Serif"))[CC BY-SA 4.0],
)

// The slide library is itself CC BY-SA 4.0, so every deck has to credit it.
#let iblodes_libs = [
  Slide library from *IBLODEs* by Jason Siefken and Bernardo Galvão-Sousa, used under #CC_BY_SA.
]

// Footer-sized version, for decks whose own content is not CC BY-SA and which
// therefore credit only the library.
#let credit_line_libs_short = [Slide library: _IBLODEs_ (Siefken & Galvão-Sousa), #CC_BY_SA]

// A small right-aligned line, for citing the source of a single problem.
#let attribution(it) = align(right, text(size: .7em, fill: gray.darken(15%), it))

// ---------------------------------------------------------------------------
// Graphics
// ---------------------------------------------------------------------------

// A small directed graph, for drawing relations.
//
// `nodes` is an array of `(label, (x, y))`; `edges` an array of
// `(from-label, to-label)`; `loops` an array of labels that get a self-loop.
// Edges are drawn before the node discs so their endpoints are hidden under
// the discs, and each edge is nudged sideways so that a two-cycle a -> b,
// b -> a shows as two distinct arrows rather than one overprinted pair.
#let digraph(nodes, edges: (), loops: (), r: .3, gap: .1, scale: 1) = cetz.canvas(
  length: scale * 1cm,
  {
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
  },
)

// ---------------------------------------------------------------------------
// Fitting
// ---------------------------------------------------------------------------

/// Shrink `body` uniformly until it fits the frame.
///
/// The library's `slide` autosizer only changes the *text* size, which is
/// enough for prose but not for a deck built around cetz/lilaq figures: a
/// canvas with a fixed `length` does not care what size the text is. This
/// scales the whole thing geometrically instead, the way the decks behaved
/// before. It never grows content, only shrinks it.
#let fit-frame(body) = layout(size => context {
  // Lay `content` out at the frame width and report how far it must shrink.
  // Measuring at the real width matters: `measure` alone uses an unbounded
  // container, where `1fr` and `100%` collapse.
  let attempt(content) = {
    let plain = block(width: size.width, content)
    let natural = measure(plain).height
    if natural <= size.height or natural == 0pt {
      (factor: 1.0, body: plain)
    } else {
      let factor = size.height / natural
      // Re-flowing at a proportionally wider width lets prose keep using the
      // whole frame once it is scaled back down. But content whose height
      // tracks its width -- an `#image()` with no explicit size, say --
      // simply grows to match, so the compensation cancels out. Check it
      // before trusting it.
      let widened = block(width: size.width / factor, content)
      if measure(widened).height * factor <= size.height {
        (factor: factor, body: widened)
      } else {
        (factor: factor, body: plain)
      }
    }
  }

  let one = attempt(body)
  if one.factor >= 1.0 {
    one.body
  } else {
    scale(one.factor * 100%, origin: top + left, reflow: true, one.body)
  }
})

// ---------------------------------------------------------------------------
// Template
// ---------------------------------------------------------------------------

// The deck's opening slide. Deliberately not the libs' `make_cover`, which
// draws an ODE phase portrait.
#let cover(code, name, chapter-title, credits: ()) = {
  // The `set page` and the placement live inside a content block so they do
  // not leak onto the slides that follow; the `pagebreak` has to sit outside
  // any container, hence no `show: block` wrapper here.
  [
    #set page(header: none, footer: none, margin: (x: 1.2cm, top: 1cm, bottom: .8cm))
    #place(top + left, dy: 1cm, sans(block(
      width: 100%,
      stroke: (left: rgb("#00647d") + 6pt),
      inset: (left: 1em, y: .6em),
      {
        text(size: 32pt, weight: "bold", fill: rgb("#00647d"), code)
        linebreak()
        text(size: 20pt, name)
        v(.5em)
        text(size: 26pt, weight: "bold", chapter-title)
        v(.5em)
        text(size: 13pt, fill: gray.darken(30%))[Jason Siefken #h(1fr) Fall 2026]
      },
    )))
    #place(bottom + left, dx: 1.1em, box(width: 96%, text(size: 8pt, fill: gray.darken(25%), {
      set par(justify: false, leading: .5em)
      for c in credits {
        c
        linebreak()
      }
      iblodes_libs
    })))
  ]
  pagebreak(weak: true)
}

/// The document template. `footer-credit` rides on every slide; `credits` is
/// the fuller list shown once on the cover.
#let course-slides(
  chapter-title,
  code: none,
  name: none,
  credits: (),
  footer-credit: none,
  // Nesting pattern for enumerations: top-level parts are numbered, and the
  // levels below them lettered.
  enum-numbering: ("1.", "(a)", "(i)", "(A)"),
  body,
) = {
  show: slides_template
  show: e.prepare()
  // No modules in these decks, so the header should never try to number one.
  show: e.set_(module_settings, active: false)
  show: e.set_(slide_settings, copyright: {
    // The page number is placed at the top-centre of the footer band, so drop
    // below it; and cap the width so a long credit wraps instead of running
    // into the edge.
    v(1.1em)
    box(width: 78%, {
      set par(justify: false, leading: .45em)
      if footer-credit != none {
        footer-credit
        linebreak()
      }
      emph[#sym.copyright Jason Siefken, 2026]
    })
  })

  set enum(
    full: true,
    numbering: (..n) => {
      let level = n.pos().len() - 1
      let pattern = enum-numbering.at(level, default: enum-numbering.last())
      numbering(pattern, n.pos().last())
    },
  )
  set par(justify: false)
  // Pin the body font rather than relying on Typst's default, so the decks
  // render the same everywhere given the fonts vendored in `fonts/`.
  set text(font: ("Bitstream Charter", "Libertinus Serif"))

  cover(code, name, chapter-title, credits: credits)
  body
}
