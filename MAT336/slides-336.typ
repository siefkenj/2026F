#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import "@preview/cetz:0.4.2"
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/tiptoe:0.3.1"
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/itemize:0.2.0"
#import "@preview/ergo:0.2.0": *
#import "@preview/ergo:0.2.0"

#show: ergo-init


#set enum(
  full: true, // Required to get all level numbers in the function
  numbering: (..n) => {
    let level = n.pos().len() - 1
    // Define the pattern based on the nesting level
    let pattern = ("1.", "(a)", "(i)", "(A)").at(level, default: "1.")

    // Apply the numbering function with the chosen pattern and the current number
    numbering(pattern, n.pos().last())
  },
)
#show: itemize.default-enum-list

#let subset = math.subset.eq

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
    title: [MAT336 Slides LEC0101/2001],
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

#slide(title: [Setting the Stage])[
  Directions

  For each of the questions that follow, I will ask you to:

  + *Think* about a possible answer on your own.
  + *Discuss* your answers with the rest of your group.
  + *Share* a summary of each group’s discussion.

]

#slide(title: [Setting the Stage])[
  What are the goals of a university education?
]
#slide(title: [Setting the Stage])[
  How does a person learn something new?
]
#slide(title: [Setting the Stage])[
  What do you reasonably expect to remember from your courses in 20 years?
]

#slide(title: [Class Details])[
  This class is about *training your mind*.

  You will practice by:
  - Working in class
  - Presenting and critiquing in tutorial
  - Doing problem sets (get a study group!)

  *AI Warning:* AI can sometimes answer analysis questions, but *the journey is the point*. Do not
  ask AI to do (or "help" with) your homework.

]

#slide(title: [A Foundation Built on Sand])[
  *Richard's Paradox* (1905):

  + Every real number can be expressed as a decimal.
  + Every decimal expresses a real number.
  + Consider the following ...

]

#slide(title: [A Troubling Sum], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  Consider the infinite series:
  $
    G = 1 -1 +1 -1 +1 -1 + dots.c
  $

  + What is $G$ as a real number?
  + What are the partial sums of $G$?
  + The Cesàro sum of a sequence is the limit of the averages of the partial sums.

    What is the Cesàro sum of $G$?
  + $2G=G+G = G + (0+G)$. Symbolically compute $2G$ and use that to find $G$. What do you get if you
    use a Cesàro sum to compute $2G$?
  + The Taylor series for $1/(1-x)$ is $1+x+x^2+x^3+x^4+ dots.c$. Can this fact be used to find $G$?
    What value does it give?
]

// Proof adapted from https://nseverkar.medium.com/two-proofs-that-the-sum-of-all-natural-numbers-is-1-12-a317217bb8b9
#slide(title: [A Troubling Sum 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  Consider
  $
    A = 1 - 2 + 3 - 4 + 5 - 6 + dots.c
  $
  and
  $
    S = 1 + 2 + 3 + 4 + 5 + 6 + dots.c
  $

  + $2A = A+A = A+ (0+A)$. Use what you've learned to find a value for $A$.
  + Symbolically manipulate $S-A$ to find an expression for $S-A$ in terms of $S$.
  + Use what you've learned to find the value of $S$ as a real number.
  + Does your result agree with what you were taught in Calculus class?

]

#slide(title: [A Troubling Sum 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: 1.0em)

  Consider
  $
    E = 1 + 1 + 1 + 1 + dots.c
  $

  + $E - E = E - (0 + E)$. Use what you've learned to find a value for $E - E$.
  + According to the ordinary rules of arithmetic, what should $E - E$ be?
  + What went wrong?
]

// https://www.desmos.com/calculator/bzoda3dwhx
#slide(title: [Fourier's Series], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    Fourier considered a long metal plate.
    #{
      let a = lq.diagram(
        width: 7.5cm,
        height: 6cm,
        xlim: (-2, 2),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        xlabel: $x$,
        ylabel: $omega$,
        // lq.place(3.5, 3.5, $5$),
        // lq.place(2.8, 2.8, $4$),
        // lq.place(2.2, 2.2, $3$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
        lq.path(
          (-1, 0),
          (-1, 5),
          (1, 5),
          (1, 0),
          stroke: (paint: blue, thickness: 2pt, dash: "dashed"),
          fill: blue.lighten(60%).transparentize(50%),
        ),
        lq.path(
          (-1, 0),
          (1, 0),
          stroke: (paint: orange.darken(10%), thickness: 6pt),
        ),
      )
      set align(center)
      a
    }

    The dashed line is kept at temperature $0$. The bottom is heated to have temperature $f(x)$,
    where $f:[-1,1] -> RR$ is a symmetric (even) function with $f(-1) = f(1)=0$.

    The resulting differential equation is solvable if:
    $
      f(x) = & a_1 cos((pi x) / 2) + a_2 cos((3 pi x) / 2) \
             & + space.thin a_3 cos((5 pi x) / 2) + dots.c + a_n cos(((2n-1) pi x) / 2)
    $
  ]
]

