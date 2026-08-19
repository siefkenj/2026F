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
    title: [MAT235 Slides LEC0401 (Chapter 14)],
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
  Consider the function $f(x,y) = x^2-x y+1+y^2$.

  + Visualize the graph of this function using a contour map and slices.
  + Let $z=s(y)$ be the slice of $z=f(x,y)$ that you get by setting $x=2$.

    Find an equation for $s(y)$.
  + Graph $z=s'(y)$, where $s'$ indicates the derivative of $s$.
]

#slide(title: [Siefken 2])[
  Consider the function $f(x,y) = x^2-x y+1+y^2$.

  + Does $f'(x,y)$ (i.e., the derivative of $f$) make sense? Why or why not?
  + Does $f'(2,y)$ make sense? If so, what rate of change does it represent?
  + Define $s(y) = f(k,y)$ for an unknown (but fixed) $k$.

    How do you write $s'(y)$ using Leibniz notation? (I.e. in $(d?) / (d?)$ form.)

    Compute $s'(y)$
]

#slide(title: [Siefken 3])[
  Consider the function $f(x,y) = x^2-x y+1+y^2$.

  The *partial derivative* of $f$ with respect to $y$ is notated by
  $display((partial)/(partial y)f(x,y))$ or by $f_y (x,y)$ and is the instantaneous rate of change
  of $f$ as $y$ changes while $x$ is held constant.

  + Find $partial/(partial y) f(2,y)$.#v(1em)
  + Find $partial/(partial x) f(x,2)$.#v(1em)
  + Find $f_x$ and $f_y$ at $(2,2)$.
]

#slide(title: [Siefken 4], autoscale: false)[
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
    To the left is a contour plot of $f$.

    + Estimate $partial/(partial x) f(2,2)$.#v(1em)
    + Estimate $partial/(partial y) f(2,2)$.#v(1em)
    + Find formulas for $partial/(partial x) f(x,y)$ and $partial/(partial y) f(x,y)$.#v(.7em)
    + Starting at $(2,2)$, if you moved $10$ units in the $arrow(i)$ direction and $3$ units in the
      $arrow(j)$ direction, what would your elevation be?
  ]
]

#slide(title: [Siefken 5], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    For this question, $Delta$ represents a small number.

    #h(1em)Let $f: RR -> RR$

    + If $f'(2)=K$ and $f(2)=J$ then $f(2+Delta) approx space.thin ??$ (fill in the $??$)
      #v(.5em)

      Let $g:RR^2 -> RR$.
    + If $g_x (2,2)=K$ and $g(2,2)=J$ then
      $
        g(2+Delta, 2) approx space.thin ??
      $
      (fill in the $??$)
    + Do you have enough information to approximate $g(2, 2+ Delta)$? If not, what additional
      information do you need?
    + Suppose $g_y (2,2)=L$.

      Approximate $g(2-Delta, 2+Delta)$
  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    Suppose the graph of $z=f(x,y)$ is a plane with normal vector $mat(1; 2; 3)$.

    + Find $partial/(partial x) f(x,y)$.#v(1em)
    + Find $partial/(partial y) f(x,y)$.
      #v(1fr)

      #colbreak()
      Suppose the graph of $z=g(x,y)$ is a plane and $partial /(partial x) g (x,y)=4$ and
      $partial /(partial y) g (x,y)=2$.

    + Find an equation for the plane.
    + Find a normal vector for the plane.
  ]
]

#slide(title: [Hughes-Hallett et al. Ex. 4], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    A guitar string is vibrating.
    #{
      set align(center)
      image("images/guitar-neck.jpg")
    }
    Let $L$ be the distance down the down the fret board and let $W$ be distance across the neck.

    The displacement of a guitar string at time t (seconds) is given by
    $
      W(t) = 0.003 sin(pi L) sin(2765 t)
    $

    + Find $f_L (0.3,1)$ and $f_t (0.3, 1)$ (you can use a calculator).
    + What does $f_L (0.3,1)$ and $f_t (0.3,1)$ mean in practical terms?
  ]
]


