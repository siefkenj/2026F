#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/lilaq:0.5.0" as lq

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
    title: [MAT235 Slides LEC0401 (Chapter 15)],
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
    #{
      let s = 3cm
      let a = lq.diagram(
        title: [A],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-4, 5, num: 40),
          lq.linspace(-4, 5, num: 40),
          (x, y) => x * x + y * y,
          map: color.map.icefire,
        ),
        xlim: (-4, 4),
        ylim: (-4, 4),
        xaxis: (ticks: lq.arange(-4, 6, step: 2)),
        yaxis: (ticks: lq.arange(-4, 6, step: 2)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      let b = lq.diagram(
        title: [B],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-4, 5, num: 40),
          lq.linspace(-4, 5, num: 40),
          (x, y) => x * x - y * y,
          map: color.map.icefire,
        ),
        xlim: (-4, 4),
        ylim: (-4, 4),
        xaxis: (ticks: lq.arange(-4, 6, step: 2)),
        yaxis: (ticks: lq.arange(-4, 6, step: 2)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      let c = lq.diagram(
        title: [C],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-4, 5, num: 40),
          lq.linspace(-4, 5, num: 40),
          (x, y) => 2 * x * x - calc.cos(4 * y),
          map: color.map.icefire,
        ),
        xlim: (-4, 4),
        ylim: (-4, 4),
        xaxis: (ticks: lq.arange(-4, 6, step: 2)),
        yaxis: (ticks: lq.arange(-4, 6, step: 2)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      let d = lq.diagram(
        title: [D],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-4, 5, num: 40),
          lq.linspace(-4, 5, num: 40),
          (x, y) => 2 * x + y,
          map: color.map.icefire,
        ),
        xlim: (-4, 4),
        ylim: (-4, 4),
        xaxis: (ticks: lq.arange(-4, 6, step: 2)),
        yaxis: (ticks: lq.arange(-4, 6, step: 2)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      show: block.with(breakable: false)
      table(
        columns: 2,
        stroke: none,
        a, b,
        c, d,
      )
    }

    For each contour plot, determine if the contour heights can be labeled so that:
    + There is a *local maximum* at the origin.
    + There is a *unique* local maximum at the origin.
    + There is no local maximum at the origin.
    + There is no *local extreme* at the origin.
  ]
]

#slide(title: [Siefken 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    The second derivative test for multivariable functions relies on the theorem: if a function $f$
    is twice differentiable and $Q$ is a quadratic approximation to $f$ at $arrow(p)$, then

    - If $Q$ has a *unique* max (or min) at $arrow(p)$, then $f$ has a unique *local* max (or min)
      at $arrow(p)$.

    - If $Q$ has a saddle point at $arrow(p)$, then $f$ has a saddle point at $arrow(p)$.

    Below $Q$ is a quadratic approximation to $f$ centered at $arrow(0)$.

    Use https://desmos.com/3d to graph each quadratic approximation to decide if the original
    function has a local max/min/saddle at $arrow(p)=arrow(0)$.

    + $f$ where $Q(x,y) = 2x^2+1/2 y^2$
    + $f$ where $Q(x,y) = 2x^2-1/2 y^2$
    + $f$ where $Q(x,y) = 2x^2 +y +y^2$
    + $f(x,y)=x^4+y^4+3$ where $Q(x,y) = 3$
  ]
]

#slide(title: [Siefken 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $p(x,y) = a x^2 + b y^2 +c x y + d x +e y +f$ be a general quadratic.

    + If $p$ has a critical point at $arrow(0)$, what can you say about $a,b,c,d,e,f$?
    + If you change the value of $f$, will that change whether or not $p$ has a local max/min/saddle
      at $arrow(0)$? Explain.
    + If $a>0$ and $b < 0$, is it possible for $p$ to have a local min/max at $arrow(0)$? What if
      $a <0$ and $b > 0$?
    + Use Desmos to graph a quadratic $a x^2 + b y^2 + c x y$. Keeping $a,b > 0$, can you find
      values of $a,b,c$ such that there
      #set enum(numbering: "(i)")
      + *is* a local minimum?
      + *is* a local maximum?
      + *is no* local minimum or maximum?
  ]
]

#slide(title: [Siefken 4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $p(x,y) = a x^2 + b y^2 +c x y + d x +e y +f$.

    If $p$ has a unique extreme at $arrow(0)$, we know:
    - $a$ and $b$ are the same sign;
    - $d=e=0$;
    - $f$ doesn't matter.

    I.e., we can classify $q(x,y)=a x^2 + b y^2 + c x y$.

    We will start out simple and assume $a=b=1$.

    + Let $arrow(u)=mat(u_1; u_2)$ be a unit vector.
      #set enum(numbering: "(a)")
      + Which of the following are possible:
        #set enum(numbering: "(i)")
        + $q$ has a unique min at $arrow(0)$
        + $q$ has a unique max at $arrow(0)$
        + $q$ has a saddle point at $arrow(0)$
      + Find the second directional derivative of $q$ at $arrow(0)$ in the direction of $arrow(u)$.
      + What condition(s) must be true for $q$ to have a unique min at $arrow(0)$?

    //  Consider the general case where $q(x,y)=a x^2 + b y^2 + c x y$.
    //  Assume $a,b>0$.


  ]
]