#slide(title: [Fourier's Series 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    $
      f(x) = & a_1 cos((pi x) / 2) + a_2 cos((3 pi x) / 2) \
             & + space.thin a_3 cos((5 pi x) / 2) + dots.c + a_n cos(((2n-1) pi x) / 2)
    $
    Fourier showed that for a symmetric function $f$, $a_1$, $a_2$, $a_3$, ... can be computed via
    the formula:
    $
      a_n = integral_(-1)^1 f(x) cos(((2n-1) pi x) / 2) dif x
    $

    #colbreak()
    + Use the Desmos link:

      #text(size: .8em, link("https://www.desmos.com/calculator/pdbdor308p"))

      to experiment with different functions $f$ and different numbers of terms $n$.
    + What happens when $f(x)$ doesn't pass through $0$ and $x= plus.minus 1$?
    + What happens when you put in a non-symmetric function?
    + Find the coefficients for the function $f(x)=1$

  ]
]
#slide(title: [Fourier's Series 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    Fourier claimed:
    $
      f(x) =1 = 4/pi ( & cos((pi x) / 2) -1/3 cos((3 pi x) / 2) \
                       & + 1/5 cos((5 pi x)/2)
                         - 1/7 cos((7 pi x)/2) \
                       & + 1/9 cos((9 pi x)/2) + dots.c )
    $

    #colbreak()
    Using the Taylor series for $arctan$, we can show that:
    $
      pi = 4(1 - 1/3 + 1/5 - 1/7 + 1/9 - dots.c)
    $

    + Show Fourier's formula holds when $x=0$.
    + Find the value of Fourier's formula for $x=0,1,2,...$.
    + Is it true that Fourier's formula equals $1$? Come up with arguments for *and* against.

  ]
]

#slide(title: [Functions and Series], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    In the 1800s:
    - Taylor series were known.
      - Could be differentiated term-by-term.
      - Could be integrated term-by-term.
      - Represented continuous functions.
    - Graphs of functions were continuous *except* at a few points.

    #colbreak()
    - Trigonometric series
      - Could not be differentiated term-by-term.
      - Could be integrated term by term?
      - Could result in _discontinuous_ functions.
  ]
]

// Week 2
#slide(title: [Language of Proofs], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    Proofs should:
    - Convince the (appropriately trained) reader through _logical_ argument.
    - Be unambiguous.

    #colbreak()
    We use formal language to remove ambiguity. Consider the sentence: "Can anyone in this room open
    this jar of pickles?"
    + What are two meanings this sentence could take on?
    + Rephrase the sentence to be unambiguous.
  ]
]

#slide(title: [Quantifiers], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  Modern proofs heavily employ:
  - Sets
  - Quantifiers
    - There exists/for some ($exists$)
    - For all/for any ($forall$)

  #colbreak()

  For each of the following, define a set of people $X$ such that the statement is true.

  + "For all $p in X$, $p$ lives in Toronto."
  + "There exists a $p in X$ such that $p$ lives in Toronto."
  + "There exists a $p in X$ such that $p$ lives in Toronto, but it is not the case that for all
    $p in X$, $p$ lives in Toronto."
  + "For all $p in X$, $p$ is an armadillo."
]

#slide(title: [Notes on Quantifiers], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns.with(3)
  In *Symbolic Logic*
  - Quantifiers are written as $exists$ and $forall$.
  - Always come at the start of a statement.
  - Are followed by a comma (e.g. $forall x in P, exists y in P, x > y$)

  #colbreak()

  In *This Class*
  - Quantifiers are written as symbols or words; words in a paragraph, symbols in a set.
  - Primarily appear at the start of a statement.
  - Are followed by the English connective (e.g. $forall x in P, exists y in P " such that "x>y$)


  #colbreak()

  In *Professional Mathematics*
  - Quantifiers are written as symbols or words; words in a paragraph, symbols in a set.
  - Appear where ever the author feels like (e.g. "There exists $x$ such that ??" $=$ "?? is true
    for some $x$")
  - Are followed by the English connective

]

#slide(title: [Set-builder Notation], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  We will use *naive set theory* (in contrast to _formal_, or ZFC set theory).

  A set is a collection of objects. It is
  - Specified with curly braces ${...}$
  - Doesn't distinguish repeated elements
  - Has no sense of order for its elements.

  Standard sets are $RR$, $ZZ$, $NN$, $QQ$, $CC$.

  #colbreak()

  Set-builder notation creates a new set from an existing set.

  + Read aloud what is meant by ${x in RR: x > 0 " and " x < 2}$.
  + Let $A,B subset RR$ be subsets. Write $A inter B$, $A union B$, and $A backslash B$ using
    set-builder notation.

]

#slide(title: [Set Practice], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  Definition: An _irrational_ number is a real number that is not rational.

  Let $W$ be the set of positive, rational numbers and negative, irrational numbers.

  + Express $W$ using set-builder notation.

    #colbreak()
    Describe the following sets:


  + $A={x in RR:forall y in [0,1], x<y}$
  + $B = {x in RR: exists y in [0,1] "s.t." x < y}$
  + $C={x in [0,1]: forall y in [0,1], x<y}$
  + $D={x in [0,1]: exists y in [0,1] "s.t." x<y}$
  + $E={x in RR: exists y in RR "s.t." x< y}$
  + $F={x in [0,1]: y in RR, x < y}$

]

#slide(title: ["Extended" Set-builder Notation], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns

  Let $T subset NN$ be the set of positive multiples of $2$. Let $R subset NN$ be the set of
  positive multiples of $3$.

  Define
  $
    Q={ a/b : a in T "and" b in R}
  $

  + List at least three elements of $Q$.
  + Is $Q$ written in standard set-builder notation?
  + Express $Q$ using set-builder notation.
]

#slide(title: [Axioms], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  Mathematicians believe:

  All *mathematical* statements are either true or false.

  + It's 11pm. 12 hours go by. What time is it?
  + Is the statement "11 + 12 = 11" true or false?
  + How could you modify the statement "11 + 12 = 11" to make it true?

    How could you modify it to make it false?

    #colbreak()
    Axioms are *assumptions* that
    - Are as simplified as possible
    - Don't contradict other assumed axioms
    - Cannot be derived from other axioms

    Which of the following are axioms?

  + For all $a,b in RR$, $a+b in RR$.
  + There is no largest real number.
  + For all $a in RR$, $a+ 1 > a$
  + $sqrt(2)$ is irrational.
  + For all $a in RR$, $a^2 >= 0$
]

