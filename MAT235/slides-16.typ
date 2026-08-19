#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/itemize:0.2.0"
#import "@preview/cetz:0.4.2"

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
    title: [MAT235 Slides LEC0401 (Chapter 16)],
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
  #set text(size: .9em)

  #columns(2)[
    Let $f:RR -> RR$ be a function.

    + Explain in words what "the integral from $a$ to $b$ of $f$" means.
    + Write down the *left-endpoint approximation* to "the integral from $a$ to $b$ of $f$".
    + In the expression $display(integral_a^b f(x) dif x)$, what does the "$dif x$" represent?
    + In multi-variable calculus, we often write "the integral from $a$ to $b$ of $f$" as
      $
        display(integral_R f(x) dif x)
      $
      where $R = space.thin ??$. What could $R$ be in this case?
  ]
]

#slide(title: [Siefken 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        lq.contour(
          lq.linspace(-5, 5, num: 20),
          lq.linspace(-5, 5, num: 20),
          (x, y) => 2 * x + y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        lq.place(3.5, 3.5, $5$),
        lq.place(2.8, 2.8, $4$),
        lq.place(2.2, 2.2, $3$),
        lq.place(1.5, 1.5, $2$),
        lq.place(.9, .9, $1$),
      )
      set align(center)
      a
    }
    // #colbreak()

    We'd like to find *volume*, $V$, under the surface $z=f(x,y)$ on the region
    $R=[0,4] times [0,4]$.

    + What would a "left-endpoint approximation" to $V$ look like? How could you find it?
    + Using $2 times 2$ squares, find an over estimate and under estimate for $V$.
    + How could you use a limit to get an exact value for $V$?
    + In multi-variable calculus,
    $
      V = integral_R f dif A
    $
    Explain why this notation makes sense. What does the $dif A$ represent?
  ]
]

#slide(title: [Siefken 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    #[
      #set text(size: .9em)
      $P(x,y)$ represents the population *density* (people per square kilometer) on the $3 times 2$
      km town of Rectville.
      #image("images/density-1.png", width: 9cm)
    ]

    + Write down a set that defines the *region* that Rectville occupies.
    + At $(0,0)$, $P=1000$. What does that mean?
    + About how many people are in the $1/10 times 1/10$ km region near $(0,0)$?
    + Set up an integral to find the total population of Rectville.
    + Estimate the total population of Rectville.

    #text(size: .8em)[
      The figure for Rectville came from Calculus: Multivariable by Hughes-Hallett et al.
    ]
  ]
]

#slide(title: [Siefken 4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    The town of Elville has a population density given by $P(x,y)$ and a boundary shown below.
    #{
      let a = lq.diagram(
        // title: [$z=f(x,y)$],
        width: 7.5cm,
        height: 6cm,
        // lq.contour(
        //   lq.linspace(-5, 5, num: 20),
        //   lq.linspace(-5, 5, num: 20),
        //   (x, y) => 2 * x + y,
        //   map: color.map.icefire,
        // ),
        xlim: (-0, 5),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(2.8, 2.8, $4$),
        // lq.place(2.2, 2.2, $3$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
        lq.path(
          (1, 0),
          (1, 3),
          (4, 3),
          (4, 1),
          (3, 1),
          (3, 0),
          (1, 0),
          stroke: 2pt + blue,
          fill: blue.lighten(60%).transparentize(50%),
        ),
      )
      set align(center)
      a
    }

    + Describe the region that defines Elville as a set.
    + Write down an integral that would give the total population of Elville.
    + Can you express the total population of Elville in terms of integrals over rectangular
      regions? If so, do it.
  ]
]

