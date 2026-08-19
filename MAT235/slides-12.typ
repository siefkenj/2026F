#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/lilaq:0.4.0" as lq

#let slide(..args) = {
  let title = args.named().at("title", default: none)
  let positional = args.pos()
  slide-orig(..args.named(), title: text(size: 18pt, title), ..positional.map(p => {
    show: utils.fit-to-height.with(100%, grow: false)
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
  Multi-variable functions are functions from multiple inputs to multiple outputs.

  When there is one input and one output we can visualize a function by graphing inputs on the
  $x$-axis and outputs on the $y$-axis.

  + What are some ways we might visualize a function with two inputs and one output?

    Come up with several ideas.
]


#slide(title: [Siefken 2.1])[
  #let F(x, y) = calc.round(20 + (-(x - 1) * (x - 1) - y * y) / 5)

  The following table describes the elevation of various locations in a campground (in meters) at
  various distances (in km) East and North of the campground entrance.

  #{
    set align(center)
    table(
      columns: 5,
      [N \\ E], [1], [2], [3], [4],
      [1], [#F(1, 1)], [#F(1, 2)], [#F(1, 3)], [#F(1, 4)],
      [2], [#F(2, 1)], [#F(2, 2)], [#F(2, 3)], [#F(2, 4)],
      [3], [#F(3, 1)], [#F(3, 2)], [#F(3, 3)], [#F(3, 4)],
      [4], [#F(4, 1)], [#F(4, 2)], [#F(4, 3)], [#(F(4, 4) - 1)],
    )
  }

  + Make a sketch of elevation vs. position if you started hiking at $(1,1)$ and headed directly
    East.
  + Make a sketch of elevation vs. position if you started hiking at $(1,1)$ and headed directly
    North.
  + If you walked around the entire campground, where would you encounter the steepest slope?
    Justify your answer.

]

// Did on 9-5-2025
#slide(title: [Siefken 2.3])[
  #let F(x, y) = calc.round(20 + (-(x - 1) * (x - 1) - y * y) / 5)

  Recall the campground elevation.

  #{
    set align(center)
    table(
      columns: 5,
      [N \\ E], [1], [2], [3], [4],
      [1], [#F(1, 1)], [#F(1, 2)], [#F(1, 3)], [#F(1, 4)],
      [2], [#F(2, 1)], [#F(2, 2)], [#F(2, 3)], [#F(2, 4)],
      [3], [#F(3, 1)], [#F(3, 2)], [#F(3, 3)], [#F(3, 4)],
      [4], [#F(4, 1)], [#F(4, 2)], [#F(4, 3)], [#(F(4, 4) - 1)],
    )
  }

  + Make a sketch of elevation vs. position if you started hiking at $(1,1)$ and headed directly
    East. Repeat for $(1,2)$, $(1,3)$, and $(1,4)$.
  + Make a sketch of elevation vs. position if you started hiking at $(1,1)$ and headed directly
    North. Repeat for $(2,1)$, $(3,1)$, and $(4,1)$.
  + Let $h(x,y)$ be the elevation at position $(x "East",y "North")$ in the campground.

    Combine your slices from the previous part to sketch a _perspective drawing_ of the graph of
    $z=h(x,y)$.
]


#slide(title: [Siefken 2.2])[
  #let F(x, y) = calc.round(20 + (-(x - 1) * (x - 1) - y * y) / 5)

  Recall the campground elevation.

  #{
    set align(center)
    table(
      columns: 5,
      [N \\ E], [1], [2], [3], [4],
      [1], [#F(1, 1)], [#F(1, 2)], [#F(1, 3)], [#F(1, 4)],
      [2], [#F(2, 1)], [#F(2, 2)], [#F(2, 3)], [#F(2, 4)],
      [3], [#F(3, 1)], [#F(3, 2)], [#F(3, 3)], [#F(3, 4)],
      [4], [#F(4, 1)], [#F(4, 2)], [#F(4, 3)], [#(F(4, 4) - 1)],
    )
  }

  + Starting at (3,3) and walking East, at what _slope_ will you be walking?
  + Starting at (3,3) and walking North, at what _slope_ will you be walking?
  + Starting at (3,3) and walking directly North-East, at what _slope_ will you be walking?
  + You start at (3,3) and walk to (4,4). What is your total distance _in 3d space_ from your
    starting point?
]

// Did on 9-8-2025
#slide(title: [Siefken 3])[
  Consider $f(x,y) = x^2 + y^2$.

  + Is $f$ a function? If so, how many inputs and outputs does it have?
  + Let $h(y) = f(0,y)$. Is $h$ a function? If so, how many inputs and outputs does it have?
  + Graph $z=f(0,y)$, $z=f(1,y)$, and $z=f(2,y)$. Make sure to label your axes.
  + Graph $z=f(x,0)$, $z=f(x,1)$, and $z=f(x,2)$.
  + Make a perspective drawing of the graph of $z=f(x,y)$.
]

#slide(title: [Siefken 4])[
  #let F(x, y) = calc.round(20 + (-(x - 1) * (x - 1) - y * y) / 5)

  The following table describes the elevation of various locations in a campground (in meters) at
  various distances (in km) East and North of the campground entrance.

  #{
    set align(center)
    table(
      columns: 5,
      [N \\ E], [1], [2], [3], [4],
      [1], [#F(1, 1)], [#F(1, 2)], [#F(1, 3)], [#F(1, 4)],
      [2], [#F(2, 1)], [#F(2, 2)], [#F(2, 3)], [#F(2, 4)],
      [3], [#F(3, 1)], [#F(3, 2)], [#F(3, 3)], [#F(3, 4)],
      [4], [#F(4, 1)], [#F(4, 2)], [#F(4, 3)], [#(F(4, 4) - 1)],
    )
  }

  A _topographic map_ (also called a _contour map_ or _contour plot_) shows geographic features by
  including lines of constant elevation.

  + Sketch a topographic map (contour map) of the campground.

]



#slide(title: [Siefken 5])[
  #{
    let a = lq.diagram(
      title: [Map A],
      width: 4cm,
      height: 4cm,
      lq.contour(
        lq.linspace(-5, 5, num: 20),
        lq.linspace(-5, 5, num: 20),
        (x, y) => x * y,
        map: color.map.icefire,
      ),
    )
    let b = lq.diagram(
      title: [Map B],
      width: 4cm,
      height: 4cm,
      lq.contour(
        lq.linspace(-5, 5, num: 20),
        lq.linspace(-5, 5, num: 20),
        (x, y) => x - y,
        map: color.map.icefire,
      ),
    )
    let c = lq.diagram(
      title: [Map C],
      width: 4cm,
      height: 4cm,
      lq.contour(
        lq.linspace(-5, 5, num: 20),
        lq.linspace(-5, 5, num: 20),
        (x, y) => (x) * (x - 5),
        map: color.map.icefire,
      ),
    )
    set align(center)
    grid(
      columns: 3,
      gutter: 2em,
      a, b, c,
    )
  }

  + Which of the contour maps above could represent a plane? (i.e., a flat surface)

    Which ones could definitely _not_ represent a plane? Explain.

  + For Map B, estimate the slope at $(0,0)$ moving (i) directly up, (ii) directly right, (iii)
    along $y=x$ headed to the upper-right, and (iv) along $y=-x$ headed to the upper-left.
]

#slide(title: [Siefken 6])[
  Draw a contour plot for a cone where:
  + The tip is pointing straight up.
  + The tip is pointing straight down.
  + The tip is pointing directly along the $x$-axis.
  + The tip is pointing in the direction of the line $y=x$ (in the $x y$-plane).
]

// Week 3
#slide(title: [Siefken 7])[
  #grid(
    columns: 2,
    gutter: 2em,

    {
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 10cm,
        height: 10cm,
        lq.contour(
          lq.linspace(-5, 5, num: 300),
          lq.linspace(-5, 5, num: 300),
          (x, y) => calc.pow(calc.abs(x * y), 1 / 2) / 100,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        lq.place(3.6, 3.6, $1$),
        lq.place(3.1, 3.1, $2$),
        lq.place(2.6, 2.6, $3$),
        lq.place(2.1, 2.1, $4$),
        lq.place(1.6, 1.6, $5$),
        lq.place(1.1, 1.1, $6$),
        lq.place(.6, .6, $7$),
      )
      set align(center)
      grid(
        columns: 3,
        gutter: 2em,
        a,
      )
    },
    [


      + Sketch the graphs of $z=f(x,1)$, $z=f(x,2)$, $z=f(x,3)$, and $z=f(x,4)$.
      + Where is the graph of $z=f(x,y)$ the "steepest"? In what direction is it steepest?
      + Where is the graph of $z=f(x,y)$ the "flattest"? In what direction is it flattest?
      + You have a very long and very straight ruler that you would like to place on the surface of
        $z=f(x,y)$. Is there anywhere you could set your ruler down on the surface? Explain.
    ],
  )


]


#slide(title: [Siefken 8])[
  Consider the plane $cal(P)$ given by the formula $z=2x-y$.
  + Is the point $(3,3,3)$ on $cal(P)$? What about the point $(3,2,1)$? How can you tell?
  + Sketch the contour map of $cal(P)$.
  + Starting from $(0,0,0)$, in what direction does $cal(P)$ have *a slope of zero*?
  + Starting from $(0,0,0)$, in what direction does $cal(P)$ have the *steepest* slope?
  + Find the equation of a plane parallel to $cal(P)$ that passes through the point $(3,2,1)$.
]


#slide(title: [Siefken 9])[
  Let $A=(2,0,0)$, $B=(0,3,0)$, and $C=(0,0,5)$. Let $cal(Q)$ be the plane that passes through $A$,
  $B$, and $C$.
  + Find an equation for the *slice* of $cal(Q)$ obtained when $y=0$.
  + Find an equation for the *slice* of $cal(Q)$ obtained when $x=0$.
  + Find an equation for $cal(Q)$.
  + Find a function $f$ so that $cal(Q)$ is the graph of $z=f(x,y)$.
]


#slide(title: [Siefken 10])[
  Suppose the earth is centered at $(0,0,0)$. The temperature of inside the earth at position
  $(x,y,z)$ (in units of thousands of km) is approximately given by
  $
    T(x,y,z) = -2(sqrt(x^2 + y^2 + z^2) - 3)^(1/3)+2
  $
  in units of thousands of degrees Celsius.

  + Is $T$ a function? How many inputs and outputs does it have?
  + What do "regions of constant temperature" look like according to $T$? Can you make a "contour
    map" for temperature?
  + The radius of Earth is approximately 6.3 thousand km. According to $T$, where is Earth hottest?
    Where is it coldest?
  + Use https://www.desmos.com/3d to plot regions of constant temperature. Based on your plots, when
    does the temperature change the fastest? The slowest?
]


#slide(title: [Siefken 11])[
  We say a graph is *extruded* when it is continued in the same way along a particular axis.

  + Sketch the graph of $z=x^2$ in $RR^2$.
  + Sketch a perspective drawing of the graph of $z=x^2$ *extruded* along the $y$-axis in $RR^3$.
  + Make a contour map of the graph of $z=x^2$ *extruded* along the $y$-axis in $RR^3$.
]