#slide(title: [Siefken 7], autoscale: false)[
  #set text(size: .9em)

  #columns(2)[
    Recall that the temperature inside the earth at position $(x,y,z)$ is (approximately) given by
    $
      T(x,y,z) = -2(sqrt(x^2 + y^2 + z^2) - 3)^(1/3)+2
    $
    In this model, $(0,0,6.3)$ represents the North Pole and $(0,0,-6.3)$ represents the South Pole.

    + What do the level surfaces of $T$ look like?
    + If you are at position $(0,0,6)$ inside the earth, what do you expect to be largest:
      $(partial T)/(partial x)$, $(partial T)/(partial y)$, or $(partial T)/(partial z)$? (Hint: you
      can do this without computing.)
    + The point $(a,b,c)$ inside the earth lies on a level curve of $T$. Is it true that at
      $(a,b,c)$, at least one of $(partial T)/(partial x)$, $(partial T)/(partial y)$, or
      $(partial T)/(partial z)$ is zero? Explain.

  ]
]

#slide(title: [Siefken 8], autoscale: false)[
  #set text(size: .75em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        lq.contour(
          levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-2, 5, num: 40),
          lq.linspace(-2, 5, num: 40),
          (x, y) => x * x + y * y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        lq.place(2.9, 2.9, $16$),
        lq.place(2.1, 2.1, $8$),
        lq.place(2., 2.9, $12$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      set align(center)
      a
    }
    #colbreak()
    To the left is a contour plot of $f(x,y)=x^2+y^2$.

    + Add a contour line for height $10$ to the diagram. Should it lie exactly half way between the
      lines of height $8$ and $12$? Explain.
    + Draw a zoomed in version of the contour plot in the region $2 <= x <= 3$ and $2 <= y <= 3$.
      Include contours of height $8$, $9$, ..., $16$.
    + If you drew a contour plot zoomed into the region $2 <= x <= 2.1$ and $2 <= y <= 2.1$, what
      would it look like?
  ]
]

#slide(title: [Siefken 9], autoscale: false)[
  #set text(size: 1em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        lq.contour(
          levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-2, 5, num: 40),
          lq.linspace(-2, 5, num: 40),
          (x, y) => x * x + y * y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        lq.place(2.9, 2.9, $16$),
        lq.place(2.1, 2.1, $8$),
        lq.place(2., 2.9, $12$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      set align(center)
      a
    }
    #colbreak()
    To the left is a contour plot of $f(x,y)=x^2+y^2$. Let $cal(P)$ be the *tangent plane* to
    $z=f(x,y)$ at the point $(2,2,8)$.

    + What is the slope of $cal(P)$ in the $arrow(i)$ direction?
    + What is the slope of $cal(P)$ in the $arrow(j)$ direction?
    + Add contour lines for $cal(P)$ to the diagram.
    + Find an equation for $cal(P)$.
  ]
]

#slide(title: [Siefken 10], autoscale: false)[
  #set text(size: 1em)

  #columns(2)[
    Consider the plane $cal(P)$ with formula
    $
      z=f(x,y)=2x+3y+4.
    $
    + Find the change in height ($Delta z$) if you start at $(0,0,4)$ and move $alpha$ units in the
      $arrow(i)$ direction.
    + Find $Delta z$ if you start at $(0,0,4)$ and move $beta$ units in the $arrow(j)$ direction.
    + Find $Delta z$ if you start at $(0,0,4)$ and move a multiple $gamma$ along the vector
      $mat(1; 1)$.#v(1em)
    + What is the _slope_ of $f$ in the $mat(1; 1)$ direction? Is it the same as your answer to the
      previous question?
  ]
]