#slide(title: [Siefken 5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    The town of Circville has a population density given by $P(x,y)$ and a boundary shown below.
    #{
      let a = lq.diagram(
        // title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        // lq.contour(
        //   lq.linspace(-5, 5, num: 20),
        //   lq.linspace(-5, 5, num: 20),
        //   (x, y) => 2 * x + y,
        //   map: color.map.icefire,
        // ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(2.8, 2.8, $4$),
        // lq.place(2.2, 2.2, $3$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
        lq.ellipse(
          1,
          1,
          width: 2,
          height: 2,
          stroke: 2pt + blue,
          fill: blue.lighten(60%).transparentize(50%),
        ),
      )
      set align(center)
      a
    }
    #colbreak()

    + Describe the region that defines Circville as a set.
    + Write down an integral that would give the total population of Circville.
    + Can you express the total population of Circville in terms of integrals over rectangular
      regions? If so, do it.
  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 4cm,
        lq.contour(
          lq.linspace(-5, 5, num: 20),
          lq.linspace(-5, 5, num: 20),
          (x, y) => 2 * x,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 3),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        lq.place(2.8, .9, $6$),
        lq.place(1.8, .9, $4$),
        lq.place(.8, .9, $2$),
      )
      set align(center)
      a
    }

    $z=f(x,y)$ defines a plane.

    #colbreak()

    + Find an equation for $f(x,y)$.
    + Use geometry to find the exact value of
      $
        V = display(integral_([0,4] times [0,3])f dif A)
      $
    + Let $c$ be a constant. What does
      $
        W = display(integral_([0,4]) f(x,c)) dif x
      $
      mean geometrically? Find its exact value.
    + How can $W$ be used to find $V$?
  ]
]
#slide(title: [Siefken 7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #columns(2)[
    Recall
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)=2x$],
        width: 6cm,
        height: 4cm,
        lq.contour(
          lq.linspace(-5, 5, num: 20),
          lq.linspace(-5, 5, num: 20),
          (x, y) => 2 * x,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 3),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        lq.place(2.8, .9, $6$),
        lq.place(1.8, .9, $4$),
        lq.place(.8, .9, $2$),
      )
      set align(center)
      a
    }


    #colbreak()
    + Compute
      $
        integral_([0,3]) (integral_([0,4]) f(x,c) dif x) dif c
      $
    + Compute
      $
        integral_([0,4]) (integral_([0,3]) f(x,c) dif c) dif x
      $
    + Integrals like the above are called *iterated integrals*. How do the iterated integrals relate
      to $display(integral_([0,4] times [0,3]) f dif A)$?

      Do iterated integrals remind you of partial derivatives? If so, how?
  ]
]

#slide(title: [Siefken 8], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)=2x+y$],
        width: 6cm,
        height: 4cm,
        lq.contour(
          lq.linspace(-5, 5, num: 20),
          lq.linspace(-5, 5, num: 20),
          (x, y) => 2 * x + y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 3),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
      )
      set align(center)
      a
    }

    Let $R=[0,4] times [0,3]$. Let
    $
      V = integral_R f dif A
    $

    + Set up _two different_ iterated integrals to compute $V$.
    + Evaluate both iterated integrals to find $V$.
    + It is sometimes said that "$dif x dif y = dif A$". Does this statement make sense?
    + Is it true that
      $
        integral_([0,4]) integral_([0,3]) f(x,y) #text(fill: red, $dif y dif x$) = integral_([0,4]) integral_([0,3]) f(x,y) #text(fill: red, $dif x dif y$) ?
      $
    + Why would someone write
      $
        display(integral_(x in [0,4]) integral_(y in [0,3]) f(x,y) dif y dif x) " or "
        display(integral_(x=0)^(x=4) integral_(y=0)^(y=3) f(x,y) dif y dif x)
      $
      instead of
      $
        display(integral_([0,4]) integral_([0,3]) f(x,y) dif y dif x) wide "or" wide
        display(integral_0^4 integral_0^3 f(x,y) dif y dif x)?
      $
  ]
]

