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
    title: [MAT235 Slides LEC0401 (Chapter 19)],
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
  #set text(size: .8em)

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
          lq.place(-1, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                line((0, 0), (0, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

                // content("rod.mid", [$R$], anchor: "west", padding: .5em)
                content("rod.start", [$A$], anchor: "north", padding: .2em)
              })
            })
          }),
          lq.place(1, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                line((0, 0), (2, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

                // content("rod.mid", [$R$], anchor: "west", padding: .5em)
                content("rod.start", [$B$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot((x, y) => (1, 0))
    }
    #colbreak()
    Some ants are having a race! But, it is a very boring race. They are all travelling at the same
    speed (5 m/hour) due east and the density of ants is 1000 ants per square metre.

    You set up two ant counters, $A$ and $B$.

    + If $A$ is 2 metre long, how many ants cross counter $A$ in one hour?
    + How many ants cross counter $B$ in one hour *compared to* counter $A$?
    + How many ants/hour/unit length cross counter $A$?
    + $B$ is at a 45 degree angle relative to $A$. How many ants/hour/unit length cross counter $B$?
  ]
]

#slide(title: [Siefken 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

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
          // lq.place(-1, 0, {
          //   cetz.canvas({
          //     import cetz.draw: *

          //     group(name: "figure", {
          //       let shift = 0.1

          //       line((0, 0), (0, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

          //       // content("rod.mid", [$R$], anchor: "west", padding: .5em)
          //       content("rod.start", [$A$], anchor: "north", padding: .2em)
          //     })
          //   })
          // }),
          lq.place(0, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                line((0, 0), (2, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

                // content("rod.mid", [$R$], anchor: "west", padding: .5em)
                content("rod.start", [$C$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot((x, y) => (1, 0))
    }
    #colbreak()
    Some ants are having a race! There are 1000 ants per square metre and they are all travelling
    5m/hour due east.

    Counter $C$ is 2 metres long and is oriented at angle $theta$ (measured counter clockwise from
    due east).

    + At what angle will counter $C$ count the *maximum* number of ants/hour?
    + At what angle will counter $C$ count the *minimum* number of ants/hour?
    + Find a formula for the number of ants/hour that cross counter $C$ in terms of $theta$.
  ]
]

#slide(title: [Siefken 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

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
          // lq.place(-1, 0, {
          //   cetz.canvas({
          //     import cetz.draw: *

          //     group(name: "figure", {
          //       let shift = 0.1

          //       line((0, 0), (0, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

          //       // content("rod.mid", [$R$], anchor: "west", padding: .5em)
          //       content("rod.start", [$A$], anchor: "north", padding: .2em)
          //     })
          //   })
          // }),
          lq.place(0, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                line((0, 0), (2, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

                // content("rod.mid", [$R$], anchor: "west", padding: .5em)
                content("rod.start", [$C$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot((x, y) => (1, 0))
    }
    #colbreak()
    Some ants are having a race! There are 1000 ants per square metre and they are all travelling
    5m/hour due east.

    Counter $C$ is 2 metres long and is oriented at angle $theta$ (measured counter clockwise from
    due east).

    A *normal vector* to a point on a surface is a non-zero vector orthogonal to the surface.

    + Find a normal vector to counter $C$ (your answer will depend on theta).
    + Find a *unit normal* vector to counter $C$ (i.e., a normal vector of length 1).
    + Find a formula for the number of ants/hour that cross counter $C$ in terms of the unit normal
      vector.
  ]
]

#slide(title: [Siefken 4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    The *flux* of a vector field through a surface is the amount of material per second that the
    vector field would "push through" the surface.

    + In the ant questions, the ant's velocities could be described by a vector field
      $arrow(F): RR^2 -> RR^2$ and the counter was described by a curve $C$.

      Rephrase the ant question(s) using the term "flux".

    + Suppose $arrow(G): RR^2 -> RR^2$ is a constant vector field. Let $Q$ be the line segment from
      $(0,0)$ to $(1,1)$.

      How can you find the flux of $arrow(G)$ through $Q$?

    + Suppose $arrow(H): RR^2 -> RR^2$ is non-constant vector field. Let $Q$ be the line segment
      from $(0,0)$ to $(1,1)$.

      How can you estimate the flux of $arrow(H)$ through $Q$?

      How could you find the _exact_ flux of $arrow(H)$ through $Q$?
  ]
]

#slide(title: [Siefken 5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    #{
      let width = 9cm
      let height = width
      let plot(f, title: none) = {
        let ts = lq.arange(-1, 1.1, step: 0.1)
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
          lq.plot(
            ts.map(t => -t * t + 1),
            ts,
            mark: none,
            stroke: 3pt,
          ),
        )
      }

      plot(
        (x, y) => (3, 1), //, title: [$arrow(F)(x,y)=(3,1)$]
      )
    }
    #colbreak()

    On the left is the vector field $arrow(F)(x,y)=(3, 1)$ and the curve $C$ parameterized by
    $
      arrow(r)(t)=(-t^2 + 1, t) wide "for" wide t in [-1,1].
    $

    + Draw the segment of $C$ from $t=0$ to $t=0.5$.
    + Estimate the flux through the segment of $C$ from $t=0$ to $t=0.5$.
    + How can $arrow(r)'(0)$ be used to get an estimate similar to the previous part?
    + Can you set up an integral to find the exact flux through the segment of $C$ from $t=-1$ to
      $t=1$?
  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    Let $arrow(F):RR^3 -> RR^3$ be given by $arrow(F)(x,y,z)=(1,0,0)$

    + Let $S$ be a _unit square_ with normal vector $arrow(n)=(1,0,0)$. Find the flux of $arrow(F)$
      through $S$.
    + Let $S$ be a unit square with normal vector $arrow(n)=(2,0,0)$. Find the flux of $arrow(F)$
      through $S$.
    + Let $S$ be a unit square with normal vector $arrow(n)=(1,1,1)$. Find the flux of $arrow(F)$
      through $S$.
      #colbreak()

      Let $Q$ be the unit square with sides $arrow(a) = (0,0,1)$,
      $arrow(b)=(sqrt(2)/2, sqrt(2)/2, 0)$ and corner at the origin.

      Let $arrow(G)(x,y,z) = (x+2y,1, y-z)$

    + How could one find the flux of $arrow(G)$ through $Q$?
    + Parameterize $Q$.
    + Find a normal vector to "$dif A$", a tiny piece of $Q$.

      How long should this normal vector be to be useful when approximating the flux through $Q$?
    + Set up and evaluate an integral to find the flux of $arrow(G)$ through $Q$.
  ]
]