#slide(title: [A Proof about Even Numbers], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  Let $E$ be the set of even integers.

  + Which of these is a correct description of $E$?
    + $E= { n in ZZ : forall a in ZZ, n=2a}$
    + $E= { n in ZZ : exists a in ZZ, n=2a}$
  + Write a proof that $6 in E$.
  + Write a proof that $5 in.not E$.
  + Which of the following statements are true?
    + For all $a in ZZ$, the number $n=2a$ is even.
    + There exists $a in ZZ$ such that the number $n=2a$ is even.
  + Prove each true statement above.

]

#slide(title: [A One-to-One Proof], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  A function $f$ with domain $D$ is *one-to-one* if different inputs produce different outputs.

  + Write a formal definition of _one-to-one_ (using quantifiers, etc.).
  + Prove that $f(x)=3x+2$ with domain $RR$ is one-to-one.
  + Prove that $g(x)=x^2$ with domain $RR$ is not one-to-one.
  + Define $h(x)=x^2$ with domain $D subset RR$. Can you find a $D$ such that $h$ is one-to-one? If
    so, do it. Prove your answer.
]

#slide(title: [Criticizing Proofs 1], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  *Theorem:* The sum of two odd numbers is even.

  *Proof:*

  $3$ is odd.\
  $5$ is odd.\
  $3+5=8$ is even.

  #colbreak()
  + What is wrong with the proof?
  + Can it be salvaged?
]
#slide(title: [Criticizing Proofs 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  *Theorem:* The sum of two odd numbers is even.

  *Proof:*

  The sum of two numbers is always even.

  even + even = even\
  even + odd = odd\
  odd + even = odd\
  odd + odd = even

  #colbreak()
  + What is wrong with the proof?
  + Can it be salvaged?
]

#slide(title: [Criticizing Proofs 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  *Theorem:* The sum of two odd numbers is even.

  *Proof:*

  $x=2a+1$ odd\
  $y=2b+1$ odd\
  $x+y=2n$ even\
  $2a+1+2b+1=2n$\
  $2a+2b+2=2n$\
  $a+b+1=n$


  #colbreak()
  + What is wrong with the proof?
  + Can it be salvaged?
]

#slide(title: [Archimedean Underestimate], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  #{
    let f(x) = 1 - x * x
    import "@preview/cetz:0.4.2"
    import "@preview/cetz-plot:0.1.3"
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      plot.plot(
        size: (9, 6),
        x-tick-step: 1,
        y-tick-step: none,
        x-label: none,
        y-label: none,
        axis-style: none,

        {
          plot.add(
            f,
            domain: (-1, 1),
          )
          plot.add(
            ((0, 1), (1 / 2, f(1 / 2)), (1 / 4, f(1 / 4)), (0, 1)),
            fill: true,
            mark: none,
            style: (fill: red.lighten(60%), stroke: red),
            label: $t_3$,
          )
          plot.add(
            ((1, 0), (1 / 2, f(1 / 2)), (3 / 4, f(3 / 4)), (1, 0)),
            fill: true,
            mark: none,
            style: (fill: red.lighten(60%), stroke: red),
          )
          plot.add(
            ((1, 0), (1 / 2, f(1 / 2)), (0, 1)),
            fill: true,
            mark: none,
            style: (fill: orange.lighten(80%), stroke: orange),
            label: $t_2$,
          )
          plot.add(
            ((0, 0), (1, 0), (0, 1), (0, 0)),
            fill: true,
            mark: none,
            style: (fill: blue.lighten(80%), stroke: blue),
            label: $t_1$,
          )
          plot.add(
            ((0, 1), (-1 / 2, f(1 / 2)), (-1 / 4, f(1 / 4)), (0, 1)),
            fill: true,
            mark: none,
            style: (fill: red.lighten(60%), stroke: red),
          )
          plot.add(
            ((-1, 0), (-1 / 2, f(1 / 2)), (-3 / 4, f(3 / 4)), (-1, 0)),
            fill: true,
            mark: none,
            style: (fill: red.lighten(60%), stroke: red),
          )
          plot.add(
            ((-1, 0), (-1 / 2, f(1 / 2)), (0, 1)),
            fill: true,
            mark: none,
            style: (fill: orange.lighten(80%), stroke: orange),
          )
          plot.add(
            ((0, 0), (-1, 0), (0, 1), (0, 0)),
            fill: true,
            mark: none,
            style: (fill: blue.lighten(80%), stroke: blue),
          )
        },
      )
      // ...
    })
  }

  Archimedean method (area under $1-x^2$): Fill with triangles.
  - Total area of $t_1=1$
  - Total area of $t_2=1/4$
  - Total area of $t_3=1/16$
  - Total area of $t_n=1/4^(n-1)$

  + Find a formula that always _under estimates_ the area under $1-x^2$.
  + Should the limit of $t_1+t_2+t_3+dots.c +t_n$ equal the area under $1-x^2$? Why or why not?

]