#slide(title: [Siefken 9], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #columns(2)[
    The town of Veeville has a population density given by $P(x,y)$ and a boundary shown below.
    #{
      let a = lq.diagram(
        // title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        lq.path(
          (2, 0),
          (1, 3),
          (3, 3),
          (2, 0),
          stroke: 2pt + blue,
          fill: blue.lighten(60%).transparentize(50%),
        ),
      )
      set align(center)
      a
    }
    #colbreak()

    Let $D$ be the region defining Veeville and let $Q$ be its total population.

    + Find a formulas for $L(y)$ and $R(y)$ that give the $x$ coordinates of the *leftmost* and
      *rightmost* points in $D$ with $y$-coordinate equal to $y$. (E.g., $L(3)=1$ and $R(3)=3$)

      What is the domain of $L$ and $R$?

    + Fill in the ? in the population integral:
      $
        Q= integral_(?=?)^(?=?) integral_(?=L(y))^(?=R(y)) P(x,y) dif ? dif ?
      $

    + Find an iterated integral to compute $Q$ in terms of $dif y dif x$.

    // _Hint:_ You may need to split the integral into two parts.
  ]
]

#slide(title: [Siefken 10], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    The town of Wackville has a population density given by $P(x,y)$ and a boundary enclosed on the
    north by $y=-x^2+4$ and on the south by $y=-x$.

    Let $D$ be the region defining Wackville and let $Q$ be its total population.

    + Sketch $D$.

    + Set up an iterated integral to compute $Q$ in terms of $dif x dif y$.
    + Set up an iterated integral to compute $Q$ in terms of $dif y dif x$.
    + The population density is given by the function $P(x,y) = (x+y)/10+20$.

      Use the integral of your choice to compute the exact population of Wackville.
  ]
]

#slide(title: [Siefken 11], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  // #columns(2)[
  The density of a $2 times 4 times 8$ wooden plank is given by $rho(x, y, z)$.

  + Find a set $R$ so that $M=display(integral_(R) rho dif V)$ gives the total mass of the plank.
  + Express $M$ using iterated integrals.
  + A physicist says, "I will use '$dif V = dif y dif z dif x$' to represent a tiny volume." Set up
    an iterated integral (with the correct bounds) to use the physicist's idea to find $M$.
  // ]
]

#slide(title: [Siefken 12], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)


  #show: columns
  #cetz.canvas(length: 3cm, {
    import cetz.draw: *

    set-style(
      mark: (fill: black, scale: 2),
      stroke: (thickness: 0.4pt, cap: "round"),
      angle: (
        radius: 0.3,
        label-radius: .22,
        fill: green.lighten(80%),
        stroke: (paint: green.darken(50%)),
      ),
      content: (padding: 1pt),
    )

    grid(
      (-1.5, -1.5),
      (1.4, 1.4),
      step: 0.5,
      stroke: gray + 0.2pt,
    )

    circle((0, 0), radius: 1, stroke: (dash: "dashed"))

    line((-1.5, 0), (1.5, 0), mark: (end: "stealth"))
    // content((), $ x $, anchor: "west")
    line((0, -1.5), (0, 1.5), mark: (end: "stealth"))
    // content((), $ y $, anchor: "south")

    for (x, ct) in ((-1, $ -1 $), (1, $ 1 $)) {
      line((x, 3pt), (x, -3pt))
      content((), anchor: "north", ct)
    }

    for (y, ct) in ((-1, $ -1 $), (-0.5, $ -1/2 $), (0.5, $ 1/2 $), (1, $ 1 $)) {
      line((3pt, y), (-3pt, y))
      // content((), anchor: "east", ct)
    }

    // Draw the green angle
    // cetz.angle.angle((0, 0), (1, 0), (1, calc.tan(30deg)), label: text(green, [#sym.alpha]))

    // line((0, 0), (1, calc.tan(30deg)))

    set-style(stroke: (thickness: 1.2pt))

    circle((.71, .71), radius: 2pt, fill: black)
    content((), anchor: "south-west", $space arrow(p)$)

    circle((-1, 1), radius: 2pt, fill: black)
    content((), anchor: "south-west", $space arrow(q)$)

    circle((0, -1.5), radius: 2pt, fill: black)
    content((), anchor: "south-west", $space arrow(r)$)
  })


  *Polar coordinates* describe points in terms of $(r, theta)$, where $r$ is the distance from the
  origin and $theta$ is the angle, measured counter-clockwise from the positive $x$-axis.

  + Describe the points $arrow(p)$, $arrow(q)$, and $arrow(r)$ in polar coordinates.
  + Describe the points $arrow(p)$, $arrow(q)$, and $arrow(r)$ in rectangular coordinates.
  + Draw the graph of $r(theta)=2theta$ in polar coordinates.
  + Draw the graph of $r(theta)=3$ in polar coordinates. How can you draw the same graph in
    rectangular coordinates?

]
#slide(title: [Siefken 13], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  Let $f=1$ be a constant function,
  $
    R={arrow(p) in RR^2 : arrow(p)=(x,y) " with " x^2+y^2 <= 9}
  $
  be a region and $display(I = integral_R f dif A=integral_R dif A)$.

  + Describe $R$ using polar coordinates.
  + Use geometry to find the exact value of $I$.
  + Set up an iterated integral to compute $I$ using _rectangular_ coordinates.
  // + Set up an iterated integral to compute $I$ using _polar_ coordinates.
  + Does $display(integral_(theta=0)^(theta=2 pi) integral_(r=0)^(r=3) dif r dif theta)$ give the
    correct value of $I$? What went wrong?

  + In rectangular coordinates "$dif A = dif x dif y$". In polar coordnates, should
    "$dif A = dif r dif theta$"? Why or why not?

]

