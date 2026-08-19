#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import "@preview/cetz:0.4.2"
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/itemize:0.2.0"
#show: itemize.default-enum-list

#let slide(..args) = {
  let named = args.named()
  let title = named.at("title", default: none)
  let autoscale = named.at("autoscale", default: true)
  let positional = args.pos()
  slide-orig(title: text(size: 18pt, title), ..positional.map(p => {
    show: if autoscale {
      utils.fit-to-height.with(100%, grow: false)
    } else {
      it => it
    }
    p
  }))
}

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => {
    show: pad.with(x: -.51em, bottom: -.51em)
    block(width: 100%, height: 100%, fill: self.colors.neutral-darkest)
  },
  config-info(
    title: [MAT235 Slides LEC0401 (Chapter 20)],
    subtitle: [Jason Siefken],
    // author: [Jason Siefken],
    // date: datetime.today(),
    // institution: [University of Toronto],
  ),
  footer-progress: false,
  footer-right: none,
  config-page(margin: (top: 1.3em, bottom: 8.5cm, x: .5em)),
)

#let definition(it, title: none) = block(
  breakable: false,
  cb.colorbox(
    title: title,
    color: (
      fill: rgb("#e3e3e3"),
      stroke: rgb("#49164e"),
      title: rgb("#002366"),
    ),
    radius: 4pt,
    width: auto,
    it,
  ),
)

// SLIDES CONTENT

#set text(font: "Fira Sans")


#title-slide()


#slide(title: [Siefken 1], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #columns(2)[
    #{
      let width = 9cm
      let height = width
      let plot(f, title: none) = {
        lq.diagram(
          title: title,
          width: width,
          height: height,
          lq.quiver(
            lq.arange(-2, 3, step: .5),
            lq.arange(-2, 3, step: .5),
            f,
          ),
          xaxis: none,
          yaxis: none,
          lq.place(1, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                line((0, 0), (0, 1), mark: (symbol: "[]"), stroke: 2pt, name: "rod")
                line((0, .13), (1, .13), mark: (end: (symbol: "[]")), stroke: 2pt)

                content("rod.mid", [$R$], anchor: "east", padding: .5em)
                content("rod.start", [$arrow(p)$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot((x, y) => (-y, calc.sin(y + 1) + x / 5), title: $arrow(F):RR^2 -> RR^2$)
    }
    #colbreak()
    The orthogonal frame, $R$, with side lengths $h$, is being pushed at its ends by a field
    $arrow(F)$.

    Its bottom-left corner is located at $arrow(p)$.

    + The rotational force on $R$ is given by
      $
        (arrow(F)(p + mat(h; 0)) - & arrow(F)(p))dot mat(0; 1) \
                                   & + (arrow(F)(p + mat(0; h)) - arrow(F)(p))dot mat(-1; 0)
      $

      Why is the vector $mat(-1; 0)$ used instead of $mat(1; 0)$?

    + Write a formula that approximates the _normalized_ rotational force (i.e., the rotational
      force divided by $h$) using partial derivatives.
  ]
]



#slide(title: [Siefken 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .73em)

  #columns(2)[

    #{
      let width = 9cm
      let height = width
      let plot(f, title: none) = {
        lq.diagram(
          title: title,
          width: width,
          height: height,
          lq.quiver(
            lq.arange(-2, 3, step: .5),
            lq.arange(-2, 3, step: .5),
            f,
          ),
          xaxis: none,
          yaxis: none,
          lq.place(1, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                rect((0, 0), (1, 1), name: "square")

                // line((0, 0), (0, 1), mark: (symbol: "[]"), stroke: 2pt, name: "rod")
                // line((0, .13), (1, .13), mark: (end: (symbol: "[]")), stroke: 2pt)

                // content("square.mid", [$R$], anchor: "east", padding: .5em)
                content((0, 0), [$arrow(p)$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot((x, y) => (-y, calc.sin(y + 1) + x / 5), title: $arrow(F):RR^2 -> RR^2$)
    }

    Let $S$ be a square of side length $h$ with lower-left corner at $arrow(p)$.

    *Theorem*: The (counter-clockwise) circulation per unit area around $S$ is approximately the
    (counter-clockwise) normalized rotational force on an orthogonal frame aligned with $S$.

    The limit of circulation per unit area as the area shrinks to zero is called the *circulation
    density*.

    + Use what you know about rotational forces to write down an approximation for the circulation
      per unit area around $S$.
    + Find the circulation density at $arrow(p)$.
    + Find an approximation for the circulation around $S$ (not normalized).
  ]
]

#slide(title: [Siefken 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[

    Suppose $arrow(F):RR^(#text(fill: orange, $3$)) ->RR^(#text(fill: orange, $3$))$.

    The circulation density at the point $arrow(p)$ *around an axis $arrow(v)$* is the limit of the
    circulation per unit area around a square with normal vector $arrow(v)$.

    Let $arrow(v)=(0,0,1)$.

    + Draw a diagram of a square with lower-left corner at $arrow(p)$, side lengths $h$, and normal
      vector $arrow(v)$.
    + Use your diagram to find the circulation density at $arrow(p)$ around the axis $arrow(v)$.

      _Hint:_ thinking about normalized rotational forces might make it easier.

      #colbreak()
    + Annotate the squares below with arrows indicating how a *counter clockwise* circulation would
      flow around the (positive) $arrow(z)$-axis.
      #set align(center)
      #stack(
        dir: ltr,
        spacing: 1em,
        cetz.canvas({
          import cetz.draw: *

          // content((0, 1.6, 0), anchor: "south", text(size: 14pt, [()]))


          line((0, 0), (x: 2), mark: (end: ">"), name: "x")
          line((0, 0), (y: -2), mark: (end: ">"), name: "y")
          line((0, 0), (z: 2), mark: (end: ">"), name: "z")


          line((0, 0), (y: -1), stroke: 2pt + blue)
          line((1, 0), (y: -1, x: 1), stroke: 2pt + blue)
          line((0, 0), (x: 1), stroke: 2pt + blue)
          line((0, -1), (x: 1, y: -1), stroke: 2pt + blue)

          content("x.end", anchor: "west", $y$)
          content("y.end", anchor: "north", $x$)
          content("z.end", anchor: "north", $z$)
        }),
        cetz.canvas({
          import cetz.draw: *

          // content((0, 1.6, 0), anchor: "south", text(size: 14pt, [()]))


          line((0, 0), (x: 2), mark: (end: ">"), name: "x")
          line((0, 0), (y: -2), mark: (end: ">"), name: "y")
          line((0, 0), (z: -2), mark: (end: ">"), name: "z")


          line((0, 0), (y: -1), stroke: 2pt + blue)
          line((1, 0), (y: -1, x: 1), stroke: 2pt + blue)
          line((0, 0), (x: 1), stroke: 2pt + blue)
          line((0, -1), (x: 1, y: -1), stroke: 2pt + blue)

          content("x.end", anchor: "west", $x$)
          content("y.end", anchor: "north", $y$)
          content("z.end", anchor: "west", $z$)
        }),
      )
    + Find the circulation density at $arrow(p)$ around the axis $arrow(v)=(0,1,0)$.
    + Find the circulation density at $arrow(p)$ around the axis $arrow(v)=(1,0,0)$.
  ]
]

#slide(title: [Siefken 4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)

  #columns(2)[

    Suppose $arrow(F):RR^3 -> RR^3$.

    Let $arrow(p)$ be a point. Let $arrow(v)$ be the axis around which the circulation density of
    $arrow(F)$ is *greatest*.

    The *curl of $arrow(F)$ at $arrow(p)$* is a vector in the direction of $arrow(v)$ whose length
    is equal to the circulation density around $arrow(v)$.


    + Draw a vector field where the curl points along the $z$-axis.
    + Assuming that the curl of $arrow(F)$ points directly along the $z$-axis, write a formula for
      the curl of $arrow(F)$ at $arrow(p)$.

      *Theorem 1*: Any vector field $arrow(F):RR^3 -> RR^3$ can be decomposed into
      $arrow(F) = arrow(F)^x + arrow(F)^y + arrow(F)^z$, where $arrow(F)^x$ has curl only around the
      $x$-axis, $arrow(F)^y$ has curl only around the $y$-axis, etc..

      *Theorem 2*: Curl is additive. I.e., the curl of $arrow(F) + arrow(G)$ equals the curl of
      $arrow(F)$ plus the curl of $arrow(G)$.

    + Find formulas for the curl of $arrow(F)^x$, $arrow(F)^y$, and $arrow(F)^z$ at $arrow(p)$.
    + Find formulas for the curl of $arrow(F)$ at $arrow(p)$.
    + Why is curl of $arrow(F)$ written as $nabla times arrow(F)$ by physicists?
  ]
]