#slide(title: [Siefken 11], autoscale: false)[
  #set text(size: .9em)

  #show: columns.with(2)
  The *directional derivative* of a function $f: RR^2 ->RR$ at the point $arrow(p)$ *in the
  direction $arrow(v)$* is
  $
    f_(arrow(v))(arrow(p)) = lim_(h -> 0) (f(arrow(p) + h arrow(v)) - f(arrow(p))) / h .
  $

  Let $f(x,y) = 2x + 3y + 4$.

  + Find $f_(arrow(i))(1,2)$ and $f_(arrow(j))(1,2)$ _from the limit definition_.
  + Let $arrow(v)=mat(-2; 5)$. Find $f_(arrow(v))(1,2)$.
  + Suppose $g(x,y) = a x + b y +c$ represents a plane.

    Let $arrow(p)=mat(p_1; p_2)$ be a point and let $arrow(v)=mat(v_1; v_2)$ be a vector.

    Find a formula for $g_(arrow(v))(arrow(p))$.
  // is a *linear
  //   function* $D:RR^2 -> RR$ such that
  // $
  //   f(arrow(p) + arrow(v)) approx f(arrow(p)) + D(arrow(v))
  // $
  // whenever $||arrow(v)||$ is small.
]

#slide(title: [Siefken 12], autoscale: false)[
  #set text(size: 1em)

  #show: columns.with(2)
  #text(weight: "bold", [Theorem]): If function $f: RR^2 ->RR$ is *differentiable* at the point
  $arrow(p)$, the directional derivatives of $f$ at $arrow(p)$ match the directional derivatives of
  the tangent plane to $z=f(x,y)$ at $arrow(p)$.

  Let $f(x,y) = x^2 + y^2 + 3$. $f$ is differentiable.

  + Find the tangent plane to $f$ at $(1,2)$.

  + Find $f_(arrow(i))(1,2)$ and $f_(arrow(j))(1,2)$.
  + Let $arrow(v)=mat(-2; 5)$. Find $f_(arrow(v))(1,2)$.
  + Let $arrow(v)=mat(v_1; v_2)$ be a vector.

    Find a formula for $f_(arrow(v))(1,2)$.
]

#slide(title: [Siefken 13], autoscale: false)[
  #set text(size: 1em)

  For a function $f: RR^n -> RR$, the *gradient* of $f$ (written $nabla f$ or $"grad" f$) is the
  vector
  $
    nabla f =(partial/(partial x) f,space partial/(partial y) f,space ...).
  $
  #show: columns.with(2)
  Let $T(x,y) = 2x+3y+4$

  + Find $T_(arrow(v)) (1,2)$ where $arrow(v)=mat(v_1; v_2)$ is an arbitrary vector.

  + Find $nabla T$.
  + Compute $nabla T dot arrow(v)$ where $arrow(v)=mat(v_1; v_2)$ is an arbitrary vector. What do
    you notice?
]

#slide(title: [Siefken 14], autoscale: false)[
  #set text(size: 1em)

  #show: columns.with(2)
  Let $arrow(v)=mat(v_1; v_2)$. Recall, for $f(x,y) = x^2 + y^2 + 3$ that
  $
    f_(arrow(v))(1,2) = 2 v_1 + 4 v_2
  $


  + Compute $nabla f(1,2)$.
  + Rewrite $f_(arrow(v))(1,2)$ using $nabla f(1,2)$.

  + Let $arrow(p)=(p_1,p_2)$. Find an expression for $f_(arrow(v))(arrow(p))$.

  + If $g: RR -> RR$ is a differentiable function, from single variable calculus, we know
    $
      g(p+ Delta x) approx g(p) + g'(p) Delta x.
    $
    Find a similar expression for $f(arrow(p) + Delta arrow(v))$.
]

#slide(title: [Siefken 15], autoscale: false)[
  #set text(size: .9em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        lq.contour(
          levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-2, 5, num: 40),
          lq.linspace(-2, 5, num: 40),
          (x, y) => x * x + y * y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        lq.place(1.5, 3.6, $16$),
        lq.place(.5, 2.6, $8$),
        lq.place(1, 3.2, $12$),
        lq.place(2, 2, lq.mark(stroke: 5pt + black)),
        lq.place(2.15, 2, $arrow(p)$, align: left),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      set align(center)
      a
    }
    #colbreak()
    To the left is a contour plot of $f(x,y)$.

    + In what direction(s) is $f_(arrow(u))(arrow(p))$ positive? Negative?
    + In what direction(s) is $f_(arrow(u))(arrow(p))$ largest? Smallest?
    + In what direction(s) is $f_(arrow(u))(arrow(p))$ zero?
    + Estimate the largest possible value of $f_(arrow(u))(arrow(p))$ when $arrow(u)$ is a unit
      vector.
  ]
]

