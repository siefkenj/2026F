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
    title: [MAT235 Slides LEC0401 (Chapter 18)],
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
    Recall that work is $"force" dot "displacement"$.

    Let $arrow(F)(x,y)=(-2,0)$ denote the force of the wind.

    Let $A=(0,0)$, $B=(3,0)$, and $C=(3,3)$.

    + Draw $arrow(F)$.
    + To move from $A$ to $B$, how much work do you do? Does the wind do?
    + To move from $B$ to $A$, how much work do you do? Does the wind do?
    + To move from $B$ to $C$, how much work do you do? Does the wind do?
    + How much work do you do and how much work does the wind do to move from $A$ to $B$ to $C$?
      Does this differ from moving directly from $A$ to $C$ in a straight line?

  ]
]

#slide(title: [Siefken 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $arrow(F)(x,y)=cases((-2,0) & "if" y < 2, (-4,0) & "if" y >= 2)$ denote the force of an
    uneven wind.

    Let $A=(0,0)$, $B=(3,0)$, and $C=(3,3)$.

    + Draw $arrow(F)$.
    + To move from $A$ to $B$, how much work do you do? Does the wind do?
    + To move from $B$ to $A$, how much work do you do? Does the wind do?
    + To move from $B$ to $C$, how much work do you do? Does the wind do?
    + How much work do you do and how much work does the wind do to move from $A$ to $B$ to $C$?
      Does this differ from moving directly from $A$ to $C$ in a straight line?

  ]
]

#slide(title: [Siefken 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $arrow(F)(x,y)=(y, 0)$ denote the force of an uneven wind.

    Let $A=(0,0)$ and $B=(3,3)$.

    + Draw $arrow(F)$.

      You are moving from $A$ to $B$ in a straight line. Let $W$ denote the work that the _wind_
      does while you move.
    + Does $arrow(F)(0,0) dot B$ overestimate or underestimate $W$? What about
      $arrow(F)(3,3) dot B$?
    + Is $arrow(F)(0,0) dot 1/2 B + arrow(F)(1.5,1.5) dot 1/2 B$ more or less accurate than the
      previous estimates?
    + Write down a limit that will give the exact value of $W$.
    + Can you express $W$ as an integral?
    + Does the speed at which you move from $A$ to $B$ affect the value of $W$?
  ]
]

#slide(title: [Siefken 4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)

  #columns(2)[
    Let $arrow(F)(x,y)=(y, 0)$ denote the force of an uneven wind.

    Let $A=(0,0)$ and $B=(3,3)$.

    + Write down a function $arrow(r): RR -> RR^2$ that traces out a straight-line path from $A$ to
      $B$ with $arrow(r)(0)=A$ and $arrow(r)(1)=B$.

    + How should you interpret $arrow(F)(arrow(r)(t))$?
    + What does the quantity $arrow(F)(arrow(r)(t)) dot arrow(r)'(t)$ represent?
    + Write down an integral that gives the exact amount of work moving along path $arrow(r)$ from
      time $t=0$ to $t=1$.

      Evaluate the integral.
    + Let $arrow(q)(t)=(3t^2, 3t^2)$.
      #set enum(numbering: "(a)")
      + What is the graph of $arrow(q)$?
      + Compute how much work is done moving along the path of $arrow(q)$ from time $t=0$ to $t=1$.
      + Is your answer the same or different compared to moving along the path of $arrow(r)$? Why?
  ]
]

#slide(title: [Siefken 5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)

  #columns(2)[
    Let $R subset.eq RR^2$ be a _region_ in $RR^2$ and let $P subset.eq RR^2$ be a _curve_ in
    $RR^2$.

    + Let $f: RR^2 -> RR$.
      #set enum(numbering: "(a)")
      + What does $display(integral_R f dif A)$ mean?
      + What is the difference between
        $
          display(integral_R f dif A) wide "and" wide display(integral.double_R f(x,y) dif x dif y)
        $
    + Let $arrow(F): RR^2 -> RR^2$ and let $arrow(r): RR -> RR^2$ be a parameterization of $P$.
      #set enum(numbering: "(a)")
      + What does $display(integral_P arrow(F) dot d arrow(r))$ mean?
      + What is the difference between
        $
          display(integral_P arrow(F) dot d arrow(r)) wide "and" wide display(integral_0^1 arrow(F)(arrow(r)(t)) dot arrow(r)'(t) dif t)
        $
    + Let $C subset.eq RR^2$ be the unit circle and let $arrow(F)(x,y)=mat(-y; x)$.

      Compute $display(integral_C arrow(F) dot d arrow(r))$.

      What choices did you have to make in order to compute the integral? Would making different
      choices change your answer?

  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)

  #columns(2)[
    Let $h(x,y)=-x^2-2y^2$ denote a height of a hill.

    + Starting at $arrow(p)=(2,3)$ you start walking in the direction of $arrow(v)=(-1,1)$.

      What does the quantity $nabla h(arrow(p)) dot arrow(v)$ represent?
    + You walk (staring at $arrow(p)$) with velocity $arrow(v)$ for $4$ seconds.
      #set enum(numbering: "(a)")
      + What is your ending location?
      + Find a function $arrow(r): RR -> RR^2$ that parameterizes your path (in the $x y$-plane).
      + Find the total change in height between your starting an ending locations.#v(1em)
      + Compute $display(integral_0^4 nabla h(arrow(r)(t)) dot arrow(r)'(t) dif t)$. Does this equal
        your change in height? Why?

    + The *fundamental theorem of line integrals* states that for a differentiable function
      $f:RR^n -> RR$ and an oriented smooth path $P subset.eq RR^n$ with start $arrow(a)$ and end
      $arrow(b)$, then
      $
        integral_P nabla f dot d arrow(r) = f(arrow(b)) - f(arrow(a)).
      $
      How does this theorem relate to the usual Fundamental Theorem of Calculus?

  ]
]