#slide(title: [Siefken 7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $arrow(F):RR^3 -> RR^3$ be given by $arrow(F)(x,y,z)=(x,2y,3z)$

    Let $C$ be a cylinder of radius 2 and height 1 centered on the $z$ axis.

    Let $P$ be a parameterization of $C$.

    + Is $RR^2$ an appropriate domain for $P$? If not, what would be an appropriate domain?
    + Find a parameterization $P$ for the surface of the cylinder.
    + Consider the rectangle with corners $P(t,s)$, $P(t + Delta t, s)$, $P(t, s + Delta s)$,
      $P(t + Delta t, s + Delta s)$.

      Use partial derivatives to find an (approximate) normal vector and the (approximate) area of
      this rectangle.

    + Set up an integral to find the flux of $arrow(F)$ through $C$.

    + Find the flux of $arrow(F)$ through $C$.
  ]
]

#slide(title: [Siefken 8], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[

    Let $S$ be the surface defined by the parameterization $P(t,s) = mat(t; s; cos(t)+cos(s))$ where
    $(t,s) in [-pi, pi]^2$

    + Explore

      https://www.desmos.com/3d/qoh1kzqemv

      What are the parameters $k_1$ and $k_2$ and $Delta$ doing?

    + Is the shaded grey patch an exact parallelogram? Why or why not?

    + Find an approximate normal vector and the approximate area of the shaded grey patch. (Your
      answer will depend on $k_1$ and $k_2$.)

    + Let $arrow(F):RR^3 -> RR^3$ be a vector field. Set up an integral to find the flux of
      $arrow(F)$ through $S$.
  ]
]