#slide(title: [Archimedean Overestimate], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  #{
    let f(x) = 1 - x * x
    import "@preview/cetz:0.4.2"
    import "@preview/cetz-plot:0.1.3"
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      plot.plot(
        size: (9, 6),
        x-tick-step: 1,
        y-tick-step: none,
        x-label: none,
        y-label: none,
        axis-style: none,

        {
          plot.add(
            f,
            domain: (-1, 1),
          )
          plot.add(
            ((1 / 2, f(1 / 2)), (1.13, .065), (1, 0), (1 / 2, f(1 / 2))),
            fill: true,
            mark: none,
            style: (fill: green.lighten(80%), stroke: (paint: green, dash: "dashed")),
            label: $"error"_2$,
          )
          plot.add(
            ((1 / 2, f(1 / 2)), (0.17, 1.105), (0, 1), (1 / 2, f(1 / 2))),
            fill: true,
            mark: none,
            style: (fill: green.lighten(80%), stroke: (paint: green, dash: "dashed")),
          )
          plot.add(
            ((1, 0), (1 / 2, f(1 / 2)), (0, 1)),
            fill: true,
            mark: none,
            style: (fill: orange.lighten(80%), stroke: orange),
            label: $t_2$,
          )
          plot.add(
            ((0, 0), (1, 0), (0, 1), (0, 0)),
            fill: true,
            mark: none,
            style: (fill: blue.lighten(80%), stroke: blue),
            label: $t_1$,
          )
          plot.add(
            ((-1 / 2, f(1 / 2)), (-1.13, .065), (-1, 0), (-1 / 2, f(1 / 2))),
            fill: true,
            mark: none,
            style: (fill: green.lighten(80%), stroke: (paint: green, dash: "dashed")),
          )
          plot.add(
            ((-1 / 2, f(1 / 2)), (-0.17, 1.105), (0, 1), (-1 / 2, f(1 / 2))),
            fill: true,
            mark: none,
            style: (fill: green.lighten(80%), stroke: (paint: green, dash: "dashed")),
          )
          plot.add(
            ((-1, 0), (-1 / 2, f(1 / 2)), (0, 1)),
            fill: true,
            mark: none,
            style: (fill: orange.lighten(80%), stroke: orange),
          )
          plot.add(
            ((0, 0), (-1, 0), (0, 1), (0, 0)),
            fill: true,
            mark: none,
            style: (fill: blue.lighten(80%), stroke: blue),
          )
        },
      )
      // ...
    })
  }

  Archimedean showed that triangles of total area $"error"_n=t_n$ could be added to completely cover
  the parabola.
  + Find a formula that always _over estimates_ the area under $1-x^2$.
  + Do you have enough information to argue about the true area under $1-x^2$?

]

#slide(title: [Finding Exact Area], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  // #show: columns
  We'd like to find the area under the parabola $1-x^2$. Call this area $A$.

  + Could $A < 4/3$? Prove your answer.
  + Could $A > 4/3$? Prove your answer.
  + The *trichotomy axiom* for real numbers states that for real numbers $a$ and $b$, exactly one of
    the following is true: $a < b$, $a = b$, or $a > b$.

    Prove $A=4/3$. Did you have to make any additional assumptions?
]

#slide(title: [Archimedean Understanding], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns
  Your textbook states:
  #defn[Archimedean Understanding][The _Archimedean understanding_ of an infinite series is that it
    is shorthand for the sequence of finite summations.

    The value of an infinite series, if it exists, is that number $T$ such that given any $L < T$
    and any $M > T$, all the finite sums from some point on will strictly be contained in the
    interval between $L$ and $M$.
  ]
  #colbreak()

  + What does the definition mean when it says "from some point on"? Is that really needed?
  + Let $(t_i)_(i in NN)$ be a sequence of real numbers. Formally rewrite (using $forall$ and
    $exists$) the definition of the Archimedean understanding of what it means for
    $t_0 + t_1 + t_2 + dots.c$ to equal the number $T$.
  + We say a series is *convergent* if its limit exists in the Archimedean sense. Formally write
    what it means for a series $t_0 + t_1 + t_2 + dots.c$ to be convergent.
]

#slide(title: [Convergence in Different Sets (Is there a there there?)], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)


  #show: columns

  Let $DD = {q in QQ: exists n in NN, exists b in ZZ "such that" q = b/2^n}$

  Let $L={x in DD: 3x <= 1 }$.

  + Does $L$ have a largest element? Why or why not?
  + We want a sequence of $l_i in L$ that "converges to the maximum of $L$".

    What should "converges to the maximum of $L$" mean?

    Provide a formal definition and find such a sequence.

  + According to the "Archimedean understanding", what should $l_i$ converge to? (Hint: you can
    rewrite $l_i$ as a series, if needed.)

    Is your result in $DD$? Is this an issue?

  + Consider $S={q in QQ: q^2 <= 2}$. What number should a sequence that "converges to the maximum
    of $S$" converge to? Is your answer in $QQ$?

  + Let $A={x in RR: x <= "area under" 1-x^2}$. What should a sequence that "converges to the
    maximum of $A$" converge to? Is your answer in $RR$? Are you sure?
]

// Start of Week 4 (there was a snow day for 1 hour of class)

#slide(title: [Nested Interval Principle], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  Your textbook states:
  #defn[Nested Interval Principle][
    Given an increasing sequence $x_1 <= x_2<= x_3 <= dots.c$ and a decreasing sequence
    $y_1 >= y_2 >= y_3 >= dots.c$ such that $y_n$ is always larger than $x_n$ but the difference
    between $x_n$ and $y_n$ can be made arbitrarily small by taking $n$ sufficiently large, there
    exists _exactly one_ real number that is greater than or equal to every $x_n$ and less than or
    equal to every $y_n$.
  ]

  #colbreak()
  + Formally restate the Nested Interval Principle using quantifiers $forall$ and $exists$.
  + How does the nested interval principle apply to Archimedes' argument for area under $1-x^2$? Is
    it needed?
  + Leibnitz imagined than an infinitesimal $dif x$ satisfied $dif x > 0$ and
    $forall a in RR, a > 0 ==> dif x < a$.

    What does the Nested Interval Principle say about $dif x$?
]

