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
    title: [MAT235 Slides LEC0401 (Chapter 17)],
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

  #show: columns

  + For each of the following situations, determine if it can be modeled by a function. If so, what
    is the *domain* and *codomain*?
    - The elevation of a camp ground.
    - The position of a bee.
    - The direction the wind is blowing.
    - Tax revenue that Canada collects.
  + Of the functions you identified, which types have we studied so far in MAT235? Which did you
    study in Calc I?
]

#slide(title: [Siefken 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns

  Let $arrow(p)=mat(1; 1)$ and $arrow(d)=mat(2; 0)$. Define
  $
    arrow(f)(t) = t arrow(d)+arrow(p)
  $

  + What is the domain and codomain of $arrow(f)$?
  + What is $arrow(f)(3)$?
  + What does the graph of $arrow(f)$ look like?
  + How long does it take (if you think of $t$ as seconds) for $arrow(f)$ to traverse from $(1,1)$
    to $(5,1)$?
  + Make a new function $arrow(g)$ whose graph is the same as $arrow(f)$ but traverses at 1 unit per
    second.
]

#slide(title: [Siefken 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns

  A bee leaves a flower located at $(3,0,0)$ and flies off in a cork-screw pattern.

  #image("images/helix.png", width: 6cm)

  #colbreak()
  Its motion is described by $arrow(p)(t)$.

  + Find a formula for $arrow(p)(t)$.
  + Every time the bee makes a complete circle, it gains $5$m of height. Modify your formula for
    $arrow(p)(t)$ to incorporate this information.
  + Suppose the flower started at position $(0,0,0)$, but the radius and height gain per circle
    remained the same. Find a formula for $arrow(p)(t)$.
]


#slide(title: [Siefken 4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  Below is a _Lemniscate_ curve.
  #{
    let ts = lq.arange(0, 6.5, step: 0.05)
    let a = lq.diagram(
      width: 12cm,
      height: 5cm,
      lq.plot(ts.map(t => calc.cos(t)), ts.map(t => calc.sin(2 * t)), mark: none, stroke: 2pt),
    )
    a
  }

  #colbreak()
  + Could the lemniscate be the graph of a function $f:RR -> RR$? Explain.
  + Could the lemniscate be the graph of a function $f:RR -> RR^2$? Explain.
  + Make a table of values for a function that produces the lemniscate.
  + Find a formula for a function whose graph is the lemniscate. Use Desmos to check your answer.
]

#slide(title: [Siefken 5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  A fish is swimming in a pond. Its position as a function of time is given by
  $arrow(f)(t) = (t^2, 2t)$.

  + Graph $arrow(f)$.
  + Estimate how far has the fish travelled from time $t=1$ to $t=1+Delta t$. Is your estimate
    exact?
  + Estimate the average speed of the fish from time $t=1$ to $t=1+Delta t$.
  + Can you find the exact speed of the fish at time $t=1$? If so, do it.
    #colbreak()
  + What's the difference between speed and velocity?
  + Find the velocity of the fish at time $t=1$.
  + What's the relationship between the velocity of the fish and the graph of $arrow(f)$? Should you
    draw the velocity vector at the origin or somewhere else?
]

#slide(title: [Siefken 6], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #show: columns
  $arrow(p): RR -> RR^2$ describes the motion of a particle.

  + How should you interpret $dif/(dif t) arrow(p)(t)$?#v(1em)
  + How should you interpret $dif^2/(dif t^2) arrow(p)(t)$?

    You are on a playground toy that spins very fast.
    #set align(center)
    #image("images/merry-go-round.jpg", width: 5cm)

  + Make a diagram of this situation. Draw your *velocity* vector on the diagram.
  + Draw your *acceleration* vector on the diagram.
  + Come up with a mathematical model (i.e. a function) that describes your position vs. time on the
    ride.

    Using your model, compute your velocity and acceleration vectors. Do they match your
    predictions?

]