#slide(title: [Siefken 7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    A vector field $arrow(F): RR^n -> RR^m$ is called *conservative* or *path independent* if for
    any points $A$ and $B$, the work done by $arrow(F)$ moving between points $A$ and $B$ does not
    depend on the path taken from $A$ to $B$.


    #{
      let width = 4cm
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
        )
      }

      plot((x, y) => (x, y), title: [X])
      h(1fr)
      // plot((x, y) => (y, x), title: [B])
      // h(1fr)
      plot((x, y) => (-y, x), title: [Y])
      h(1fr)
      // plot((x, y) => (x, -y), title: [D])
      // h(1fr)
      // plot((x, y) => (x * x, 1), title: [E])
      // h(1fr)
      plot((x, y) => ((1.5 + calc.abs(y)), 0), title: [Z])
    }
    + Based on the pictures, which vector fields are _conservative_?
    + Suppose $arrow(F)= nabla f$ for some function $f: RR^2 -> RR$. Is $arrow(F)$ conservative? Why
      or why not?
  ]
]

#slide(title: [Siefken 8], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    If $arrow(F) = nabla f$ for some $f$, then $f$ is called a *potential function* for $arrow(F)$.

    Let $arrow(F)(x,y) = mat(y cos x; sin x +y)$

    + Assuming that $arrow(F)$ has a potential function $f$, what can you say about
      $(partial f)/(partial x)$? What about $(partial f)/(partial y)$?

    + Suppose $f$ is a potential function for $arrow(F)$. Let $A(x)$ be a function of $x$, $B(y)$ be
      a function of $y$ and $C(x,y)$ be a function of $x$ and $y$.

      #set enum(numbering: "(a)")
      + Which of the following could _possibly_ solve the differential equation
        $(partial f)/(partial x) = y cos x$?
        - $y sin x + A(x)$
        - $y sin x + B(y)$
        - $y sin x + C(x,y)$
      + Write the general solution to $(partial f)/(partial y) = sin x + y$
      + Find a potential function for $arrow(F)$.
  ]
]

#slide(title: [Siefken 9], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    *Theorem:* A continuous vector field $arrow(F): RR^n -> RR^n$ is conservative if and only if it
    has a potential function.

    Let $arrow(F)(x,y) = mat(y cos x; sin x +y)$ (same field as the previous question.)

    + Show that $arrow(F)$ is conservative.

    + Consider the path $P$ parameterized by $arrow(r)(t) = mat(sin t; sin 2t + cos t)$ where
      $t in [0, 2pi]$. Find
      $
        integral_P arrow(F) dot d arrow(r)
      $

    + Could the vector field $arrow(G)(x,y)=mat(2x y; x y)$ be path-independent? Why or why not?
  ]
]

#slide(title: [Siefken 10], autoscale: false)[
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
          lq.place(1, 0, image("images/leaf.svg", width: 3em)),
        )
      }

      plot((x, y) => (-y, calc.sin(y + 1) + x / 5), title: $arrow(F):RR^2 -> RR^2$)
    }
    #colbreak()
    A leaf is floating in a pond. The surface of the pond is moving with a velocity at each position
    given by $arrow(F)$.

    + Describe the motion of the leaf over the next few seconds.
    + Besides moving, what other motions could the leaf undergo?
    + If you integrated $arrow(F)$ on the *interior* of the leaf, what mathematical object would you
      get? (vector/scalar/etc.?) What would it tell you?
    + If you integrated $arrow(F)$ along the *boundary* of the leaf, what mathematical object would
      you get? (vector/scalar/etc.?) What would it tell you?

      Are there different ways to do this integral?
  ]
]