// Ended Week 4 with this. It was really confusing. How exactly does the nested interval principle fit in?
#slide(title: [Putting it Together], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: 1em)


  #show: columns
  + Explain how every statement about a series can be converted into a statement about a sequence
    (and vice versa).
  + What should it mean for a _sequence_ to converge in the Archimedean sense?
  + Let $(q_i)_(i in NN)$ be a sequence. Suppose you have a decreasing sequence of upper bounds and
    an increasing sequence of lower bounds that get arbitrarily close to each other.

    Show that $(q_i)$ converges in the Archimedean sense.
  + We showed via many methods that $O=1-1+1-1+1- dots.c$ takes on the value $1/2$. Is this true in
    the Archimedean sense?
]

#slide(title: [Divergent to Infinity], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  + Come up with a formal definition of what it should mean for the series
    $t_0 + t_1 + t_2 + dots.c$ to be *divergent to infinity*.
]

#slide(title: [Geometric Series], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  A *geometric series* $a_0 + a_1+ a_2 + dots.c$ is a series where the ratio of successive terms is
  constant.

  Let $A$ be the series $a_0+a_1+a_2+dots.c$ with summands $(a_i)_(i in NN)$.

  + Formally define what it means for $A$ to be a _geometric_ series.
  + If $A$ is a geometric series, it can be defined using only $a_0$ and $a_1$. How?
  + Let $S_n = a_0 + a_1 + a_2 + dots.c + a_n$. Compute $S_n - a_1/a_0 S_n$ and use the result to
    find a formula for $S_n$.
  + Prove that if $a_1/a_0 in [0,1)$ then $A$ converges in the Archimedean sense.
]

#slide(title: [Taylor Series], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  A *power series about $x=0$* is a series of the form
  $
    a_0 + a_1 x + a_2 x^2 + dots.c
  $
  *Taylor series about $x=0$* is a power series where the coefficients are
  $
    a_n = (f^((n)) (0)) / n!
  $

  + Find the Taylor series about $x=0$ for $f(x)=1/(1-x)$.
  + Euler argued that $1/(1-x)$ and $1+x+x^2+x^3+ dots.c$ could be used interchangeably. When is
    this true in the Archimedean sense?
  + Famously, the Taylor series for $e^x$ is $1 + x + x^2/2! + x^3/3! + dots.c$.

    Fix $x=1/2$. Show that if the Taylor series converges at $x=1/2$, then it converges to a value
    less than $1/(1-1/2) = 2$.
  + Is the fact that the partial sums of $1 + (1/2) + (1/2)^2/2! + (1/2)^3/3! + dots.c$ are bounded
    above by $2$ enough to show that the series converges?
]

// Finished first hour of week 6
// They had lots of trouble with part 3. We'll get there eventually...
#slide(title: [Lagrange's Theorem], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)

  #show: columns
  #thm[Lagrange's Remainder Theorem][
    Let $f$ be infinitely differentiable. Let
    $
      E_n (x) = f(x) - (f(0) + f'(0)x + f''(0)x^2/2! \ + dots.c + f^((n-1))(0)x^(n-1)/(n-1)!) = f(x) - T_(n-1) (x).
    $
    Then there exists a $c$ in the interval between $0$ and $x$ such that
    $display(E_n (x) = f^((n))(c) x^n / n!)$
  ][]
  + Does Lagrange's Theorem state that $forall x, exists c$ or $exists c, forall x$?
  + Give upper and lower bounds on the difference between $e^(1/2)$ and the $(n-1)$#super[st] Taylor
    approximation (centered at $0$) to $e^x$ evaluated at $x=1/2$.
  + Prove that the Taylor series (centered at $0$) for $e^x$ converges when $x=1/2$ to $e^(1/2)$ in
    the Archimedean sense.
]

#slide(title: [Newton and Cauchy's Limits], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #show: columns
  #defn[Newton's Limit (paraphrased)][
    // Synthesized from https://hsm.stackexchange.com/questions/9580/what-was-the-notion-of-limit-that-newton-used
    // and https://en.wikipedia.org/wiki/History_of_calculus
    // Not _exactly_ what Newton said.
    The limit is the the _ultimate value_ of a process of motion as time continually approaches a
    given time. It is neither the value _before_ it arrives at its last time, _when_ the motion
    ceases, nor _after_, but at the very instant when it arrives.
  ]
  #defn[Cauchy's Limit][
    When the values successively attributed to the same variable approach indefinitely a fixed
    value, eventually differing from it by as little as one could wish, that fixed value is called
    the limit of all the others.
  ]
  + Newton and Cauchy both use the term "approach". Are they using it in the same way?
  + Does Newton provide a method for determining if a limit is achieved? If a limit is not achieved?

    Does Cauchy?
  + What does Cauchy mean by "successively attributed to the same variable"?
  + What would an "Archimedean" definition of limit look like?
  // + Rephrase Cauchy's definition using quantifiers.
]

#slide(title: [Modern Limits], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  #defn[Modern Limit][
    The function $f$ is said to have a _limit_ $L$ as $x$ approaches $a$ if for all $epsilon > 0$,
    there exists a $delta > 0$ such that for all $x$ satisfying
    $
      0 < |x - a| < delta,
    $
    we have
    $|f(x) - L| < epsilon.$

  ]
  + Does the modern definition of limit differ from the "Archimedean" definition? If so, how?
  + Does the modern definition of limit provide a method for determining if a limit is achieved? If
    a limit is not achieved?
  + What improvement's does the modern definition make compared to Cauchy's?
  + How does one prove a statement "for all" when quantifying over an infinite number of options?
  + Prove $display(lim_(x -> 2) 3x = 6)$.
]