#slide(title: [Siefken 14], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns

  #cetz.canvas(length: 3cm, {
    import cetz.draw: *

    set-style(
      mark: (fill: black, scale: 2),
      stroke: (thickness: 0.4pt, cap: "round"),
      angle: (
        radius: 0.3,
        label-radius: .22,
        fill: green.lighten(80%),
        stroke: (paint: green.darken(50%)),
      ),
      content: (padding: 1pt),
    )


    circle((0, 0), radius: 1, stroke: (dash: "dashed"))
    circle((0, 0), radius: .5, stroke: (dash: "dashed"))
    circle((0, 0), radius: 1.5, stroke: (dash: "dashed"))

    line((-1.5, 0), (1.5, 0), mark: (end: "stealth"))
    // content((), $ x $, anchor: "west")
    line((0, -1.5), (0, 1.5), mark: (end: "stealth"))
    // content((), $ y $, anchor: "south")

    for (x, ct) in ((-1, $ -1 $), (1, $ 1 $)) {
      line((x, 3pt), (x, -3pt))
      // content((), anchor: "north", ct)
    }

    for (y, ct) in ((-1, $ -1 $), (-0.5, $ -1/2 $), (0.5, $ 1/2 $), (1, $ 1 $)) {
      // line((3pt, y), (-3pt, y))
      // content((), anchor: "east", ct)
    }

    // Draw the green angle
    // cetz.angle.angle((0, 0), (1, 0), (1, calc.tan(30deg)), label: text(green, [#sym.alpha]))

    // line((0, 0), (1, calc.tan(30deg)))

    set-style(stroke: (thickness: 1.2pt))

    let newArc = (c: (0, 0), radius: 1, start: 0deg, stop: 90deg, ..rest) => {
      let (cx, cy) = c
      arc-through(
        (cx + radius * calc.cos(start), cy + radius * calc.sin(start)),
        (cx + radius * calc.cos((start + stop) / 2), cy + radius * calc.sin((start + stop) / 2)),
        (cx + radius * calc.cos(stop), cy + radius * calc.sin(stop)),
        ..rest,
      )
    }
    let ray = (c: (0, 0), radius-start: .5, radius-end: 1, angle: 0deg, ..rest) => {
      let (cx, cy) = c
      line(
        (cx + radius-end * calc.cos(angle), cy + radius-end * calc.sin(angle)),
        (cx + radius-start * calc.cos(angle), cy + radius-start * calc.sin(angle)),
        ..rest,
      )
    }

    newArc(start: 30deg, stop: 60deg, radius: 1.)
    newArc(start: 30deg, stop: 60deg, radius: .5)
    ray(angle: 30deg, radius-start: .5, radius-end: 1.)
    ray(angle: 60deg, radius-start: .5, radius-end: 1.)
    content((), anchor: "south-west", $space space R$)
    ray(angle: 30deg, radius-start: 0, radius-end: 1.7, stroke: (
      dash: "dashed",
      paint: gray,
      thickness: 0.8pt,
    ))
    ray(angle: 60deg, radius-start: 0, radius-end: 1.7, stroke: (
      dash: "dashed",
      paint: gray,
      thickness: 0.8pt,
    ))
  })


  The region $R$ is a _polar sector_ based on the following boundary curves:
  - $theta = theta_0$ and $theta = theta_0 + Delta theta$
  - $r = r_0$ and $r = r_0 + Delta r$

  + What is the area of the annulus ("donut") between the curves $r=r_0$ and $r=r_0 + Delta r$?
  + What portion of the annulus that you just calculated does $R$ take up?
  + Find the area of $R$.
  + In polar coordinates, it is said "$dif A = r dif r dif theta$". Why?
]

