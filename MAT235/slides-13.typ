#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/lilaq:0.4.0" as lq
#import "@preview/cetz:0.4.2"

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
    title: [MAT235 Slides LEC0401],
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

#slide(title: [Siefken 1])[
  Vectors represent *displacement*.

  You are on the prairies, where it is very flat. The vector $arrow(v)$ represents a displacement
  East by 2km. The vector $arrow(c)$ represents a displacement due North-East by 3km.

  + Draw a diagram for the following situation: You walk by following $arrow(v)$ twice and then
    $arrow(c)$ once.
  + Write an algebraic expression that describes "You walk by following $arrow(v)$ twice and then
    $arrow(c)$ once."
  + If you start at East-North coordinates of $(0,0)$, what are the coordinates of your final
    position?
  + What is your *distance* from $(0,0)$ after you walk?
]

#slide(title: [Siefken 2], autoscale: false)[
  #set text(size: .8em)
  The *standard basis vectors* (in MAT235) are called
  $
    arrow(i) wide arrow(j) wide arrow(k)
  $
  They are vectors of length 1 pointing in the directions of the (positive) $x$, $y$, and $z$-axes.

  + Describe the displacement between the points $(1,2,3)$ and $(-2, 4,3)$ using the standard basis
    vectors.
  + The vector $a arrow(i) + b arrow(j) + c arrow(k)$ is written in *column vector* form as
    $mat(a; b; c)$ or $mat(delim: "[", a; b; c)$. Express your answer to the previous question as a
    column vector.
  + Let $arrow(d) = arrow(i) + 3 arrow(j) - 3 arrow(k)$. Suppose you start at $(0,0,0)$ and displace
    by $arrow(d)$. What are your coordinates?
]

#slide(title: [Siefken 3], autoscale: false)[
  The context for this question is $RR^2$.
  + Consider the point $(a,b)$ and the vector $mat(a; b)$. What's the difference between the two?
    How can you convert from one to the other?
  + Find a vector pointing in the direction of the line $y=1/2x$ in $RR^2$.
  + Find a *unit* vector (i.e., a vector of length 1) in the direction of the line $y=1/2x$ in
    $RR^2$.
]

#slide(title: [Siefken 4], autoscale: false)[
  #set text(size: .79em)
  The context for this question is $RR^2$.

  You are moving counter-clockwise around a circle X, which has a radius of 2 and is centered at the
  origin. You make one revolution around the circle X every 360 seconds, and you start at the
  right-most point.

  + What is your location after 90 seconds?
  + What is your displacement from your starting point after 90 seconds? Give your answer as a
    column vector.
  + You are now traveling around circle Y. Circle Y has a radius of 2 and is centered at (4,1). You
    make one trip around circle Y every 360 seconds, and you start at the right-most point of circle
    Y.

    What is your location after 90 seconds?
  + What is your displacement from your starting point after 90 seconds? Give your answer as a
    column vector.
]

// XXX: Needs to be reworked. Unclear whether looking for vector in R^2 or R^3.
#slide(title: [Siefken 8 (Ch 12)])[
  Recall the plane $cal(P)$ given by the formula $z=2x-y$.
  + Sketch the contour map of $cal(P)$.
  + Starting from $(0,0,0)$, in what direction does $cal(P)$ have *a slope of zero*? Give your
    answer as a vector.
  + Starting from $(0,0,0)$, in what direction does $cal(P)$ have the *steepest* slope? Give your
    answer as a vector.
  + The vector $arrow(c)$ has the following property: if you start at $(0,0,0)$ and displace by
    $arrow(c)$ you are guaranteed to be on the plane $cal(P)$.

    Give _three_ different examples of possible vectors $arrow(c)$.
]


