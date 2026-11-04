#import "preamble.typ": *
#show: mat235-slides.with([Chapters 19 and 20])

/// The plot objects for an inch worm floating on water, to spread into a `lq.diagram`. Its body
/// loops up off the water between its tail feet at `start` and its front feet at `end`, with ripples
/// where it touches the water.
#let inchworm(start, end) = {
  // Shape coordinates `(u, v)` run along the worm (`u`) and up the loop (`v`).
  let (dx, dy) = (end.at(0) - start.at(0), end.at(1) - start.at(1))
  let at((u, v)) = (start.at(0) + u * dx - v * dy, start.at(1) + u * dy + v * dx)
  let loop = range(41).map(i => {
    let t = calc.pi * i / 40
    (0.5 * (1 - calc.cos(t)) - 0.14 * calc.sin(2 * t), 0.75 * calc.sin(t))
  })
  let spine = (((-0.22, 0),) + loop + ((1.12, 0),)).map(at)
  let head = at((1.22, 0.02))
  let eye = at((1.26, 0.07))
  let green = rgb("#6fae3a")
  let water = rgb("#2f7fc1")

  (
    lq.path(..spine, stroke: stroke(
      paint: green.darken(45%),
      thickness: 7.5pt,
      cap: "round",
      join: "round",
    )),
    lq.path(..spine, stroke: stroke(paint: green, thickness: 6pt, cap: "round", join: "round")),
    lq.path(..spine, stroke: stroke(
      paint: green.darken(20%),
      thickness: 6pt,
      join: "round",
      dash: (0.7pt, 2.8pt),
    )),
    lq.scatter(
      (head.at(0),),
      (head.at(1),),
      size: 15pt,
      color: green.darken(10%),
      stroke: 0.7pt + green.darken(45%),
    ),
    lq.scatter((eye.at(0),), (eye.at(1),), size: 4pt, color: black, stroke: none),
    // Ripples where the worm touches the water.
    lq.scatter(
      (start.at(0), end.at(0)),
      (start.at(1), end.at(1)),
      size: 34pt,
      color: water.transparentize(88%),
      stroke: 0.5pt + water.transparentize(50%),
    ),
    lq.scatter(
      (start.at(0), end.at(0)),
      (start.at(1), end.at(1)),
      size: 20pt,
      color: water.transparentize(100%),
      stroke: 0.9pt + water,
    ),
  )
}

#slide(siefken_num: 1, title: [§19.3, §20.1], two_columns: false)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1.5em,
    {
      let width = 5.5cm
      let height = width

      let p = (0.1, -0.85)
      let q = (1.4, -0.55)

      lq.diagram(
        title: $arrow(F):RR^2 -> RR^2$,
        width: width,
        height: height,
        lq.quiver(
          lq.arange(-2, 3, step: .5),
          lq.arange(-2, 3, step: .5),
          (x, y) => (-y, calc.sin(y + 1) + x / 5),
        ),
        xaxis: none,
        yaxis: none,
        ..inchworm(p, q),
        lq.place(p.at(0) - 0.3, p.at(1) - 0.5, box(
          fill: white.transparentize(20%),
          inset: 1pt,
          $arrow(p)$,
        )),
        lq.place(q.at(0) + 0.3, q.at(1) - 0.5, box(
          fill: white.transparentize(20%),
          inset: 1pt,
          $arrow(q)$,
        )),
      )
    },
    [
      An inch worm is floating in a pond and being pushed around by the water. The inch worm's body
      arches out of the water, so it touches the water at only two points (near the head and tail).

      Let $arrow(F): RR^2 -> RR^2$ be the force the water exerts at a given position.

      + What are the possible motions and deformations of the inch worm?

      Let $arrow(p)$ and $arrow(q)$ indicate where the inch worm's tail and head touch the water.
      2. How could you tell if the inch worm will get *pushed* in a particular direction? (Express
        your answer in terms of $arrow(F)$, $arrow(p)$, and $arrow(q)$.)
      + How can you tell if the inch worm will get *stretched*?
      + How can you tell if the inch worm will get *rotated*?
    ],
  )
]