#slide(title: [Siefken 5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    We will now consider the general case where $q(x,y)=a x^2 + b y^2 + c x y$.

    Assume $a,b>0$.

    + How does the graph of $z=1/a q(x,y)$ relate to the graph of $z=q(x,y)$? Does the behaviour at
      $arrow(0)$ change depending on what $a$ is?

      _Hint_: Use Desmos to check you're not sure.

    + How does the graph of $z=q(x, m y)$ relate to the graph of $z=q(x,y)$? Does the behaviour at
      $arrow(0)$ change depending on what $m$ is?

    + Consider the *new* polynomial
      $
        r(x,w) = 1/a q(x, sqrt(a)/sqrt(b) w)
      $
      Find a formula for $r(x,w)$.

      How does the behaviour of $r$ at $arrow(0)$ relate to the behaviour of $q$ at $arrow(0)$?

    + Classify the behaviour of $r$ at $arrow(0)$ (based on the previous slide).

    + Classify the behaviour of $q$ at $arrow(0)$.

    + Find formulas to classify the behaviour of $q$ at $arrow(0)$ in terms of $q_(x x)$, $q_(y y)$,
      and $q_(x y)$.
  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    The height of a camp ground is given by
    $
      h(x,y) & =1/10 (-x^2+y(y-6)^2) \
             & = 1/10 (-x^2 +y^3 - 12y^2+36 y)
    $

    + Find all the critical points of $h$.
    + Where are the highest and lowest places on the campground?
    + The boundaries of the camp ground are marked by a circular fence placed of radius of $4$
      centered at $(0,4)$.

      On the boundary, what are there highest and lowest spots?

      _Hint_: Feel free to use Desmos!
  ]
]
#slide(title: [Siefken 6], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    The height of a camp ground is given by
    $h(x,y) & =1/10 (-x^2+y(y-6)^2) = 1/10 (-x^2 +y^3 - 12y^2+36 y)$

    #{
      let s = 6cm
      let a = lq.diagram(
        title: [Camp Ground],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          levels: (-1, 0, 1, 2, 3, 4),
          lq.linspace(-4.5, 4.5, num: 60),
          lq.linspace(-0.5, 8.5, num: 80),
          (x, y) => 1 / 10 * (-x * x + y * (y - 6) * (y - 6)),
          map: color.map.icefire,
        ),
        xlim: (-4.5, 4.5),
        ylim: (-0.5, 8.5),
        xaxis: (ticks: lq.arange(-9, 10, step: 1)),
        yaxis: (ticks: lq.arange(-9, 10, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      set align(center)
      a
    }

    + On the contour plot, label the critical points you found.
    + The lines of the contour plot are at integer levels (e.g., $1$, $2$, $-1$, etc.). Label the
      height of each curve appropriately.

    + Draw gradient vectors for $h$ on the contour plot.
  ]
]

#slide(title: [Siefken 7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #columns(2)[
    The height of a camp ground is given by
    $h(x,y) & =1/10 (-x^2+y(y-6)^2) = 1/10 (-x^2 +y^3 - 12y^2+36 y)$

    #{
      let s = 6cm
      let a = lq.diagram(
        title: [Camp Ground],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          levels: (-1, 0, 1, 2, 3, 4),
          lq.linspace(-4.5, 4.5, num: 60),
          lq.linspace(-0.5, 8.5, num: 80),
          (x, y) => 1 / 10 * (-x * x + y * (y - 6) * (y - 6)),
          map: color.map.icefire,
        ),
        xlim: (-4.5, 4.5),
        ylim: (-0.5, 8.5),
        xaxis: (ticks: lq.arange(-9, 10, step: 1)),
        yaxis: (ticks: lq.arange(-9, 10, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
        lq.ellipse(0, 4, width: 8, height: 8, align: center + horizon, stroke: 2pt + blue),
      )
      set align(center)
      a
    }

    The boundary of the camp ground is given by $x^2 + (y - 4)^2 = 4^2$ and is plotted to the left.

    + Identify all places *on the boundary* where $h$ could have a local extreme.
    + At the places you identified, what is the relationship between the boundary and the level
      curve?
      #set enum(numbering: "(i)")
      + Tangent
      + Orthogonal
      + Something else
    + At the places you identified, is the gradient of $h$
      #set enum(numbering: "(i)")
      + Tangent
      + Orthogonal
      + Something else
  ]
]

#slide(title: [Siefken 7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #columns(2)[
    The height of a camp ground is given by
    $h(x,y) & =1/10 (-x^2+y(y-6)^2) = 1/10 (-x^2 +y^3 - 12y^2+36 y)$

    #{
      let s = 6cm
      let a = lq.diagram(
        title: [Camp Ground],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          levels: (-1, 0, 1, 2, 3, 4),
          lq.linspace(-4.5, 4.5, num: 60),
          lq.linspace(-0.5, 8.5, num: 80),
          (x, y) => 1 / 10 * (-x * x + y * (y - 6) * (y - 6)),
          map: color.map.icefire,
        ),
        xlim: (-4.5, 4.5),
        ylim: (-0.5, 8.5),
        xaxis: (ticks: lq.arange(-9, 10, step: 1)),
        yaxis: (ticks: lq.arange(-9, 10, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
        lq.ellipse(0, 4, width: 8, height: 8, align: center + horizon, stroke: 2pt + blue),
      )
      set align(center)
      a
    }

    The boundary of the camp ground is given by $x^2 + (y - 4)^2 = 4^2$ and is plotted to the left.

    Define $g(x,y)=x^2+(y-4)^2$.

    + The boundary is the graph of *some* level curve for $g$. Which level curve?
    + What is the relationship between $nabla g$ and the boundary?
    + What is the relationship between $nabla h$ and $nabla g$ on the boundary?
    + Solve for all the locations where $nabla g = nabla h$ on the boundary.
  ]
]