#slide(title: [Siefken 5], autoscale: false)[
  #set text(size: .7em)
  If $arrow(a)=mat(a_1; a_2; dots.v; a_n)$ and $arrow(b)=mat(b_1; b_2; dots.v; b_n)$ then:
  - The *length* or *magnitude* of $arrow(a)$ is written as $||arrow(a)||$ and given by
    $||arrow(a)||=sqrt(a_1^2+a_2^2+...+a_n^2)$
  - The *dot product* of $arrow(a)$ and $arrow(b)$ is written as $arrow(a) dot arrow(b)$ and given
    by
    - (Algebraic Definition) $arrow(a) dot arrow(b)=a_1b_1+a_2b_2+...+a_n b_n$
    - (Geometric Definition) $arrow(a) dot arrow(b)=||arrow(a)|| ||arrow(b)|| cos(theta)$ where
      $theta$ is the smaller of the angles between $arrow(a)$ and $arrow(b)$.

  #set text(size: .98em)
  Let $arrow(a)=mat(1; 1)$ and $arrow(b)=mat(3; 1)$
  #columns(2)[

    + Draw a picture of $arrow(a)$ and $arrow(b)$.
    + Compute $arrow(a) dot arrow(b)$.
    + Find $||arrow(a)||$ and $||arrow(b)||$.
    + Use your knowledge of the dot product to find the angle between $arrow(a)$ and $arrow(b)$.
  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #set text(size: .98em)
  Let $arrow(a)=mat(1; 1)$ and $arrow(b)=mat(3; 1)$

  Draw a picture of $arrow(a)$ and $arrow(b)$. On your picture, include
  #columns(2)[
    + a vector $arrow(c)$ so that $arrow(c) dot arrow(a)$ is negative.
    + a vector $arrow(d)$ so that $arrow(d) dot arrow(a)=0$ and $arrow(d) dot arrow(b)<0$.
    + a vector $arrow(e)$ so that $arrow(e) dot arrow(a)=0$ and $arrow(e) dot arrow(b)>0$.
    + Can you find a vector $arrow(f)$ so that $arrow(f) dot arrow(a)=0$ and
      $arrow(f) dot arrow(b)=0$? Explain why or why not.
  ]
]

#slide(title: [Siefken 7], autoscale: false)[
  #set text(size: .81em)
  Two vectors $arrow(a)$ and $arrow(b)$ are *orthogonal* if $arrow(a) dot arrow(b)=0$.

  #columns(2)[
    + If $arrow(a)$ and $arrow(b)$ are orthogonal, what is the angle between them?

      Let $arrow(n)=mat(1; 3)$

    + Draw $arrow(n)$ and *all* vectors orthogonal to $arrow(n)$ in the same plot. What is the
      resulting geometric figure?
    + Let $arrow(x)=mat(x; y)$. Express the following relationship as an equation: "$arrow(x)$ is
      orthogonal to $arrow(n)$."

    + Suppose $arrow(w) = arrow(i) + arrow(j) + arrow(k) in RR^3$. What does the set of all vectors
      orthogonal to $arrow(w)$ look like?

    + A *normal vector* to a line or plane is a vector orthogonal to all direction vectors for that
      line or plane.

      Find a normal vector for the line $y=-3x$.
  ]
]
#slide(title: [Siefken 7], autoscale: false)[
  #set text(size: .85em)

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
    #colbreak()
    To the left is a contour plot of the plane $cal(P)$.

    + Is $2 arrow(i)$ a normal vector for $cal(P)$? Why or why not?
    + Find two *direction vectors* for $cal(P)$. That is, find vectors that point from one place in
      $cal(P)$ to another place in $cal(P)$.
    + Find a normal vector for $cal(P)$.
  ]
]

#slide(title: [Siefken 8], autoscale: false)[
  #set text(size: .85em)

  Let $arrow(n)=mat(1; 2; 3)$ and let $arrow(p)=mat(1; 1; 1)$. Our goal is to find the plane
  $cal(Q)$ that has normal vector $arrow(n)$ and passes through the point $arrow(p)$.

  #columns(2)[
    + Let $arrow(d)=mat(5; -1; -1)$.

      Is $arrow(d)$ a direction vector for $cal(Q)$? Why or why not?

      Is $arrow(d) in cal(Q)$? Why or why not?

    + Find two points $arrow(q)_1$ and $arrow(q)_2$ that are in $cal(Q)$.

    + Suppose $arrow(r) in cal(Q)$. What is $arrow(n) dot (arrow(r) - arrow(p))$?

    + Find a formula for $cal(Q)$.
  ]
]