#slide(title: [Siefken 9], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $arrow(F):RR^3 -> RR^3$ be a vector field and let $S$ be a surface.

    The flux of $arrow(F)$ through $S$ is often written
    $
      integral_S arrow(F) dot dif arrow(A)
    $

    + Explain why this notation makes sense. What does $dif arrow(A)$ represent?
    + What is the difference between $dif arrow(A)$ and the $dif A$ we had from 2-d integrals?
    + In practice, how do we "find" $dif arrow(A)$?
  ]
]

#slide(title: [Siefken 10], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    The unit sphere can be parameterized by
    $
      arrow(p)(theta, phi) = mat(
        cos(theta) sin(phi);
        sin(theta) sin(phi);
        cos(phi)
      )
    $
    with $(theta, phi) in [0, 2pi] times [0, pi]$

    + Find the flux of $arrow(F)(x,y,z) = (x,2y,3z)$ through the unit sphere (oriented outward).
    + Find the flux of $arrow(F)(x,y,z) = (x,2y,3z)$ through the unit sphere (oriented inward).
  ]
]

#slide(title: [Siefken 11], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    #{
      let width = 9cm
      let height = width
      let plot(f, title: none) = {
        let ts = lq.arange(-1, 1.1, step: 0.1)
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
          lq.place(0, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                rect((0, 0), (3, 3), stroke: blue + 2pt, name: "rod")
                content("rod.center", [$S$], anchor: "center", padding: .2em)
                content("rod.south-west", [$arrow(p)$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot(
        (x, y) => (3, 1), //, title: [$arrow(F)(x,y)=(3,1)$]
      )
    }
    #colbreak()

    Let $arrow(F): RR^2 -> RR^2$ be a vector field.

    Consider the square $S$ with side lengths $h$ and lower left corner at $arrow(p)$.

    + What are the options for the orientation of $S$ for a *path integral*? What about for a *flux
      integral*?
    + Write down the coordinates of the corners of $S$ in terms of $arrow(p)$ and $h$.
    + Write down an integral (or sum of integrals) for the total flux of $arrow(F)$ through $S$
      (oriented outward).
  ]
]

#slide(title: [Siefken 12], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .81em)

  #columns(2)[
    #{
      let width = 9cm
      let height = width
      let plot(f, title: none) = {
        let ts = lq.arange(-1, 1.1, step: 0.1)
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
          lq.place(0, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                rect((0, 0), (3, 3), stroke: blue + 2pt, name: "rod")
                content("rod.center", [$S$], anchor: "center", padding: .2em)
                content("rod.south-west", [$arrow(p)$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot(
        (x, y) => (3, 1), //, title: [$arrow(F)(x,y)=(3,1)$]
      )
    }
    #colbreak()

    Let $arrow(F): RR^2 -> RR^2$ be a vector field.

    Consider the square $S$ with side lengths $h$ and lower left corner at $arrow(p)$.

    + Consider
      $
        arrow(F)(arrow(p)) dot arrow(p) wide
        arrow(F)(arrow(p)) dot mat(-h; 0) wide
        arrow(F)(arrow(p)) dot mat(0; -h)
      $
      Which best approximates the flux through the _left_ side of $S$? When is the approximation
      good?
    + Find approximations of the flux through the other sides of $S$.
    + Find an approximation for the total flux through $S$.
  ]
]

#slide(title: [Siefken 13], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Recall $arrow(F): RR^2 -> RR^2$ is a vector field and $S$ is a square with side lengths $h$ and
    lower left corner at $arrow(p)$.

    We know
    $
      "flux through" S approx \
      arrow(F)(arrow(p)) dot mat(-h; 0) +
      arrow(F)(arrow(p) + mat(h; 0)) dot mat(h; 0) + \
      arrow(F)(arrow(p)) dot mat(0; -h) +
      arrow(F)(arrow(p) + mat(0; h)) dot mat(0; h)
    $

    #colbreak()

    + Find a formula for the approximate flux through $S$ *per unit area*.
    + Approximations to $partial/(partial x) arrow(F)(arrow(p))$ and
      $partial/(partial y) arrow(F)(arrow(p))$ appear in your formula. Where are they?
    + The *divergence* of a vector field is the flux per unit area at a point. How can your formula
      be used to find the divergence of $arrow(F)$ at $arrow(p)$?
    + Why is $"div"arrow(F)(arrow(p))$ written as $nabla dot arrow(F)(arrow(p))$ by physicists?
  ]
]