// Finished in last hour of week 6.
#slide(title: [Derivatives], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  #defn[Cauchy's Derivative (modernized)][
    The _derivative_ of a function $f$ at a point $a$, denoted $f'(a)$, is a value such that for all
    $epsilon > 0$, there exists a $delta > 0$ such that for all $x$ satisfying
    $0 < |x - a| < delta$, we have
    $
      abs(f'(a) - (f(x) - f(a)) / (x - a)) < epsilon.
    $

  ]
  + How should we interpret the quantity $(f(x) - f(a)) / (x - a)$?
  + Can the definition be re-written in terms of limits?
  + Use the Cauchy's definition to prove that if $f(x)=x^2$, then $f'(3) = 6$.
]

// Started week 8, finished week 9.
#slide(title: [Problems with Derivatives], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  Recall Fourier's series:
  $
    F(x) = 4/pi [cos((pi x)/2) & - 1/3 cos((3 pi x)/2) \
                               & + 1/5 cos((5 pi x)/2) - dots.c]
  $
  Fourier claimed $F(x)=1$ for $x in (-1,1)$.
  + Assuming Fourier is right, what is $F'(0.5)$?
  + Find the derivative of Fourier's series (term by term). What is the limit of the result?
  + What went wrong? Can this be fixed by applying the Archimedean understanding?
]

#slide(title: [Mean Value Theorem], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  Cauchy wanted to prove Lagrange's Remainder Theorem. He first needed to prove the Mean Value
  Theorem.
  #thm[Mean Value Theorem 1][
    Let $f$ be continuous on $[a,b]$ and differentiable on $[a,b]$. Then there exists a $c in [a,b]$
    such that
    $
      f'(c) = (f(b) - f(a)) / (b - a).
    $
  ][]

  + Read through Cauchy's proof of the Mean Value Theorem. Are you convinced?
]

// Intermediate value property, then continuity, then sups and infs?

#slide(title: [Intermediate Value Property], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  #defn[Intermediate Value Property][
    A function $f: RR -> RR$ has the _intermediate value property_ if for all $a,b in RR$ and all
    $y$ between $f(a)$ and $f(b)$, there exists a $c in [a,b]$ such that $f(c) = y$.
  ]

  + Let $H(x)=cases(1 & "if" x >= 0, 0 & "otherwise")$. Does $H$ have the intermediate value
    property? Prove your answer.
  + Let $L(x)=2x$. Does $L$ have the intermediate value property? Prove your answer.
  + Let $s(x)=cases(1 & "if" x=0, sin(1/x) & "otherwise")$. Does $s$ have the intermediate value
    property? Prove your answer.
  + Does the intermediate value property match what you feel a "continuous" function should be?
]


#slide(title: [Continuity], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  #defn[Continuity A][
    $f$ is _continuous_ if a small change in the input produces a small change in the output.
  ]
  #defn[Continuity B][
    $f$ is _continuous_ if the change in output can be made as small as one wishes by making the
    change in input small.
  ]
  #defn[Continuity C][
    $f$ is _continuous_ at $a$ if $lim_(x-> a) f(x) =f(a)$.
  ]
  #colbreak()

  + Formalize definitions A, B, C (using quantifiers).
  + Are any of the definitions equivalent?
  + (Trivia) Do you know which definition is due to Bolzano and which is Cauchy's?
]

#slide(title: [Intermediate Value Theorem], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  #thm[Intermediate Value Theorem][
    If $f$ is continuous, then it has the intermediate value property.
  ][]

  Let $f$ be continuous. Fix $a<b$ and assume $f(a) < f(b)$. Let $c in [f(a), f(b)]$.

  + If we prove that there is an $x in [a,b]$ such that $f(x)=c$, will we have proved the
    intermediate value theorem? Does the assumption that $f(a) < f(b)$ matter?

  + Try to prove the intermediate value theorem.

  + Define $C^- = {x in [a,b]: f(x) <= c}$ and $C^+ = {x in [a,b]: f(x) >= c}$.

    Could either of $C^-$ or $C^+$ be empty?

    What can you say about $C^- union C^+$?
]

#slide(title: [Intermediate Value Theorem 2 (Cauchy's Proof)], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .83em)

  #show: columns
  Let $f$ be continuous. Fix $a<b$ and assume $f(a) < f(b)$. Let $c in [f(a), f(b)]$.

  Define $C^- = {x in [a,b]: f(x) <= c}$ and $C^+ = {x in [a,b]: f(x) >= c}$.

  // Assume there is no $x in [a,b]$ such that $f(x)=c$.

  + What does $C^- union C^+$ equal?
  + Split $[a,b]$ in half into $L_1 = [a, (a+b)/2]$ and $R_1 = [(a+b)/2, b]$.

    Claim: At least one of $L_1$ or $R_1$ intersects both $C^-$ and $C^+$.

    Do you believe the claim?
  + Let $I_1=L_1$ if $L_1$ intersects both $C^-$ and $C^+$ otherwise let $I_1=R_1$.

    Split $I_1$ in half into $L_2$ and $R_2$. One of these must intersect both $C^-$ and $C^+$. Let
    $I_2$ be that interval and continue the process.
  + Show there is a point $x_0 in [a,b]$ so that arbitrarily close to $x_0$ there are points in both
    $C^-$ and $C^+$.

    _Hint_: Find a way to use the nested interval property.

  + Show that $f(x_0)=c$.
]