#slide(title: [Siefken 9], autoscale: false)[
  #set text(size: .85em)

  The *right hand rule* gives an *orientation* to vectors in $RR^3$.


  #columns(2)[
    #block(
      breakable: false,
      stack(
        [
          #set text(size: .75em)
          The order $a$, $b$, $a times b$ follows the right hand rule in the picture below.
        ],
        image("cross_produc.svg", width: 6cm),
      ),
    )

    #colbreak()

    #show: block.with(breakable: false)

    Which axis labelling follows the right hand rule?

    #let d1(x, y, z, L) = {
      cetz.canvas({
        import cetz.draw: *

        content((0, 1.6, 0), anchor: "south", text(size: 14pt, [(#L)]))

        line((0, 0), (x: 1), mark: (end: ">"), name: "x")
        line((0, 0), (y: 1), mark: (end: ">"), name: "y")
        line((0, 0), (z: 1), mark: (end: ">"), name: "z")
        content("x.end", anchor: "west", text(x))
        content("y.end", anchor: "south", text(y))
        content("z.end", anchor: "east", text(z))
      })
    }
    #let d2(x, y, z, L) = {
      cetz.canvas({
        import cetz.draw: *

        content((.5, 1.6, 0), anchor: "south", text(size: 14pt, [(#L)]))

        line((0, 0), (x: 1), mark: (end: ">"), name: "x")
        line((0, 0), (y: 1), mark: (end: ">"), name: "y")
        line((0, 0), (z: -1), mark: (end: ">"), name: "z")
        content("x.end", anchor: "west", text(x))
        content("y.end", anchor: "south", text(y))
        content("z.end", anchor: "south-west", text(z))
      })
    }

    #block(breakable: false, table(
      columns: 3,
      d1($x$, $y$, $z$, "A"), d1($y$, $z$, $x$, "B"), d1($x$, $z$, $y$, "C"),
      d2($x$, $y$, $z$, "D"), d2($y$, $z$, $x$, "E"), d2($x$, $z$, $y$, "F"),
    ))

  ]
]

#slide(title: [Siefken 10], autoscale: false)[
  #set text(size: .85em)

  The *cross product* obeys the following rules:
  - $arrow(a) times arrow(b) = - arrow(b) times arrow(a)$
  - $arrow(i) times arrow(j) = arrow(k) wide arrow(j) times arrow(k) = arrow(i) wide arrow(k) times arrow(i) = arrow(j)$
  - It distributes over addition and scalar multiplication. (I.e.,
    $arrow(a) times (t arrow(b) + arrow(c)) = t (arrow(a) times arrow(b)) + arrow(a) times arrow(c)$)

  + Let $arrow(a) = 2 arrow(i) + arrow(j)$ and let $arrow(b) = 3 arrow(k)$. Compute
    $arrow(a) times arrow(b)$.
  + Compute $mat(2; 1; 0) times mat(0; 0; 3)$.
  + Compute $arrow(i) times arrow(i)$ and $(arrow(i) + arrow(j)) times (arrow(i) + arrow(j))$.
]

#slide(title: [Siefken 11], autoscale: false)[
  #set text(size: .85em)

  The cross product has the following properties:
  - $arrow(a) times arrow(b)$ is orthogonal to both $arrow(a)$ and $arrow(b)$.
  - $||arrow(a) times arrow(b)|| = ||arrow(a)|| ||arrow(b)|| sin(theta)$ where $theta$ is the
    smaller of the angles between $arrow(a)$ and $arrow(b)$.
  - $||arrow(a) times arrow(b)||$ gives the area of the parallelogram with sides $arrow(a)$ and
    $arrow(b)$.

  #columns(2)[
    Let $arrow(a) = mat(1; 2; 0)$ and $arrow(b) = mat(0; 1; 1)$.
    + Find a vector orthogonal to both $arrow(a)$ and $arrow(b)$.
    + Find the equation of a plane containing both $arrow(a)$ and $arrow(b)$.
    + $||arrow(a)||=sqrt(5)$, $||arrow(b)||=sqrt(2)$, and $arrow(a) dot arrow(b) = 2$. Using only
      this information, find $||arrow(a) times arrow(b)||$.
  ]
]

#slide(title: [Siefken 12], autoscale: false)[
  // #set text(size: .85em)

  #columns(2)[
  You are fixing up an old tree-house. Unfortunately, the floor of the tree-house is missing, but it has two intact walls!

  The walls, $W_1$ and $W_2$ have equations:
  $
    2x+y=0 quad "and" quad x - 2y - z =1
  $
  You'd like to construct a floor for the tree-house that is orthogonal to both walls and passes through the point $(1,1,1)$.

    + Find a normal vector the floor.
    + Find an equation for the floor.
    + Is the floor level with the ground? Explain.
  ]

]