#slide(siefken_num: auto, title: [§19.3], two_columns: false)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1.5em,
    {
      let width = 5.5cm
      let height = width

      let p = (-0.5, -0.5)
      let q = (1, -0.5)

      lq.diagram(
        title: $arrow(F):RR^2 -> RR^2$,
        width: width,
        height: height,
        lq.quiver(
          lq.arange(-2, 3, step: .5),
          lq.arange(-2, 3, step: .5),
          (x, y) => (-y, calc.sin(y + 1) + x / 5),
        ),
        xaxis: none,
        yaxis: none,
        ..inchworm(p, q),
        lq.place(p.at(0) - 0.3, p.at(1) - 0.5, box(
          fill: white.transparentize(20%),
          inset: 1pt,
          $arrow(p)$,
        )),
        // lq.place(q.at(0) + 0.3, q.at(1) - 0.5, box(
        //   fill: white.transparentize(20%),
        //   inset: 1pt,
        //   $arrow(p) + Delta arrow(i)$,
        // )),
      )
    },
    [
      Imagine the inch worm is aligned horizontally and currently has length $Delta$.

      Let $arrow(F)(x,y)=mat(f(x,y); g(x,y))$ represent the force applied to the floating inch worm.
      // The inch worm has turned so that it is lying horizontally: its tail touches the water at
      // $arrow(p)$ and its head touches the water at $arrow(q)$, directly to the right.

      + If the tail of the inch worm is at $arrow(p)$, where is the head of the inch worm located?
      + What is the stretching force on the inch worm?
      + What is the stretching force *per unit of length* of the inch worm? (We call this the
        *normalized* stretching force.)
      + Find a formula for the stretching force per unit of length (i.e., normalized stretching
        force) of a *vertically aligned* inch worm.
      + What happens if you take a limit as $Delta -> 0$? Do any familiar derivatives appear?
    ],
  )
]

#slide(siefken_num: auto, title: [§19.3])[

  Given a vector field $arrow(F)$, the *divergence* of $arrow(F)$ at the point is the infinitesimal
  stretching force at that point and is written $"div"(arrow(F))$ or $nabla dot arrow(F)$.

  $"div"(arrow(F))$ can be computed by adding together the stretching forces in the $x$ and $y$
  directions.

  + Suppose $arrow(F)(x,y)=mat(f(x,y); g(x,y))$. Find a formula for $"div"(arrow(F))(x,y)$, and
    explain where the parts of your formula come from.
  + Physicists think of "$nabla = mat(partial/(partial x); partial/(partial y))$". Explain why
    $nabla dot arrow(F)$ makes sense as notation for $"div"(arrow(F))$.

]

#slide(siefken_num: auto, title: [§19.3], two_columns: false)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1.5em,
    {
      let width = 5.5cm
      let height = width

      // Each feature is a simple field, centered at `(a, b)` and faded out by a bump that is flat at
      // its center, so the divergence at each center is that of the simple field.
      let feature(a, b, f) = (x, y) => {
        let (u, v) = (x - a, y - b)
        let bump = calc.exp(-(u * u + v * v) / 0.8)
        f(u, v).map(c => c * bump)
      }
      let features = (
        feature(-2, 2, (u, v) => (2 * u, 2 * v)), // source
        feature(2, 2, (u, v) => (-2 * u, -2 * v)), // sink
        feature(-2, -2, (u, v) => (2 * u, -2 * v)), // stretch in x, compress in y
        feature(2, -2, (u, v) => (-2 * v, 2 * u)), // rotation
        feature(0, 0, (u, v) => (1.1, 0)), // flowing to the right
      )
      let F = (x, y) => features.map(f => f(x, y)).fold((0, 0), ((s, t), (u, v)) => (s + u, t + v))
      // Arrows are drawn in the direction of F with length 0.5 + |F|^0.5, so that every arrow is
      // visible while stronger flow still gets a longer arrow.
      let F-shown = (x, y) => {
        let (u, v) = F(x, y)
        let len = calc.sqrt(u * u + v * v)
        if len < 1e-6 { (0, 0) } else { (u, v).map(c => c * (0.5 + calc.pow(len, 0.5)) / len) }
      }

      lq.diagram(
        title: $arrow(F):RR^2 -> RR^2$,
        width: width,
        height: height,
        xlim: (-3.4, 3.4),
        ylim: (-3.4, 3.4),
        xaxis: (ticks: range(-3, 4), subticks: none),
        yaxis: (ticks: range(-3, 4), subticks: none),
        lq.quiver(
          lq.arange(-3, 3.5, step: .5),
          lq.arange(-3, 3.5, step: .5),
          F-shown,
          scale: 0.3,
        ),
      )
    },
    [
      The vector field $arrow(F)$ is pictured to the left.

      + List coordinates of locations where $"div"(arrow(F))$ is positive/negative.
      + List coordinates of locations where $"div"(arrow(F))$ is zero.
      + Your friend (who is in a different section of MAT235) learned about divergence today. They
        excitedly tell you #text(fill: blue)["if $arrow(F)$ represents the surface of a pond and the
          divergence of $arrow(F)$ is zero, then a drop of oil placed on the pond won't change
          shape!"]

        Do you agree with your friend? Is there a different version of the statement you would agree
        with?
    ],
  )
]