// #slide(title: [Siefken 11], autoscale: false)[
//   #show: place.with(dy: 1.3cm)
//   #show: block.with(height: 10cm, breakable: false)
//   #set text(size: .8em)

//   #{
//     let diagram(v1, v2, title: none) = {
//       cetz.canvas({
//         import cetz.draw: *

//         group(name: "figure", {
//           let shift = 0.1

//           line((0, -shift), (v1.at(0), -shift + v1.at(1)), mark: (end: "straight"), name: "v1")
//           line(
//             (0, 1 + shift),
//             (v2.at(0), 1 + shift + v2.at(1)),
//             mark: (end: "straight"),
//             name: "v2",
//           )

//           line((0, 0), (0, 1), mark: (symbol: "[]"), stroke: 2pt)

//           content("v1.end", $arrow(v)_1$, anchor: "north-west", padding: .3em)
//           content("v2.end", $arrow(v)_2$, anchor: "north-west", padding: .3em)
//         })
//         content(
//           "figure.north",
//           [
//             #{
//               if title != none {
//                 show: align.with(center)
//                 title
//                 [\ ]
//               }
//             }

//             $arrow(v)_1 = mat(#(v1.at(0)) ; #(v1.at(1)))$ #sym.space
//             $arrow(v)_2 = mat(#(v2.at(0)) ; #(v2.at(1)))$],
//           anchor: "south",
//           padding: .4em,
//         )
//       })
//     }
//     stack(
//       dir: ltr,
//       spacing: 3em,
//       diagram((-1, 0), (-1, 0), title: "A"),
//       diagram((-0.5, 0), (-1, 0), title: "B"),
//       diagram(
//         (-1, -1),
//         (-2, .5),
//         title: "C",
//       ),
//     )
//   }
//   #columns(2)[
//     The diagrams above show vertical rods (of length 1) subjected to forces at their endpoints.

//     + Which of the rods with *rotate*?
//     + For each rod, calculate the net (total) *rotational* force in the counter clockwise direction.

//       Hint: Since the rods are length 1, this is the same as the _torque_ on each rod.
//   ]
// ]

#slide(title: [Siefken 11], autoscale: false)[
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

                content("rod.mid", [$R$], anchor: "west", padding: .5em)
                content("rod.start", [$arrow(p)$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot((x, y) => (-y, calc.sin(y + 1) + x / 5), title: $arrow(F):RR^2 -> RR^2$)
    }
    #colbreak()
    The rod $R$ has length $h$ and has floats on each of its ends. It is placed, oriented
    vertically, in a pond described by $arrow(F)$ such that only its floats actually touch the
    water.

    Its bottom end is at location $arrow(p)$.

    + How could you determine if the rod will move in the pond? (I.e., what force should you
      compute?)
    + How could you determine if the rod will rotate in the pond?
    + Write down a formula for the *rotational* force acting on the rod.

      _Hint:_ a dot product might be useful.
    + How can $partial/(partial y) arrow(F)$ be used to estimate the rotational force on the rod?
    // + Suppose you made the rod much shorter (by a factor of $t$). Write a formula for the rotational
    //   force *per* unit length of the shorter rod.
  ]
]

#slide(title: [Siefken 12], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $arrow(F): RR^2 -> RR^2$ be a vector field describing the velocity of a fluid in a pond. A
    tiny rod $R$ (with floats on its ends) is placed at location $arrow(p)$.

    Suppose $R$ is placed *vertically* in the pond. The rotational force acting on $R$ (in the
    counter-clockwise direction) is
    $
      approx wide mat(-1; 0) dot partial/(partial y) arrow(F) wide "times" wide "length of" R
    $

    + Suppose $R$ is placed *horizontally* in the pond. How could you estimate the rotational force
      on $R$? Is the force you computed acting in the clockwise or counter-clockwise direction?

    + Suppose you glue a horizontal and vertical rod together into an $L$ shape. How can you
      estimate the total rotational force on the $L$?

    + Find the _normalized_ rotational force on the $L$. That is the rotational force per unit side
      length of the $L$.



    // + If $R$ is placed vertically, how could you compute the *rotational* force per unit length
    //   (i.e. normalized force) that acts on the rod (in the counter-clockwise direction)?
    // + If $R$ is placed vertically, is the (normalized) rotational force approximately equal to
    //   $
    //     // partial/(partial x) arrow(F) wide &"or" wide partial/(partial y) arrow(F)\
    //     x"-coord of" partial/(partial x) arrow(F) wide &"or" wide x"-coord of" partial/(partial y) arrow(F)\
    //     "or" wide y"-coord of" partial/(partial x) arrow(F) wide &"or" wide y"-coord of" partial/(partial y) arrow(F) \
    //   $
    // + If $R$ is placed _horizontally_, how can the (normalized) rotational force be computed? Can a
    //   derivative be used?
    // + Suppose you dropped a tiny square into the pond. How could you compute the *total*
    //   (normalized) rotational force acting on the square?

    // + Suppose $arrow(F)(x,y) = (-y^2, x)$. Calculate the (normalized) rotational force a small
    //   square centered $arrow(p) = (1,2)$ would be subjected to.
  ]
]