#slide(title: [Sups & Infs], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  #defn[Supremum & Infimum][
    The _supremum_ of a non-empty, bounded set $X subset.eq RR$, written $sup X$, is the smallest
    number $s in RR$ that is an upper bound for $X$. That is,
    $s = min{s in RR: forall x in X, x <= s}$.

    The _infimum_ of a non-empty, bounded set $X subset.eq RR$, written $inf X$, is the largest
    number $i in RR$ that is a lower bound for $X$.
  ]

  + What is $sup {1,2,3}$?
  + What is $sup [0,5]$?
  + What is $sup [0,5)$?
  + What is $sup {1-1/n: n in NN}$?
  + Show that if $X$ is a set and $max X$ exists, then $max X = sup X$.
  + Does every non-empty bounded set have a supremum? Why or why not?
  + Does an empty set have a supremum? What about an unbounded set?
]

#slide(title: [Intermediate Value Theorem 3 (Bolzano's Proof)], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  Let $f$ be continuous. Fix $a<b$ and assume $f(a) < f(b)$. Let $c in [f(a), f(b)]$.

  Define $y= sup {x in [a,b]:forall t in [a,x], f(t) <= c}$

  + Does $y$ exist?
  + How would you explain $y$ in words?
  + What is $f(y)$? Prove your answer.
  + What proof of the intermediate value theorem do you like better?
]

#slide(title: [Extreme Value Theorem 1], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .77em)

  #show: columns
  #thm[][
    If $f$ is continuous on $[a,b]$, then $f$ is bounded on $[a,b]$.
  ][]

  + If we showed that a continuous function on $[a,b]$ were bounded above, would that be sufficient
    to prove the theorem?

    #colbreak()
    Let $f$ be continuous on $[a,b]$.

    Define $B= {x in [a,b]: f "is bounded above on" [a,x]}$.

    Let $y= sup B$.

  + Does $y$ exist?
  + Show that $B$ is an interval (with positive width).
  + If $y=b$, how can we complete the proof?
  + If $y < b$, how can we complete the proof?
  // Idea: use continuity at $y$ to extend the bound from on [a,y-delta/4] to [a,y+delta/4], contradicting the definition of $y$.
  + Where does the proof go wrong if we try to show a continuous function on $RR$ is bounded?
]

#slide(title: [Extreme Value Theorem 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .77em)

  #show: columns
  #thm[Extreme Value Theorem][
    If $f$ is continuous on $[a,b]$, then $f$ achieves its upper and lower bounds on $[a,b]$.
  ][]

  + Write down what it means for $f$ to "achieve its bounds" using quantifiers.
  + If we showed that a continuous function on $[a,b]$ achieves its maximum, would that be
    sufficient?

    #colbreak()
    Let $f$ be continuous on $[a,b]$. Let $g(x)=sup{f(t):t in [a,x]}$.

    Define $B= {x in [a,b]: g(x) = M}$.

    Let $y= inf B$.

  + Does $y$ exist?
  + Show that if $y < b$, then $f(y)=M$.
  + Show that if $x < y$, then $g(x) < g(y)$.
  + Show if $y=b$, then $f(y)=M$.
]

#slide(title: [Correct Mean Value Theorem Proof], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .77em)

  #show: columns
  #thm[Rolle's Theorem][
    If $f$ is continuous on $[a,b]$ and differentiable on $(a,b)$ and $f(a)=f(b)$, then there exists
    a $c in (a,b)$ such that $f'(c)=0$.
  ][]

  Assume $f$ satisfies the hypothesis of Rolle's theorem.

  Let $M=sup{f(x) : x in [a,b]}$ and $m=inf{f(x): x in [a,b]}$.

  Let $c in [a,b]$ be the smallest number in $[a,b]$ such that $f(c)=M$.

  + What is the smallest $M$ could be? What is the largest $m$ could be?
  + Must $c$ exist?
  + Complete the proof if $M=m$.
  + Without loss of generality, we may assume $f(a) < M$. Why?
  + Suppose $f(a) < M$. Show $c in (a,b)$.
  + Suppose $f(a) < M$. Show $(f(c+h)-f(c))/h <= 0$ for all $h>0$. _Hint_: use the fact that
    $f(c)=M$.
  + Suppose $f(a) < M$. Show $(f(c+h)-f(c))/h > 0$ for infinitely many small $h<0$. _Hint_: use the
    definition of $c$.
  + Show $f'(c)=0$.
  + Prove Rolle's theorem.
]

#slide(title: [Correct Mean Value Theorem Proof], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  #thm[Mean Value Theorem][
    If $f$ is continuous on $[a,b]$ and differentiable on $(a,b)$, then there exists a $c in (a,b)$
    such that $f'(c)=(f(b)-f(a))/(b-a)$.
  ][]

  Let $f$ satisfy the hypothesis of the theorem.

  + Can you apply Rolle's theorem? Could you apply Rolle's theorem to a modified version of $f$?
  + Prove the Mean Value Theorem.
]


#slide(title: [The Cauchy Criterion], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  For a sequence $(a_i)_(i in NN)$, define $S_m^n = sum_(i=m)^n a_i$.


  If $S_0^oo = sum_(i=0)^oo a_i$ is an infinite series, the *tail sums* of $S$ are
  $S_M^oo = sum_(i=M)^oo a_i$ where $M in NN$.

  + Show that if a series converges, then so do all its tail sums.
  + Show that if a tail sum of a series converges, then so does the original series.
  + Show that a series converges if and only if its tail sums can be made arbitrarily small by
    taking $N$ sufficiently large.

    #colbreak()
    Cauchy found a clever way of talking about tail sums. Let $S_0^n = sum_(i=0)^n a_i$. We say
    $S_0^n$ satisfies the *Cauchy Criterion* if for all $epsilon > 0$, there exists an $N$ such that
    for all $n,m > N$, we have
    $ abs(S_0^n - S_0^m) < epsilon. $
  + Show that being able to make tail sums arbitrarily small is equivalent to satisfying the Cauchy
    criterion.
]