#slide(title: [Siefken 12])[
  + Draw three different graphs of discontinuous functions *in $RR^2$*.
  + For each of your graphs, sketch a contour map of the graph extruded along the $y$-axis in
    $RR^3$.
  + What's one way you can tell if a function in $RR^3$ is discontinuous when looking at its contour
    map?
]

#slide(title: [Siefken 13])[
  #{
    let a = lq.diagram(
      title: [Map A],
      width: 4cm,
      height: 4cm,
      lq.contour(
        lq.linspace(-5, 5, num: 50),
        lq.linspace(-5, 5, num: 50),
        (x, y) => x * x / (x * x + y * y),
        map: color.map.icefire,
      ),
    )
    set align(center)
    grid(
      columns: 3,
      gutter: 2em,
      a,
    )
  }

  + Is there any way to label the contours on Map A so that they correspond to a *continuous*
    function? Explain.

  + Map A came from graphing
    $f(x,y)= cases(display(x^2/(x^2 + y^2)&" if " (x,y)!=(0,0)), display(1 &" otherwise"))$. Is $f$
    a continuous function? Explain.
]

#slide(title: [Hughes-Hallet 12.6 \#26])[
  Let
  $
    f(x,y) = cases(
      (x y(x^2-y^2))/(x^2+y^2) & " if " (x,y)!=(0,0),
      c & " otherwise"
    )
  $

  + If possible, find a value of $c$ so that $f$ is continuous. Prove your answer.
]