#slide(title: [Siefken 5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[

    + Let $R subset.eq RR^2$ be a region and let $arrow(F):RR^2->RR^2$ be a vector field.

      State _Green's theorem_.
    + Let $R subset.eq RR^3$ be a region and let $arrow(F):RR^3->RR^3$ be a vector field.

      *Stoke's theorem* is the 3d version of Green's theorem. What should Stoke's theorem say?

    + Let $K$ be a disk in the $x y$-plane in $RR^3$ oriented *up*.

      Draw $K$. What should the orientation of $partial K$ (the boundary of $K$) be?

    + Consider the cut sphere $S$, below, oriented *outward*.

      #{
        set align(center)
        image("images/cut-sphere.png", width: 50%)
      }
      What is the orientation of the boundary of $S$?
  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[

    + Let $R subset.eq RR^2$ be an _annulus_ (e.g., a washer shape). What should the orientation of
      the outer boundary of $R$ be? What about the inner boundary?

      #colbreak()
    + Consider the cut cone $C$, below, oriented *upward*.

      #{
        set align(center)
        image("images/cut-cone.png", width: 50%)
      }
      What is the orientation of each piece of the boundary of $C$?
  ]
]

#slide(title: [Siefken 7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[

    + Suppose $arrow(F):RR^3 -> RR^3$ is the gradient of another function.
      #set enum(numbering: "(a)")
      + What can you say about the circulation of $arrow(F)$ around a closed curve?
      + What can you say about the curl of $arrow(F)$?

    + Suppose $arrow(F):RR^3 -> RR^3$ is the curl of another function.
      #set enum(numbering: "(a)")
      + What can you say about the flux of $arrow(F)$ through a closed surface? (_Hint_: thinking
        about poking a small hole in your surface and shrinking the hole to size zero.)
      + What can you say about the divergence of $arrow(F)$?

    + Complete the formulas $nabla times nabla arrow(F) = space.thin?$ \ and
      $nabla dot (nabla times arrow(F)) = space.thin ??$.

    + If you have a surface or volume, $S$, what is $partial (partial S)$? (I.e., the boundary of
      the boundary of $S$)

      How does your answer fit with Stoke's theorem?
  ]
]