#slide(title: [Siefken 16], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        lq.contour(
          levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-2, 5, num: 40),
          lq.linspace(-2, 5, num: 40),
          (x, y) => x * x + y * y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        lq.place(1.5, 3.6, $16$),
        lq.place(.5, 2.6, $8$),
        lq.place(1, 3.2, $12$),
        lq.place(2, 2, lq.mark(stroke: 5pt + black)),
        lq.place(2.15, 2, $arrow(p)$, align: left),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      set align(center)
      a
    }
    #colbreak()
    To the left is a contour plot of $f(x,y)$.

    + How does $nabla f(arrow(p))$ relate to a directional derivative of $f$. Explain.#v(1em)
    + What is $nabla f(arrow(p)) dot mat(1; -1)$? How do you know?

    + Draw $nabla f(arrow(p))$ on the contour plot.

    + Estimate $a$ and $b$ in the following expression $nabla f(arrow(p)) = (a,b)$.
  ]
]

#slide(title: [Siefken 17], autoscale: false)[
  #set text(size: .9em)

  #columns(2)[
    You are walking on a hill. The height at position $(x,y)$ is given by
    $
      h(x,y) = 1000 - inline(1/5)x^2 - inline(2/5)y^2 .
    $

    You are currently standing at position $(1,3)$.

    + Is there a direction you can walk so that your elevation doesn't change? What is that
      direction?
    + You want a challenge: you'd like to walk up the hill the steepest way possible. What direction
      should you walk?

    + Baldwin St, NZ is the steepest street in the world with a slope of 0.35. You'd like to
      experience the steepness of Baldwin St. What direction should you walk up the hill? (You can
      use Desmos to help)

  ]
]

#slide(title: [Siefken 18], autoscale: false)[
  #set text(size: .9em)

  #columns(2)[
    Let $f(x,y)=??$ be an unknown function and define $g(x,y)=f(2x,y)$.

    + Describe in words what each of the following quantities are: $f_(arrow(i))(x,y)$ and
      $g_(arrow(i))(x,y)$ and $f_(arrow(i))(2x,y)$. Are any of them equal?

      #v(1em)
      Suppose $f(3,4)=10$ and $f_(arrow(i)) (3,4) = 5$.
    + Complete the formula: $f(3+Delta, 4) approx ...$
    + Based on the information you have, which of the following can you compute _exactly_? $g(3,4)$,
      $g(3/2,4)$, $g(6,4)$.
    + Fill in the $?$ so that you have a valid approximation:
      $
        g(??? + Delta, 4) approx space.thin g(??,4) + space.thin ? Delta
      $

  ]
]

#slide(title: [Siefken 20], autoscale: false)[
  #set text(size: .9em)

  #columns(2)[
    Let $f(x,y)=??$ be an unknown function and define $g(x,y)=f(2x,y)$.

    + Find an approximation for $g(x + Delta, y)$ in terms of partial derivative(s) of $g$.
    + Find an approximation for $g(x + Delta, y)$ in terms of partial derivative(s) of $f$.
    + Find a formula for $(partial g)/(partial x)(x,y)$ in terms of $(partial f)/(partial x)$.


  ]
]

#slide(title: [Siefken 21], autoscale: false)[
  #set text(size: .9em)

  #columns(2)[
    Let $f(x,y)=??$ be an unknown function and define $g(x,y)=f(h(x),y)$ for an unknown but
    differentiable function $h$.

    + Find a formula for $(partial g)/(partial x)(x,y)$ in terms of $(partial f)/(partial x)$ and
      $(dif h)/(dif x)$.
    + Find a formula for $(partial g)/(partial y)(x,y)$.
    + Find $nabla g(x,y)$.
    + How do your formulas relate to the _chain rule_ from single variable calculus? Explain.
  ]
]