#slide(title: [Siefken 13], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $arrow(F): RR^2 -> RR^2$ be a vector field. The *curl* of $arrow(F)$ at a point $arrow(p)$,
    written as $"curl"(arrow(F))$ or $nabla times arrow(F)$ is defined as:

    The limit of the (normalized) rotational force a small "L" at location $arrow(p)$ experiences
    _in the counter-clockwise direction_.

    Let $arrow(F)(x,y)=mat(-y^2; x)$ and let $arrow(p)=(1,2)$.
    #v(1em)

    + Find $"curl"thin arrow(F) ( arrow(p))$.
    + "$nabla times arrow(F)$" is a mnemonic for curl.

      We think of "$nabla = mat(partial/(partial x); partial/(partial y))$".

      In $RR^2$, we think of "$times$" as a determinant. So
      $
        nabla times arrow(F) = det mat(partial/(partial x), -y^2; partial/(partial y), x).
      $
      What happens when you "compute" this determinant? Does it make mathematical sense? Can you
      figure out how to find the curl from your formula?
  ]
]


#slide(title: [Siefken 14], autoscale: false)[
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
          lq.place(1, 0, image("images/leaf.svg", width: 3em)),
        )
      }

      plot((x, y) => (-y, calc.sin(y + 1) + x / 5), title: $arrow(F):RR^2 -> RR^2$)
    }
    #colbreak()
    Recall the leaf floating in a pond whose surface velocity is given by $arrow(F)$.

    + What does the integral of $arrow(F)$ over the *area* of the leaf tell you?
    + What does the (path) integral of $arrow(F)$ along the *boundary* of the leaf tell you?
    + What does the integral of $"curl"thin arrow(F)$ over the *area* of the leaf tell you?

    + *Green's Theorem* states that "a certain path integral = a certain area integral". Fill in
      Green's Theorem with the appropriate integrals.
  ]
]

#slide(title: [Siefken 15], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    Let $arrow(F):RR^2 -> RR^2$ and suppose $arrow(F) = nabla f$ for some $f:RR^2 -> RR$.

    + Are path integrals over $arrow(F)$ path independent? Why or why not?
    + What is the path integral of $arrow(F)$ along a closed curve (i.e. a curve that starts and
      ends at the same point)?
    + Let $D$ be the unit disk in $RR^2$ centered at the origin.

      What does Green's theorem say about the curl of $arrow(F)$ inside of $D$?
    + Can $arrow(F)$ have non-zero curl anywhere?

    + Make a theorem about the curl of conservative vector fields.
    + Can you make a converse to your theorem? I.e., a theorem about curl-free vector fields?
  ]
]

#slide(title: [Siefken 16], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $S$ be a circle of radius $2$ centered at the origin.

    + Find a function $arrow(c): RR -> RR^2$ whose graph is $S$.
    + Is your function $arrow(c)$ one-to-one? Can you adjust the domain so that it is?

      #v(1em)
      #show: pad.with(left: -1.2em)
      Consider the function $arrow(F): RR^2 -> RR^3$ defined by
      $arrow(F)(t,s) = mat(cos t; sin t; s)$

    + When $s$ is held constant, what does the graph of $arrow(F)(t,s)$ look like?
    + When $t$ is held constant, what does the graph of $arrow(F)(t,s)$ look like?
    + What surface does $arrow(F)$ make when it is graphed?
    + Can you restrict the domain of $arrow(F)$ so that it is one-to-one? If so, do it.
  ]
]

#slide(title: [Siefken 17], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)

  #columns(2)[
    Let $R$ be the surface of the cone $z = sqrt(x^2 + y^2)$.

    You would like to find a function $arrow(F)$ whose graph is $R$.
    + The function $arrow(F)$ must have domain $RR^?$ and codomain $RR^(??)$. Fill in the question
      marks.
    + A point on the cone can be found by first choosing an $x$ and $y$ coordinate and then finding
      the height at that point.

      Use this idea to find a function $arrow(F)$.

    + A point on the cone can be found by first choosing an angle and then choosing a distance from
      the $z$ axis.

      Use this idea to find a function $arrow(F)$.

    + A point on the cone can be found by first choosing a displacement from the vertex *along the
      surface of the cone* and then choosing an angle.

      Use this idea to find a function $arrow(F)$.

    + If you integrated a function over the surface $R$, should it matter what $arrow(F)$ you
      choose?
  ]
]