#slide(title: [Siefken 15], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  We'd like to find the volume of the surface below the cone $z=sqrt(x^2+y^2)$ and above the region
  $R$, in the plane, bounded by the graph of $r(theta)=sin(theta)$.

  + Let $f$ be be a function whose inputs are _rectangular_ coordinates so that $z=f(x,y)$ describes
    the cone. Find a formula for $f$.
  + Let $g$ be be a function whose inputs are _polar_ coordinates so that $z=g(r, theta)$ describes
    the cone. Find a formula for $g$.
  + Use desmos to graph the region $R$. Describe $R$ using polar coordinates.
  + Set up an integral to find the volume in question.
  + What goes wrong if we use $theta=0$ to $theta=2pi$ in our integral?

]

#slide(title: [Siefken 16], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  #image("images/cylindrical-coords.png")

  *Cylindrical coordinates* describe points in $RR^3$ using polar coordinates for the $x y$-plane
  and a $z$ coordinate.

  + What geometric objects are represented by the equation $r=1$? What about $theta = pi/4$? What
    about $z=2$?
  + Describe, using cylindrical coordinates, a cylinder with height 3 and radius 4.
  + Describe, using cylindrical coordinates, an infinite (right) cone whose point is in the positive
    $z$-direction.

]

#slide(title: [Siefken 17], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)


  #show: columns
  #image("images/conical-pool.jpg")

  A conical pool bounded in cylindrical coordinates by the equations $z=2r$ and $z=6$ is filled with
  water and debris of density $rho(r, theta, z)$.

  + Fill in the missing parts of the following integral so that it computes the total mass of the
    pool and its contents.
    $
      M = integral_(?=?)^(?=?) integral_(?=?)^(?=?) integral_(?=?)^(?=?) rho(r, theta, z) space ??
    $

    + $rho$, given in *rectangular* coordinates is $rho(x, y, z)=24 + x^2 + y^2 - 3z$. Find $M$, the
      total mass of the pool.

]

#slide(title: [Siefken 18], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)


  #show: columns
  #image("images/spherical-coordinates.svg")

  *Spherical coordinates* describe points using:
  - a distance from the origin $rho$
  - an angle descending from the positive $z$-axis $phi$
  - an angle in the $x y$-plane, measured counter-clockwise from the positive $x$-axis $theta$

  + Write the following _spherical coordinates_ in both _rectangular coordinates_ and _cylindrical
    coordinates_: $(rho, theta, phi) = (2, 0, 0)$ #h(1em) $(rho, theta, phi) = (2, 0, pi/4)$ #h(
      1em,
    )\
    $(rho, theta, phi) = (2, pi, 0)$ #h(1em) $(rho, theta, phi) = (2, pi, pi/4)$ #h(1em)\
    $(rho, theta, phi) = (2, pi/2, pi/3)$ #h(1em)

  + Describe a situation where you would prefer (a) spherical coordinates, (b) cylindrical
    coordinates, and (c) rectangular coordinates.

]