#slide(title: [Absolute Convergence], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  Let $S_m^n = sum_(i=m)^n a_i$. Define $overline(S)_m^n = sum_(i=m)^n abs(a_i)$.

  We say $S_0^oo$ is *absolutely convergent* if $overline(S)_0^oo$ converges.

  + Write down what it would mean for the sequence $overline(S)_0^n$ to be Cauchy.
  + What is the relationship between $abs(S_m^n)$ and $overline(S)_m^n$? How do you know?
  + Show that if $overline(S)_0^n$ is Cauchy, then $S_0^n$ is Cauchy.
  + If $overline(S)_0^oo$ converges, must $S_0^oo$ converge?
  + If $S_0^oo$ converges, must $overline(S)_0^oo$ converge?

]

#slide(title: [Parenthesis & Rearrangements I], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #show: columns
  Consider the series $A$ given by $a_0+a_1+dots.c$ and $B$ given by $b_0 + b_1 + dots.c$ where
  $
    b_0 & = (a_0 + dots.c + a_(k_0)) \
    b_1 & = (a_(k_0+1) + dots.c + a_(k_1)) \
    b_2 & = ...
  $
  is formed by adding parenthesis to $A$.

  + Is $k_i >= i$ for all $i$? Why or why not?
  + Show if $A$ converges, then $B$ converges to the same value.
  + Is the converse true? If $B$ converges, does $A$ converge to the same value?

    #colbreak()

  + Suppose $a_i >= 0$ for all $i$ and that $A_0^n$ is bounded above. Does $A$ converge?

    _Hint_: think about $limsup A_0^n$.

  + Show if $overline(A)_0^n$ (the partial sums of $abs(a_i)$) is bounded above, then $A$ converges.

  + What is a _rearrangement_ of the series $A$? Write down a rigorous definition.
]

#slide(title: [Parenthesis & Rearrangements II], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #show: columns
  Let $A$ given by $a_0+a_1+dots.c$ be _absolutely convergent_. Let $k_n : NN -> NN$ be a bijection
  and let $B$ given by $a_(k_0) + a_(k_1) + dots.c$ be a rearrangement of $A$.

  Fix $epsilon> 0$ and fix $N$ such that $abs(overline(A)_N^oo) < epsilon$.

  + Does $N$ exist?

  + Let $N'$ be such that ${1,2,...,N} subset.eq {k_0, k_1, ..., k_(N')}$.

    Does $N'$ exist? Why or why not? What is its relationship to $N$?
  + Let $M = max{k_0, k_1, ..., k_(N')}$.

    What is the relationship between $N$ and $M$?
  + Fix $n > M$. Show that
    $
      B_0^n <= A_0^N + overline(A)_(N+1)^oo < A_0^N + epsilon.
    $
  + Find a suitable lower bound for $B_0^n$
  + Show that $B$ converges to the same value that $A$ converges to.
  + If the "absolutely convergent" assumption were dropped, would the result still hold?


]

#slide(title: [Absolute Convergence of Power Series], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  Let $P(x)=sum_(i=0)^oo a_i x^i$ be a power series.

  Suppose $P$ converges at $x$.

  + What can you say about the limit of $a_i x^i$? What about $abs(a_i x^i)$?

    We want to show that $P(x/2)$ converges _absolutely_.

  + What would it mean for $P(x/2)$ to converge absolutely according to the Cauchy criterion?
  + Fix $N_1$ large enough so that $i> N_1$ implies $abs(a_i x^i) < 1$. Use this to give an upper
    bound on on your sums from the previous part.
  + Show that $P(x/2)$ converges absolutely.
  + Show that $P(alpha x)$ converges absolutely for all $alpha in (-1,1)$.
  + Prove the a power series always converges on an _interval_ and that a power series converges
    absolutely on the interior of that interval.

]

#slide(title: [Saving Cauchy's Proof], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .77em)

  #show: columns
  #defn[Uniform Continuity][
    If $f$ is _uniformly continuous_ on the set $X subset.eq RR$ if for all $epsilon > 0$, there
    exists a $delta > 0$ such that for all $x in X$, if $abs(x - y) < delta$ and $y in X$, then
    $abs(f(x) - f(y)) < epsilon$.
  ]

  + What is the difference between uniform continuity and regular continuity?
  + Could Cauchy have used uniform continuity to save his proof of the Mean Value Theorem? If so,
    how?
]

#slide(title: [Uniform Continuity], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: 1em)

  #show: columns
  #thm[Uniform Continuity on a Closed Interval][
    If $f$ is continuous on $[a,b]$ then $f$ is uniformly continuous on $[a,b]$.
  ][]

  Let $f$ be a continuous function on $[a,b]$.

  Fix $epsilon > 0$. Let $delta_(epsilon,x)$ be a $delta$ that "works" at the point $x$ for the
  error bound $epsilon$.

  + Formally write out, what property does $delta_(epsilon,x)$ satisfy?

  + Show that for all $y in [a, a + delta_(epsilon/2,a) / 2]$, it is sufficient to let
    $delta_(epsilon,y) = delta_(epsilon/2,a) / 2$.
  +
]