#slide(title: [Siefken 22], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    The multi-variable chain rule *should not be memorized*. Instead, use tangent planes to derive
    correct expressions.

    Let $f: RR^2 -> RR$, $g: RR -> RR$, and $h: RR -> RR$. Define $p(t) = f(g(t), h(t))$. We'd like
    to compute $p'(t)$.

    + Find a formula for $z=T(x,y)$, the tangent plane to $f$ at the point $(a,b)$.

      Annotate your formula by underlining the #underline[constant] expressions.
    + We will approximate $p(t)$ at $t=t_0$ by
      $
        p(t) approx T(g(t), h(t))
      $
    #set enum(numbering: "(a)")
    + What should the value of $a$ and $b$ be to make this approximation good near $t=t_0$?
    + Differentiate your approximation to find $p'(t_0)$. Then find a formula for $p'(t)$.
  ]
]

#slide(title: [Siefken 23], autoscale: false)[
  #set text(size: .9em)

  #columns(2)[
    Let $f,g,h$ be functions from $RR^2$ to $RR$. Define $p(x,y) = f(g(x,y), h(x,y))$.

    + Use a tangent plane approximation of $f$ to find a formula that approximates $p$ near the
      point $(a,b)$.
    + Find $(partial p)/(partial x) (a,b)$#v(1em)
    + Find $(partial p)/(partial y) (a,b)$#v(1em)
    + Find $nabla p (a,b)$
    + Find $nabla p (x,y)$
    + Why do we make a tangent plane approximation at the point $(a,b)$ instead of the point
      $(x,y)$? Explain.
  ]
]

#slide(title: [Siefken 24], autoscale: false)[
  #set text(size: .85em)

  The temperature of inside the earth at position
  #columns(2)[
    The temperature at position $(x,y,z)$ inside the earth given by
    $
      T(x,y,z) = -2(sqrt(x^2 + y^2 + z^2) - 3)^(1/3)+2
    $
    in units of thousands of degrees Celsius.

    You are drilling through the earth. Your drill's position at year $t$ is $P(t) = (t,-2t,3t+4)$

    + Find an equation for the temperature $D_T (t)$ the drill encounters at year $t$.
    + Use multi-variable calculus to find the rate of change of $D_T$ at year 2.

      Hint: do the computation symbolically first.
  ]
]

#slide(title: [Siefken 25], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Consider the function $f(x,y) = x^2+y^2 - 4x y$.

    A *critical point* for a multivariable function is a point where all directional derivatives are
    zero (or undefined).

    Let $arrow(u)=(u_1,u_2)$
    + Find $f_(arrow(u))(x,y)$.
    + Find all critical points of $f$.
    + Graph slices of $z=f(x,y)$ when $x=0$ and $y=0$.
    + Write down the *second derivative test* for single variable functions.
    + Apply the second derivative test to each of your slices to decide if $(0,0)$ is a local max or
      local min.

      Do you think that $(0,0)$ is a local max, local min for the function $f$? Explain.

    + Use https://www.desmos.com/3d to graph $z=f(x,y)$. What do you see?

  ]
]

#slide(title: [Siefken 26], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Consider the function $f(x,y) = x^2+y^2 - 4x y$.

    Let $arrow(u)=(u_1,u_2)$
    + Find $f_(arrow(u))(0,0)$.
    + Find all critical points of $f$.
    + Find a formula for the *second directional derivative* of $f$ in the direction $arrow(u)$ at
      the point $(0,0)$.

    // #colbreak()
    // #set enum(numbering: "(a)")
    + The multivariable *second derivative test* says that a function $f$ has a local min at a
      critical point $arrow(p)$ if *all* second directional derivatives of $f$ at $arrow(p)$ are
      positive and a local max if *all* second directional derivatives are negative.

      What does the multivariable second derivative test tell us about $f$ at $(0,0)$?

    + Find a general formula for the second directional derivative of a function $g$ in the
      direction $arrow(u)$ at the point $(x,y)$.
  ]
]