#slide(title: [Siefken 14], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $arrow(F): RR^2 -> RR^2$ be defined by $arrow(F)(x,y) = mat(x^2; -y)$.

    Let $arrow(G): RR^3 -> RR^3$ be defined by $arrow(G)(x,y,z) = mat(-2x+z; -z^3; x+y+z)$.

    + Find the divergence of $arrow(F)$.
    + Find the divergence of $arrow(G)$.
    + The divergence of a vector field is said to give the "outward pressure" or "expansive
      pressure" at a point. Does this description make sense?
    + Draw a vector field that has _positive_ divergence at the origin.
  ]
]

#slide(title: [Siefken 15], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .81em)

  #columns(2)[
    #{
      let width = 9cm
      let height = width
      let plot(f, title: none) = {
        let ts = lq.arange(-1, 1.1, step: 0.1)
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
          lq.place(0, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                rect((0, 0), (3, 3), stroke: blue + 2pt, name: "rod")
                content("rod.center", box(fill: white)[$S_1$], anchor: "center", padding: .2em)
                // content("rod.south-west", [$arrow(p)$], anchor: "north", padding: .2em)
              })
              group(name: "figure2", {
                translate((3, 0))

                rect((0, 0), (3, 3), stroke: blue + 2pt, name: "rod")
                content("rod.center", box(fill: white)[$S_2$], anchor: "center", padding: .2em)
                // content("rod.south-west", [$arrow(p)$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot(
        (x, y) => (3, 1), //, title: [$arrow(F)(x,y)=(3,1)$]
      )
    }
    #colbreak()

    Let $arrow(F): RR^2 -> RR^2$ be a vector field.

    Consider the regions $S_1$, $S_2$, and $S_3 = S_1 union S_2$, all oriented outward.

    + How does the flux through $S_1$ and $S_2$ relate to the flux through $S_3$?
    + The *divergence theorem* states that for a region $R$ and a smooth vector field $arrow(F)$,
      that
      $
        integral_R ? wide = integral_(partial R) ??
      $
      Fill in $?$ and $??$.

      Does the theorem make sense?
  ]
]

#slide(title: [Siefken 16], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    Let $arrow(F): RR^2 -> RR^2$ be a vector field defined by
    $
      arrow(F)(x,y) = (x/(x^2+y^2), y/(x^2+y^2))
    $
    #{
      set align(center)
      let width = 6cm
      let height = width
      let plot(f, title: none) = {
        let ts = lq.arange(-1, 1.1, step: 0.1)
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
        )
      }

      plot(
        (x, y) => (
          x / calc.pow(x * x + y * y + 0.1, 3 / 2),
          y / calc.pow(x * x + y * y + 0.1, 3 / 2),
        ), //, title: [$arrow(F)(x,y)=(3,1)$]
      )
    }
    #colbreak()


    + Find the divergence of $arrow(F)$.
    + Should the flux of $arrow(F)$ through a circle centered at the origin be positive, negative,
      or zero? Why?
    + What does the divergence theorem say about the flux of $arrow(F)$ through a circle centered at
      the origin? Is the divergence theorem wrong?
    + Let $C_1$ and $C_2$ be circles of radius $1$ and $2$ centered at the origin.

      Find the flux of $arrow(F)$ through $C_1$ and $C_2$.
    + Can the divergence theorem be used to explain the result from the previous part? What should
      the flux through a circle of radius $k$ be?
  ]
]