#slide(title: [Siefken 7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  You are riding the _Lemniscate Coaster_, a roller coaster whose track is laid out in the shape of
  a lemniscate. A car on the coaster can be modeled by $arrow(p)(t)=(20cos t, 20sin 2t)$.

  + Find expressions for the velocity, speed, and the acceleration of the roller coaster.
  + Use Desmos to estimate: what is the fastest that the coaster goes? What is the most acceleration
    it experiences?
    #colbreak()
    To make the ride safe for children, the maximum acceleration should not exceed
    $3g approx 29 "m"/"s"^2$. To achieve this, engineers will install breaking pads that slow the
    coaster down by a factor of $k$.

  + Model the slowed-down coaster's position with a new function $arrow(q)(t)$.
  + What should $k$ be to ensure the maximum acceleration is $3g$? (Hint: Use Desmos to estimate!)
]

#slide(title: [Siefken 8], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  You are riding the _Lemniscate Coaster_ modeled by $arrow(p)(t)=(20cos t, 20sin 2t)$. You'd like
  to find the total length of the coaster track.

  #{
    let ts = lq.arange(0, 6.5, step: 0.05)
    let ts2 = lq.arange(0, 6.5, step: 0.2)
    let a = lq.diagram(
      width: 12cm,
      height: 5cm,
      lq.plot(ts2.map(t => calc.cos(t)), ts2.map(t => calc.sin(2 * t)), mark: "o", stroke: none),
      lq.plot(ts.map(t => calc.cos(t)), ts.map(t => calc.sin(2 * t)), mark: none, stroke: 2pt),
    )
    a
  }

  Your strategy is to divide your journey into $n$ steps of length $Delta t$, find the displacement
  between consecutive steps, and add up all the distances.

  + Write down an express for the displacement between time $t$ and time $t+Delta t$.
  + Write down an expression that estimates the distance travelled from time $t$ to $t+ Delta t$.
  + Write down an expression that approximates the total length of the track.
  + How could you find the exact length of the track? Do it.
]

#slide(title: [Siefken 9], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  Let $W$ give the velocity of the wind at different locations on the earth's surface.

  + What type of mathematical object does $W$ output? Input?
  + $W$ is a function from $RR^?$ to $RR^(??)$. Fill in the question marks.
  + How might you "graph" $W$?
  + Suppose there is a constant, gentle breeze coming from the North. Draw $W$.
    #colbreak()
  + Suppose there is a tornado located at the origin. Draw $W$.

    Will the arrows in your tornado drawing be longer or shorter, closer to the origin?
]

#slide(title: [Siefken 10], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #{
    let width = 4cm
    let height = width
    let plot(f, title: none) = {
      lq.diagram(
        title: title,
        width: width,
        height: height,
        lq.quiver(
          lq.arange(-2, 3, step: .75),
          lq.arange(-2, 3, step: .75),
          f,
        ),
        xaxis: none,
        yaxis: none,
      )
    }

    plot((x, y) => (x, y), title: [A])
    h(1fr)
    plot((x, y) => (y, x), title: [B])
    h(1fr)
    plot((x, y) => (-y, x), title: [C])
    h(1fr)
    plot((x, y) => (x, -y), title: [D])
    h(1fr)
    plot((x, y) => (x * x, 1), title: [E])
    h(1fr)
    plot((x, y) => (x * x, -1), title: [F])
  }

  // #show: columns

  Match each vector field below with a picture above.
  $
    arrow(f)_1 mat(x; y) = mat(x^2; -1) quad
    arrow(f)_2 mat(x; y) = mat(y; x) quad
    arrow(f)_3 mat(x; y) = mat(x; -y) quad\
    arrow(f)_4 mat(x; y) = mat(x^2; 1) quad
    arrow(f)_5 mat(x; y) = mat(-y; x) quad
    arrow(f)_6 mat(x; y) = mat(x; y) quad
  $
]

#slide(title: [Siefken 11], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns

  The gradient of a function $f:RR^n -> RR$ is also a vector field.

  + Draw $nabla f$ where $f(x,y)=x^2+y^2$
  + Draw $nabla g$ where $g(x,y)=x + y$
  + Draw $nabla h$ (where it's defined) where $h(x,y)= abs(x) + y$
    #colbreak()
  + Could the following vector field be the gradient of a function? Why or why not?

    #{
      set align(center)
      let width = 4cm
      let height = width
      let plot(f, title: none) = {
        lq.diagram(
          title: title,
          width: width,
          height: height,
          lq.quiver(
            lq.arange(-2, 3, step: .75),
            lq.arange(-2, 3, step: .75),
            f,
          ),
          xaxis: none,
          yaxis: none,
        )
      }

      plot((x, y) => (-y, x))
    }
]