// #slide(siefken_num: auto, two_columns: false)[

//   #{
//     let width = 2.5cm
//     let height = width
//     let plot(f, title: none) = {
//       lq.diagram(
//         title: title,
//         width: width,
//         height: height,
//         lq.quiver(
//           lq.arange(-2, 3, step: .75),
//           lq.arange(-2, 3, step: .75),
//           f,
//         ),
//         xaxis: none,
//         yaxis: none,
//       )
//     }

//     grid(
//       columns: (1fr,) * 6,
//       plot((x, y) => (x, y), title: [A]),
//       plot((x, y) => (y, x), title: [B]),
//       plot((x, y) => (-y, x), title: [C]),
//       plot((x, y) => (x, -y), title: [D]),
//       plot((x, y) => (x * x, 1), title: [E]),
//       plot((x, y) => (-x, -y), title: [F]),
//     )
//   }

//   + For each vector field above, is the divergence at the origin positive, negative, or zero?
//     Explain using inch worms.
//   + Which of the vector fields have divergence that is positive at some points and negative at
//     others?
//   + The vector fields above are
//     $
//       A = mat(x; y) quad
//       B = mat(y; x) quad
//       C = mat(-y; x) quad
//       D = mat(x; -y) quad
//       E = mat(x^2; 1) quad
//       F = mat(-x; -y)
//     $
//     Compute the divergence of each and check your answers.
// ]

#slide(siefken_num: auto, title: [§20.1], two_columns: false)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1.5em,
    {
      let width = 5.5cm
      let height = width

      let p = (-0.5, -0.5)
      let q = (1, -0.5)

      lq.diagram(
        title: $arrow(F):RR^2 -> RR^2$,
        width: width,
        height: height,
        lq.quiver(
          lq.arange(-2, 3, step: .5),
          lq.arange(-2, 3, step: .5),
          (x, y) => (-y, calc.sin(y + 1) + x / 5),
        ),
        xaxis: none,
        yaxis: none,
        ..inchworm(p, q),
        lq.place(p.at(0) - 0.3, p.at(1) - 0.5, box(
          fill: white.transparentize(20%),
          inset: 1pt,
          $arrow(p)$,
        )),
      )
    },
    [
      Imagine an inch worm is aligned horizontally and currently has length $Delta$.

      Let $arrow(F)(x,y)=mat(f(x,y); g(x,y))$ represent the force applied to the floating inch worm.

      + If you wanted to rotate the inch worm *counter-clockwise* without moving or stretching it,
        which way would you push on its tail? Its head?
      + Write down an expression for the total *counter-clockwise* rotational force applied to the
        inch worm by $arrow(F)$.
      + What is the rotational force *per unit length* applied to the inch worm? I.e., what is the
        *normalized* rotational force?
      + Find a formula for the counter-clockwise rotational force per unit length of a *vertically
        aligned* inch worm.
      + What happens if you take a limit as $Delta -> 0$? Do any familiar derivatives appear?
    ],
  )
]

#slide(siefken_num: auto, title: [§20.1])[
  Given a vector field $arrow(F): RR^2 -> RR^2$, the *curl* of $arrow(F)$ at a point is the
  infinitesimal counter-clockwise rotational force at that point. It is written $"curl"(arrow(F))$
  or $nabla times arrow(F)$.

  $"curl"(arrow(F))$ can be computed by adding together the rotational forces that push on a tiny
  horizontally-oriented inch worm and a tiny vertically-oriented inch worm.

  + Suppose $arrow(F)(x,y)=mat(f(x,y); g(x,y))$. Find a formula for $"curl"(arrow(F))(x,y)$, and
    explain where the parts of your formula come from.
  + Physicists think of "$nabla = mat(partial/(partial x); partial/(partial y))$", and in $RR^2$
    they think of "$times$" as a determinant. So
    $
      nabla times arrow(F) = det mat(partial/(partial x), f(x,y); partial/(partial y), g(x,y)).
    $
    Explain why $nabla times arrow(F)$ makes sense as notation for $"curl"(arrow(F))$.
]