#slide(title: [Siefken 19], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)


  #show: columns
  #image("images/spherical-dv.png")

  The diagram shows a sector, $S$, in spherical coordinates formed by changing $rho,phi, theta$ by
  $Delta rho, Delta phi, Delta theta$.

  + Are the sides of $S$ straight or curved? A mix?
  + What angles do you find at the corners of $S$?
  + If you pretend that $S$ is a rectangular box, what is its volume?
  + How does the exact volume of $S$ compare to your approximation? Does your answer depend on the
    values of $rho, phi, theta$? What about $Delta rho, Delta phi, Delta theta$?
  + What "$dif V$" should you use in spherical coordinates?
  // Spherical and rectangular coordinates are related by
  // $
  //   x &= rho sin(phi) cos(theta)\
  //   y &= rho sin(phi) sin(theta)\
  //   z &= rho cos(phi)
  // $

  // We'd like to find out what $d V$ is in spherical coordinates.
  // + What is the length of the vector pointing from $(rho, phi, theta)$ to $(rho + Delta rho, phi, theta)$?
  // + What is the length of the vector pointing from $(rho, phi, theta)$ to $(rho, phi + Delta phi, theta)$?
  // + What is the length of the vector pointing from $(rho, phi, theta)$ to $(rho, phi, theta + Delta theta)$?


]

#slide(title: [Siefken 20], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)


  #show: columns
  #image("images/glass-dome2.jpg")

  A glass dome of constant density is protecting astronauts on the moon. Its inner radius is 6m and
  it is .5m thick.

  + Set up an integral in spherical coordinates to find the total mass of the dome.
  + Will the integral
    $
      integral_(y=-6)^(y=6) integral_(x=-sqrt(6^2-y^2))^(x=sqrt(6^2-y^2)) integral_(z=sqrt(6^2-x^2-y^2))^(z=sqrt(6.5^2-x^2-y^2)) 1dif z dif x dif y
    $
    compute the correct mass? Why or why not?
  + On a test, what method would you use to solve this question?
  // Spherical and rectangular coordinates are related by
  // $
  //   x &= rho sin(phi) cos(theta)\
  //   y &= rho sin(phi) sin(theta)\
  //   z &= rho cos(phi)
  // $

  // We'd like to find out what $d V$ is in spherical coordinates.
  // + What is the length of the vector pointing from $(rho, phi, theta)$ to $(rho + Delta rho, phi, theta)$?
  // + What is the length of the vector pointing from $(rho, phi, theta)$ to $(rho, phi + Delta phi, theta)$?
  // + What is the length of the vector pointing from $(rho, phi, theta)$ to $(rho, phi, theta + Delta theta)$?


]

#slide(title: [Siefken 21], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .7em)


  #show: columns
  #image("images/skew-coordinates.png")

  In a particular Amazon warehouse, locations are referenced with tape on the floor. The tape is
  laid out in the directions $arrow(b)_1=mat(4; 1)$ and $arrow(b)_1=mat(1; 3)$.

  At the warehouse, the position of items uses $b$-coordinates. That is if an item is at
  $b$-coordinates $(u,v)$, then its physical location is at $u arrow(b)_1 + v arrow(b)_2$.

  The average weight of packages at location $(u,v)$ (in $b$-coordinates) is given by
  $
    W(u,v)=2 + sin(u)+v
  $

  + The warehouse is a parallelogram with sides $20 arrow(b)_1$ and $30 arrow(b)_2$. Let $R$ be the
    region defining the warehouse. What does $Q= display(integral_R W dif A)$ represent?
  + Is $Q = display(integral integral 2+sin(x)+y dif x dif y)$ for appropriate bounds?
  + What is $dif A$ in $b$-coordinates? Use your answer to set up an integral to find $Q$.
]

#slide(title: [Siefken 22], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)


  #show: columns
  The _Jacobian_ can be used to find $dif A$ for arbitrary coordinate systems.

  If $u,v$ coordinates are related to $x,y$ coordinates by
  $
    x = x(u,v)\
    y = y(u,v)
  $
  then
  $
    dif A = det
    mat(
      (partial x)/(partial u), (partial x)/(partial v);
      (partial y)/(partial u), (partial y)/(partial v)
    ).
  $
  This determinant is called the *Jacobian* for the coordinate system.
  #colbreak()
  + In polar coordinates, $x=r cos theta$ and $y = r sin theta$. Use the Jacobian to find $dif A$ in
    polar coordinates.
]