#slide(title: [Siefken 27], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Consider the function
    $
      f(x,y) = cases(x y display((y^2 - x^2)/(x^2+y^2)) &" if "(x,y) != (0,0), 0 &" otherwise")
    $
    In this question you may use the fact that
    $
      f_x (x,y) = (-x^4y-4x^2y^3+y^5)/(x^2+y^2)^2 \
      f_y (x,y) = (-x^5+4x^3y^2+x y^4)/(x^2+y^2)^2
    $
    when $(x,y) != (0,0)$ and $0$ otherwise.

    + Use https://desmos.com/3d to graph $f$. Does the graph look unusual?
    + Graph $f_x$ on desmos and use the graph to estimate $f_(x y) = (partial)/(partial y) f_x$ at
      $(0,0)$.
    + Graph $f_y$ on desmos and use the graph to estimate $f_(y x)=(partial)/(partial x) f_y$ at
      $(0,0)$.
    + Does $f_(x y) = f_(y x)$. Explain.
  ]
]

#slide(title: [Siefken 28], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $g(x,y)=cos(x+y)+cos(y)$.

    + A general *second degree* polynomial in one variable is $a x^2 + b x + c$. Write down a
      general second degree polynomial in *two* variables. Call your polynomial $Q(x,y)$.

    + Find $Q(0,0)$ as well as all first *and* second order partial derivatives of $Q$ at $(0,0)$.

    + Find $g(0,0)$ as well as all first *and* second order partial derivatives of $g$ at $(0,0)$.

    + Can you find coefficients for $Q$ so that $Q$ matches $g$ as closely as possible near $(0,0)$?

    + Use https://www.desmos.com/3d to graph $g$ and your polynomial $Q$. How do they compare?

    + $Q$ is called the *second degree* approximation to $g$ at $(0,0)$. What is the *first degree*
      approximation? (How about the $n$#super("th") degree approximation?)
  ]
]

#slide(title: [Siefken 29], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Open

    https://www.desmos.com/3d/j2qkb0agxt

    which has a general second degree polynomial.

    + Classify the different types of shapes you can get by changing the coefficients.
    + How can you get a plane?
    + Can you get a "taco" shape? (e.g., the shape of an _extruded_ parabola)?
  ]
]

#slide(title: [Siefken 30], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    A function $f:RR^2 -> RR^2$ is *differentiable* at the point $arrow(p)$ if there exists a plane
    $z=L(x,y)$ such that $f(arrow(p)) = L(arrow(p))$ _and_
    $
      lim_(arrow(h) -> arrow(0)) (f(arrow(p) + arrow(h)) - L(arrow(p) + arrow(h))) / norm(arrow(h)) = 0.
    $

    + "$f(arrow(p) + arrow(h)) - L(arrow(p)+arrow(h))$" is sometimes called an *error term*. Why?
      Does the terminology make sense?

    + Let $C(x,y) = -sqrt(1/4 x^2 + 1/4 y^2)$. Use Desmos to graph $C$.
    + Define $z=L(x,y)$ to be a horizontal plane through the origin.

      Graph $z=C(x,y)$ and $z=L(x,y)$.

      Is $z=L(x,y)$ a "good" approximation to $z=C(x,y)$ near $(0,0)$?
    + Does $L$ satisfy the requirements for differentiability of $C$ at the origin?
    + Is $C$ differentiable at the origin? Explain.
    + Is $C$ differentiable at $(2,0)$?
  ]
]

#slide(title: [Practice], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Open the demos applet

    https://www.desmos.com/calculator/gocmdy79gy

    + Explore the surface by adjusting $h$. Where are the maxes and mins?
    + Sketch gradient vectors on the contour map. Where are they longest? Shortest?
    + If you followed gradient descent from the point $(1,-1)$, where would you end up?


    #image("images/heart-level-curves.png")

  ]
]

#slide(title: [Practice 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Open the demos applet

    https://www.desmos.com/calculator/gocmdy79gy

    + Estimate $f_x$ and $f_y$ at $(2,0)$.
    + What can you say about the sign of $f_(x x)$ and $f_(y y)$ at $(2,0)$?


    #image("images/heart-level-curves.png")

  ]
]