#slide(siefken_num: auto, title: [§20.1])[

  Suppose $arrow(F):RR^3 -> RR^3$ given by
  $arrow(F)(arrow(p)) = mat(f(arrow(p)); g(arrow(p)); h(arrow(p)))$.

  In $RR^3$ *curl* is represented by a vector pointing along an _axis of rotation_ and whose sign is
  given by the _right-hand rule_.

  // Let $arrow(p)$ be a point. Let $arrow(v)$ be the axis around which the circulation density of
  // $arrow(F)$ is *greatest*.

  + Compute the normalized rotational force at the point $arrow(p)$ that $arrow(F)$ exerts on the
    $x y$-plane.

    What is the axis of this rotation? How would you represent it as a vector?

  + Find the normalized rotational force at the point $arrow(p)$ that $arrow(F)$ exerts on the
    $y z$-plane. Represent your answer as a vector.
  + Do the same for the $x z$-plane.

  // + Draw a vector field where the curl points along the $z$-axis.
  // + Assuming that the curl of $arrow(F)$ points directly along the $z$-axis, write a formula for the
  //   curl of $arrow(F)$ at $arrow(p)$.

  //   *Theorem 1*: Any vector field $arrow(F):RR^3 -> RR^3$ can be decomposed into
  //   $arrow(F) = arrow(F)^x + arrow(F)^y + arrow(F)^z$, where $arrow(F)^x$ has curl only around the
  //   $x$-axis, $arrow(F)^y$ has curl only around the $y$-axis, etc..

  //   *Theorem 2*: Curl is additive. I.e., the curl of $arrow(F) + arrow(G)$ equals the curl of
  //   $arrow(F)$ plus the curl of $arrow(G)$.

  // + Find formulas for the curl of $arrow(F)^x$, $arrow(F)^y$, and $arrow(F)^z$ at $arrow(p)$.
  + In $RR^3$ the curl of $arrow(F)$ at the point $arrow(p)$ is the total (normalized) rotational
    force at $arrow(p)$. Find formulas for the curl of $arrow(F)$ at $arrow(p)$.
  + Why is curl of $arrow(F)$ written as $nabla times arrow(F)$ by physicists?
]


// #slide(siefken_num: auto, two_columns: false)[
//   #grid(
//     columns: (auto, 1fr),
//     column-gutter: 1.5em,
//     {
//       let width = 5.5cm
//       let height = width

//       lq.diagram(
//         title: $arrow(F):RR^2 -> RR^2$,
//         width: width,
//         height: height,
//         lq.quiver(
//           lq.arange(-2, 3, step: .5),
//           lq.arange(-2, 3, step: .5),
//           (x, y) => (-y, calc.sin(y + 1) + x / 5),
//         ),
//         xaxis: none,
//         yaxis: none,
//       )
//     },
//     [
//       The pond that the inch worm has been floating in has surface velocity
//       $
//         arrow(F)(x,y) = mat(-y; sin(y+1) + x/5).
//       $

//       + Find $"div"(arrow(F))$ and $"curl"(arrow(F))$.
//       + Where in the pond will a tiny inch worm get stretched? Compressed? Does it matter which way
//         the inch worm is facing?
//       + A tiny horizontal inch worm and a tiny vertical inch worm are placed at the same point. Will
//         they rotate at the same rate? What does $"curl"(arrow(F))$ tell you?
//     ],
//   )
// ]
// #slide(siefken_num: 19.1, two_columns: false)[
//   #grid(
//     columns: (auto, 1fr),
//     column-gutter: 1.5em,
//     {
//       let width = 5.5cm
//       let height = width

//       // A slightly lumpy oil spot centered at `c`.
//       let c = (0.75, -0.5)
//       let spot = range(60).map(i => {
//         let t = 2 * calc.pi * i / 60
//         let r = 0.6 * (1 + 0.12 * calc.sin(3 * t) + 0.07 * calc.cos(5 * t))
//         (c.at(0) + r * calc.cos(t), c.at(1) + r * calc.sin(t))
//       })
//       let sheen = gradient.radial(
//         rgb("#2b2440d0"),
//         rgb("#3d5a8ac0"),
//         rgb("#4f9a8ab0"),
//         rgb("#c9b84fa0"),
//         rgb("#b0559090"),
//       )

//       lq.diagram(
//         title: $arrow(F):RR^2 -> RR^2$,
//         width: width,
//         height: height,
//         lq.quiver(
//           lq.arange(-2, 3, step: .5),
//           lq.arange(-2, 3, step: .5),
//           (x, y) => (-y, calc.sin(y + 1) + x / 5),
//         ),
//         xaxis: none,
//         yaxis: none,
//         lq.path(..spot, closed: true, fill: sheen, stroke: 0.6pt + rgb("#2b2440")),
//       )
//     },
//     [
//       A drop of oil lands on the same pond and spreads into a thin spot. Unlike the inch worm,
//       _every_ point of the oil spot moves with the water.

//       + What are the possible motions and deformations of the oil spot? Which of these could the
//         inch worm _not_ do?
//       + Could the area of the oil spot grow or shrink? What would $arrow(F)$ need to look like for
//         that to happen?
//       + Sketch what the oil spot in the picture will look like a few seconds from now.
//     ],
//   )
// ]
