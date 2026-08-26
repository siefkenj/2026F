#import "preamble.typ": *
#show: mat246-slides.with([Functions], sources: (practicing_proofs,))

// Problems ported from *Practicing Proofs: MAT246 Handouts* (ElGarem, Gross,
// Matos Wiederhold, Yoshinobu; University of Toronto, 2025), CC BY-SA 4.0.
// https://danaernst.com/IBL-IntroToProof/PracticingProofs.pdf
//
// Covers textbook Chapter 8 (Introduction to Functions, Injective and
// Surjective Functions, Compositions and Inverses, Images and Preimages).
//
// Note: several of the handout's exercises refer to figures, which are images
// in the PDF. The digraphs and plots below are drawn here and are not
// pixel-copies of the handout's.


#slide(title: [Where We Are Going])[
  A *function* $f: X -> Y$ is a relation in which every element of $X$ is related to *exactly one*
  element of $Y$. Both halves of "exactly one" do work.

  - *Functions* --- what they are, and the many ways they fail to be.
  - *Injective, surjective, bijective* --- and what they say about the sizes of $X$ and $Y$.
  - *Composition and inverses* --- left inverses, right inverses, and when they coincide.
  - *Images and preimages* --- and why the preimage is much better behaved than the image.

  We finish with two theorems that set up Chapter 9: *Cantor's theorem* and
  *Cantor--Schröder--Bernstein*.
]

// ---------------------------------------------------------------------------
// 8.1 Introduction to functions (Practicing Proofs, Ch. 18)
// ---------------------------------------------------------------------------

#exercise(
  title: [Functions --- Non-Functions],
  source: 117,
  goal: [Non-examples show why each part of the definition matters.],
)[
  Determine why each of the following is *not* a function.

  #parts(
    [$f: {a,b,c,d} -> {1,2,3}$, $f = {(a,1), (b,2), (c,3)}$.],
    [$f: {a,b,c,d} -> {1,2,3}$, $f = {(a,1), (b,2), (c,3), (a,3), (b,1), (d,3)}$.],
    [$f: RR -> RR$, $f(x) = 1/x$.],
    [$f: NN -> NN$, $f(x) = sqrt(x)$.],
    [$f: RR -> RR$, $f(x) = sqrt(x)$.],
    [$f subset RR times RR$ defined by $(x, y) in f$ if and only if $x = abs(y)$.],
  )
]

#exercise(
  title: [Functions --- Construction],
  source: 118,
  goal: [Build your own examples and counterexamples: what does "every input has exactly one output" really mean?],
)[
  #parts(
    [List all relations from $A = {1}$ to $B = {a, b}$. Which are also functions?],
    [List all functions from $C = {1, 2}$ to $D = {a, b, c}$.],
    [Give two examples of functions from $E = {1,2,3}$ to $F = {a,b,c}$, and two examples of
      relations from $E$ to $F$ that are *not* functions.],
    [How many different functions are there from $E$ to $F$? Explain your reasoning.],
    [Suppose $M$, $N$ are finite sets with $m$ and $n$ elements. How many functions are there from
      $M$ to $N$? What about from $N$ to $M$?],
  )
]

#exercise(
  title: [Functions --- Is This a Function? (I)],
  source: 119,
  goal: [Functions come described as formulas, graphs, tables, or sets of pairs. Recognize them in every guise.],
)[
  Does each digraph below define a function from ${1, 2, 3}$ to ${1, 2, 3}$? Explain why or why not.

  #v(.5em)
  #align(center, grid(
    columns: 2,
    column-gutter: 4em,
    row-gutter: .4em,
    digraph(
      (("1", (0, 0)), ("2", (1.5, 0)), ("3", (3, 0))),
      edges: (("1", "2"), ("2", "3")),
      loops: ("3",),
      scale: 1.2,
    ),
    // Fanned out: laid in a row, the edge 1 -> 3 would pass straight through
    // node 2 and read as 1 -> 2 -> 3.
    digraph(
      (("1", (0, 0)), ("2", (1.6, .7)), ("3", (1.6, -.7))),
      edges: (("1", "2"), ("1", "3")),
      gap: 0,
      scale: 1.2,
    ),
    [(a)], [(b)],
  ))
]

#exercise(
  title: [Functions --- Is This a Function? (II)],
  source: 119,
  goal: [The same question, for a curve, a set-builder description, a formula, and a table.],
)[
  #parts(
    start: 3,
    [$R subset {1,2,3,4} times RR$, $R = {(1, pi), (3, 1), (4, ln 5)}$.],
    [$f: ZZ -> ZZ$, $f(x) = x^2 + 1$.],
    [The relation $[-1,1] times RR$ whose ordered pairs are the points of the unit circle
      $x^2 + y^2 = 1$, drawn over $x in [-1, 1]$.],
    [$S = {(x,y) in NN times NN : y = x + 1}$.],
    [$g: ZZ -> ZZ$, $g(n) = $ the number of digits in the decimal representation of $n$.],
    [The relation on ${1,2,3,4}$ given by the pairs $(x, y)$ in the table

      #align(center, table(
        columns: 5,
        [$x$], [$1$], [$2$], [$3$], [$4$],
        [$y$], [$1$], [$1$], [$2$], [$3$],
      ))],
  )
]

#exercise(
  title: [Functions --- Domain and Range],
  source: 120,
  goal: [Identify a function's domain and compute its range.],
)[
  Each of the following functions has $RR$ as its codomain. In each case, determine the *domain* and
  the *range*.

  #parts(
    [The function assigning to each nonnegative integer its last decimal digit.],
    [The function assigning to each letter in English its position in the alphabet.],
    [The function assigning to each pair of positive integers the maximum of the two.],
    [The function assigning to each finite string of $0$'s and $1$'s the number of times $0$
      appears.],
    [The function assigning to each real number its square.],
  )
]

#exercise(
  title: [Functions --- Codomain versus Range],
  source: 121,
  goal: [The codomain says where outputs _could_ live; the range says what actually appears.],
)[
  Let $f: RR -> RR$ be defined by $f(x) = x^2 + 1$, and let $g: RR -> [1, oo)$ be defined by
  $g(x) = x^2 + 1$.

  #parts(
    [State the domain, codomain, and range of $f$. Is the codomain of $f$ equal to its range? If
      not, give a value in one and not the other.],
    [State the domain, codomain, and range of $g$. Is the codomain of $g$ equal to its range? If
      not, give a value in one and not the other.],
    [Explain why it is possible for two functions to have exactly the same *rule* and still be
      *different functions*.],
  )
]

#exercise(
  title: [Functions --- Special Functions],
  source: 122,
  goal: [Inclusion, identity, and constant maps: three ways the domain and codomain shape a function.],
)[
  Let $A = {1,2,3,4}$ and $B = {0,1,2,3,4,5,6,7,8,9}$.

  #parts(
    [Explain why the *inclusion map* $iota: A -> B$, $iota(x) = x$, is a function from $A$ to $B$.
      What would go wrong if we tried to define $iota: B -> A$ by the same rule?],
    [How does the *identity map* $i_A : A -> A$ differ from $iota: A -> B$?],
    [Define the *constant function* $c: A -> B$ by $c(x) = 6$ for every $x in A$. State the domain,
      codomain, and range of $c$.],
    [Suppose we try to define $c: A -> NN$ by $c(x) = -1$. Would $c$ be well-defined? Why or why
      not?],
  )
]

#exercise(
  title: [Functions --- Piecewise-Defined Functions],
  source: 123,
  goal: [A piecewise rule defines a function only if the pieces neither overlap nor leave gaps.],
)[
  Consider the following rule for $f: RR -> RR$:
  $
    f(x) = cases(
      x       & "if" 0 < x <= 1,
      2x + 1  & "if" x >= 1,
      3x - 4  & "if" x < 0.
    )
  $

  #parts(
    [Compute $f(1)$ and $f(0)$ according to each applicable piece. Show explicitly how this leads to
      ambiguity.],
    [Revise the conditions in the definition of $f$ so that it becomes well-defined. Carefully
      explain how your changes achieve this.],
    [Suppose $h: A -> B$ is piecewise-defined by
      $h(x) = cases(b_1 & "if" x in A_1, b_2 & "if" x in A_2, b_3 & "if" x in A_3)$ where
      $b_1, b_2, b_3 in B$. What conditions on $A_1, A_2, A_3$ (or on $b_1, b_2, b_3$) must we check
      to ensure $h$ is well-defined?],
  )
]

#exercise(
  title: [Functions --- Ceiling and Floor],
  source: 124,
  goal: [Precise wording is what makes a rounding rule into a well-defined function.],
)[
  For a real number $x$,
  $
    ceil(x) &= "the least integer greater than or equal to" x, \
    floor(x) &= "the greatest integer less than or equal to" x.
  $

  #parts(
    [Compute $ceil(2.1)$, $floor(2.1)$, $ceil(-2.1)$, $floor(-2.1)$.],
    [Describe in words what each function does to a number.],
    [Draw the graphs of the ceiling and floor functions for $x in [-3, 3]$.],
    [What would go wrong if we defined the ceiling function by "$ceil(x) = $ *an* integer greater
      than or equal to $x$"?],
    [Prove that $r - floor(r) in [0, 1)$.],
    [Prove that any real number $r$ has a *unique* representation $r = n + theta$ with $n in ZZ$ and
      $theta in [0, 1)$.],
  )
]

#exercise(
  title: [Functions --- Functions and Equivalence Relations],
  source: 125,
  goal: [Operations on equivalence classes are a special case of functions defined via representatives.],
)[
  In each case, determine whether the function is *well-defined*. If it is, give a proof; if not, a
  counterexample.

  #parts(
    [Let $equiv_10$ on $ZZ$ be $x equiv_10 y <==> 10 divides (y - x)$. Let $f: ZZ\/equiv_10 -> ZZ$
      be $f([x]) = x$.],
    [Let $f: ZZ\/equiv_10 -> ZZ\/equiv_10$ be $f([x]) = [x]$.],
    [Let $f: ZZ\/equiv_10 -> ZZ$ be $f([x]) = $ the last decimal digit of $x$.],
    [Let $tilde.op$ on $RR times RR$ be $(x,y) tilde.op (x', y') <==> x = x'$. Let
      $f: (RR times RR)\/tilde.op -> RR$ be $f([(x,y)]) = x$.],
    [Same $tilde.op$; let $f: (RR times RR)\/tilde.op -> RR$ be $f([(x,y)]) = y$.],
    [Let $Z$ on $RR$ be $x Z y <==> y - x in ZZ$. Let $f: RR\/Z -> RR$ be
      $f([x]) = x - floor(x)$.],
  )
]

#exercise(
  title: [Functions --- More on Ceiling and Floor],
  source: 126,
  goal: [A bonus exercise on the subtle behaviour of $ceil(dot)$ and $floor(dot)$ under addition and scaling.],
)[
  Part (f) of the previous ceiling/floor exercise may be especially useful here.

  #parts(
    [For a real number $x$, prove that $display(floor(2x) = floor(x) + floor(x + 1/2))$.],
    [Prove or give a counterexample: for all $x, y in RR$, $ceil(x + y) = ceil(x) + ceil(y)$.],
    [Prove or give a counterexample: for all $x, y in RR$, $floor(x + y) = floor(x) + floor(y)$.],
    [Prove that for any $x in RR$,
      $
        ceil(x/2) + floor(x/2) = cases(
          floor(x) & "if" floor(x) "is odd",
          ceil(x)  & "if" floor(x) "is even."
        )
      $],
  )
]

// ---------------------------------------------------------------------------
// 8.2 Injective and surjective functions (Practicing Proofs, Ch. 19)
// ---------------------------------------------------------------------------

#slide(title: [Injective, Surjective, Bijective])[
  #definition(title: [Injective / Surjective / Bijective])[
    Let $f: X -> Y$.

    $f$ is *injective* if $f(x) = f(x') ==> x = x'$.

    $f$ is *surjective* if $forall y in Y, exists x in X, f(x) = y$.

    $f$ is *bijective* if it is both.
  ]

  These are the tools with which we will _compare the sizes_ of sets --- including infinite ones.
  Chapter 9 rests entirely on them.
]

#exercise(
  title: [Injectivity --- Basic Definitions],
  source: 127,
  goal: [Compare and contrast similar-sounding statements; construct examples and non-examples.],
)[
  Let $f: X -> Y$ be a function. For each condition below, determine whether it guarantees $f$ is
  injective, surjective, bijective, or none of these. If none, give an example where it fails.

  #parts(
    [For every $x in X$ there is some $y in Y$ with $f(x) = y$.],
    [For every $y in Y$ there is some $x in X$ with $f(x) = y$.],
    [$X = Y$.],
    [For every $x in X$ there is *exactly one* $y in Y$ with $f(x) = y$.],
    [For every $y in Y$ there is *exactly one* $x in X$ with $f(x) = y$.],
    [For all $x != x'$ in $X$, $f(x) != f(x')$.],
    [For all $y != y'$ in $Y$ there are $x != x'$ in $X$ with $f(x) = y$ and $f(x') = y'$.],
    [For all $x, x' in X$, if $f(x) = f(x')$ then $x = x'$.],
    [For all $x, x' in X$, $f(x) = f(x')$ if and only if $x = x'$.],
  )
]

#exercise(
  title: [Injectivity --- Classifying Functions],
  source: 128,
  goal: [Identify these properties in concrete functions.],
)[
  Determine, *with proof*, which of the following functions are injective, surjective, or bijective.

  #parts(
    [$f: RR -> RR$, $f(x) = 3x + 2$.],
    [$g: RR -> RR$, $g(x) = x^2$.],
    [$h: [0, oo) -> [0, oo)$, $h(x) = x^2$.],
    [$k: RR -> [0, oo)$, $k(x) = x^2$.],
    [$p: NN -> NN$, $p(n) = n + 1$.],
  )
]

#exercise(
  title: [Injectivity --- Piecewise-Defined Functions],
  source: 129,
  goal: [Which properties survive a piecewise construction?],
)[
  Let $A$, $B$, $C$, $D$ be sets with $A inter C = emptyset$. Let $f: A -> B$ and $g: C -> D$ be
  functions, and define $h: A union C -> B union D$ by
  $
    h(x) = cases(f(x) & "if" x in A, g(x) & "if" x in C.)
  $

  #parts(
    [Explain why $h$ is well-defined.],
    [Suppose $f$, $g$ are injective. Does it follow that $h$ is injective? Prove or give a
      counterexample.],
    [Suppose $f$, $g$ are surjective. Does it follow that $h$ is surjective? Prove or give a
      counterexample.],
    [Suppose $B inter D = emptyset$ and $f$, $g$ are bijective. Does it follow that $h$ is
      bijective? Prove or give a counterexample.],
  )
]

#exercise(
  title: [Injectivity --- Finite Sets],
  source: 130,
  goal: [Maps between sets carry information about their relative sizes. This is how we will _define_ size comparison for infinite sets.],
)[
  Let $m, n in NN$ and set $A = {1, 2, dots, n}$, $B = {1, 2, dots, m}$.

  #parts(
    [Suppose $n <= m$. Construct an injection $A -> B$.],
    [Suppose $n >= m$. Construct a surjection $A -> B$.],
    [Suppose $n = m$. Construct a bijection $A -> B$.],
    [Suppose $f: A -> B$ is a surjection. Prove that $n >= m$.],
    [Suppose $g: A -> B$ is an injection. Prove that $n <= m$.],
    [Suppose $h: A -> B$ is a bijection. Prove that $n = m$.],
    [Conclude that $n <= m$ iff there is an injection $A -> B$; $n >= m$ iff there is a surjection
      $A -> B$; and $n = m$ iff there is a bijection $A -> B$.],
  )

  The second half is a bit challenging --- consult the hints if you need to, but only after an
  honest try.
]

#exercise(
  title: [Injectivity --- Constructing a Bijection],
  source: 131,
  goal: [Even when you know a bijection must exist, finding one is not always trivial.],
)[
  Let $A = {1, dots, m}$ and $B = {1, dots, n}$. Since $abs(A times B) = m n$, the previous exercise
  guarantees a bijection $A times B -> {1, 2, dots, m n}$. Let us construct one.

  Arrange $A times B$ in an $m times n$ table and count the entries in reading order: $(1,1)$ is
  first, $(1,2)$ second, ..., $(1,n)$ is the $n$-th; then $(2,1)$ is the $(n+1)$-st, and so on.

  #parts(
    [Fix $1 <= r <= m$. Counting this way, what number is the *first* element in row $r$?],
    [Fix $1 <= k <= n$. What number is the element $(r, k)$?],
    [Construct a map $Phi: A times B -> {1, 2, dots, m n}$ matching $(r, k)$ to its "count".],
    [Prove that $Phi$ is injective.],
    [Prove that $Phi$ is surjective.],
  )
]

#exercise(
  title: [Injectivity --- Set Difference],
  source: 132,
  goal: [How injective maps interact with set operations. This foreshadows the image/preimage asymmetry.],
)[
  Let $f: X -> Y$ be a function. For $Z subset X$, write $f[Z] = {f(z) : z in Z}$ for the *image* of
  $Z$ under $f$.

  #parts(
    [Prove that for any $A, B subset X$, $f[A] without f[B] subset f[A without B]$.],
    [Give an example (specify $X$, $Y$, $f$, $A$, $B$) where
      $f[A] without f[B] != f[A without B]$.],
    [Prove that $f$ is *injective* if and only if $f[A without B] = f[A] without f[B]$ for all
      $A, B subset X$.],
  )
]

#exercise(
  title: [Injectivity --- Cantor's Theorem],
  source: 133,
  goal: [A refined version of Russell's Paradox --- and the source of infinitely many sizes of infinity.],
)[
  For a finite set $X$ with $abs(X) = n$ we know $abs(cal(P)(X)) = 2^n$. Since $2^n > n$, the
  previous exercises show there is no surjection $X -> cal(P)(X)$. We now extend this to *arbitrary*
  sets.

  Let $X$ be any set, and assume for contradiction there is a surjection $f: X -> cal(P)(X)$. For
  each $x in X$ the value $f(x)$ is a subset of $X$. Define
  $
    Y := {x in X : x in.not f(x)}.
  $

  Then $Y subset X$ (possibly empty). Argue that there is *no* $x in X$ with $f(x) = Y$,
  contradicting surjectivity of $f$.

  Conclude that there is no surjective map $X -> cal(P)(X)$, for any set $X$.
]

// ---------------------------------------------------------------------------
// 8.3 Compositions and inverses (Practicing Proofs, Ch. 20)
// ---------------------------------------------------------------------------

#exercise(
  title: [Composition --- Composing Functions],
  source: 134,
  goal: [Form and evaluate compositions in a variety of settings.],
)[
  Find the following compositions, if they exist. Do not forget to specify the domain and codomain.

  #parts(
    [$f: ZZ -> ZZ$, $f(x) = x + 2$ and $g: ZZ -> ZZ$, $g(x) = 3x^3$. Find $f compose g$ and
      $g compose f$.],
    [$f: ZZ_6 -> ZZ_6$, $f(x) = [x^2]_6$ and $g: ZZ_6 -> ZZ_6$, $g(x) = [3x]_6$. Compute
      $f compose g$ and $g compose f$.],
    [$g: ZZ -> RR$, $g(x) = x - 3$ and $f: (0, oo) -> RR$, $f(x) = sqrt(x)$. Find $f compose g$ and
      $g compose f$.],
    [$A = {a, b}$, $B = {1,2,3}$, $C = {x, y}$. Define $f: B -> C$ by $f(1) = x$, $f(2) = y$,
      $f(3) = y$; and $g: A -> B$ by $g(a) = 2$, $g(b) = 3$. Find $f compose g$ and
      $g compose f$.],
    [$f: ZZ_5 -> ZZ_2$, $f([x]_5) = [x+1]_2$ and $g: ZZ_2 -> ZZ_2$, $g([x]_2) = [x+1]_2$. Find
      $f compose g$ and $g compose f$.],
  )
]

#exercise(
  title: [Composition --- Order of Composition],
  source: 135,
  goal: [Commuting operators matter throughout mathematics and physics. Here: real affine maps.],
)[
  Let $f, g: RR -> RR$ be the affine functions $f(x) = a x + b$ and $g(x) = c x + d$, where
  $a, b, c, d in RR$ are fixed constants.

  #parts(
    [Give an example (find real numbers $a, b, c, d$) with $g compose f != f compose g$.],
    [Are there values of $a, b, c, d$ with $g compose f = f compose g$? If so, characterize them; if
      not, explain why not.],
    [Is there an affine function $h$ that commutes with *every* affine function, i.e.
      $h compose f = f compose h$ no matter the values of $a, b in RR$? If so, find all such $h$; if
      not, explain why not.],
  )
]

#exercise(
  title: [Composition --- Composition and Injectivity],
  source: 136,
  goal: [How information is lost or preserved under composition.],
)[
  Let $f: X -> Y$ and $g: Y -> Z$, so $g compose f: X -> Z$ is well-defined.

  #parts(
    [*(Theorem 8.60.)* Prove that if $f$ and $g$ are injective, then so is $g compose f$.],
    [Show the converse fails: if $g compose f$ is injective it does not follow that both $f$ and $g$
      are injective.],
    [Is it possible for *both* $f$ and $g$ to be non-injective while $g compose f$ is injective?],
    [Suppose $Z = X$ and $g compose f = i_X$, the identity on $X$. What must be true about $f$ and
      $g$?],
  )
]

#exercise(
  title: [Composition --- Composition and Surjectivity],
  source: 137,
  goal: [The companion questions for surjectivity.],
)[
  Let $f: X -> Y$ and $g: Y -> Z$, so $g compose f: X -> Z$ is well-defined.

  #parts(
    [*(Theorem 8.61.)* Prove that if $f$ and $g$ are surjective, then so is $g compose f$.],
    [Show the converse fails: if $g compose f$ is surjective it does not follow that both $f$ and
      $g$ are surjective.],
    [Is it possible for *both* $f$ and $g$ to be non-surjective while $g compose f$ is surjective?],
    [Suppose $Z = X$ and $g compose f = i_X$. What must be true about $f$ and $g$?],
  )
]

#exercise(
  title: [Composition --- Left- and Right-Inverses],
  source: 138,
  goal: [Connect the functional property (injective/surjective) with the algebraic one (one-sided inverses).],
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1.5em,
    table(
      columns: 5,
      align: center,
      [], [inj.], [surj.], [left inv.], [right inv.],
      [$f_1$], [], [], [], [],
      [$f_2$], [], [], [], [],
      [$f_3$], [], [], [], [],
      [$f_4$], [], [], [], [],
      [$f_5$], [], [], [], [],
    ),
    [
      $
        f_1 &: {1,2} -> {a,b,c},   & &f_1 (1) = a, f_1 (2) = b. \
        f_2 &: {1,2,3} -> {a,b},   & &f_2 (1) = a, f_2 (2) = a, f_2 (3) = b. \
        f_3 &: RR -> RR,           & &f_3 (x) = 2x + 1. \
        f_4 &: RR -> RR,           & &f_4 (x) = x^2. \
        f_5 &: ZZ_6 -> ZZ_6,       & &f_5 (x) = [3x]_6.
      $
    ],
  )

  #parts(
    [Complete the table.],
    [For each function that has a left-inverse or a right-inverse, compute them.],
    [Explain how to minimally modify the domain and/or codomain so that each function has a
      left-inverse and/or right-inverse --- or explain why no such modification is possible.],
  )
]

#exercise(
  title: [Composition --- The Inverse Relation],
  source: 139,
  goal: [Any relation can be inverted; each way the inverse fails to be a function constrains the original.],
)[
  Given a relation $R subset A times B$, the *inverse relation* $R^(-1) subset B times A$ is defined
  by $(b, a) in R^(-1) <==> (a, b) in R$.

  #parts(
    [Prove that $(R^(-1))^(-1) = R$ (a generalization of Theorem 8.81).],
    [Now suppose $R$ is a function. Suppose $R^(-1)$ fails to be a function because some $b in B$
      has *no* $a in A$ with $(b,a) in R^(-1)$. What does this tell us about $R$?],
    [Formulate and prove a necessary and sufficient condition on $R$ so that every $b in B$ has *at
      least one* such $a$.],
    [Suppose $R^(-1)$ fails to be a function because some $b in B$ has *two* elements
      $a, a' in A$ with $(b,a), (b,a') in R^(-1)$. What does this tell us about $R$?],
    [Formulate and prove a necessary and sufficient condition on $R$ so that every $b in B$ has *at
      most one* such $a$.],
    [Formulate and prove a necessary and sufficient condition on $R$ so that $R^(-1)$ is a
      function.],
  )
]

#exercise(
  title: [Composition --- Two-Sided Inverses],
  source: 140,
  goal: [One-sided inverses are usually not unique --- but a left and a right inverse must coincide.],
)[
  #parts(
    [Revisit $f_1 : {1,2} -> {a,b,c}$ with $f_1 (1) = a$, $f_1 (2) = b$. Construct two *distinct*
      left-inverses $g_1$ and $g_1'$ for $f_1$.],
    [Revisit $f_2 : {1,2,3} -> {a,b}$ with $f_2 (1) = a$, $f_2 (2) = a$, $f_2 (3) = b$. Construct
      two *distinct* right-inverses $g_2$ and $g_2'$ for $f_2$.],
    [Let $f: X -> Y$ have a left-inverse $g: Y -> X$ and a right-inverse $h: Y -> X$. Prove that
      $g = h$.],
    [Conclude that if $f$ has both a left- and a right-inverse, then it has a *unique* left inverse,
      a unique right inverse, and a unique two-sided inverse --- and all of these coincide. We may
      therefore write $f^(-1)$ with no ambiguity.],
    [*(Theorem 8.82.)* Suppose $f: X -> Y$ and $g: Y -> Z$ both have two-sided inverses. Prove that
      $g compose f$ does too, and that
      $(g compose f)^(-1) = f^(-1) compose g^(-1)$.],
  )
]

#exercise(
  title: [Composition --- Cantor--Schröder--Bernstein (I)],
  source: 141,
  goal: [If $X$ injects into $Y$ and $Y$ injects into $X$, there is a bijection. König's elegant proof --- take it slowly.],
)[
  Suppose $f: X -> Y$ and $g: Y -> X$ are both injective. Our goal is to build a bijection
  $h: X -> Y$.

  #parts(
    [Suppose $phi: A -> B$ is injective. Prove that for any $b in B$ the set $phi^(-1)({b})$
      contains either $0$ or $1$ element.],
  )

  The idea is to partition the domain and the codomain into three blocks each, then match the blocks
  up. Define two sequences of functions by $phi_0 = g$, $psi_0 = f$, and for $n in NN$,
  $
    phi_n &= cases(
      phi_(n-1) compose f & "if" n "is odd", phi_(n-1) compose g & "if" n "is even",
    ) \
    psi_n &= cases(
      psi_(n-1) compose g & "if" n "is odd", psi_(n-1) compose f & "if" n "is even".
    )
  $

  #parts(
    start: 2,
    [Use induction to prove that $phi_n$, $psi_n$ are well-defined injective functions for each
      $n in NN$.],
    [Prove that for each $n$ and each $x in X$, $phi_n^(-1)({x})$ has $0$ or $1$ element; similarly
      for $psi_n^(-1)({y})$, $y in Y$.],
    [Prove that for every $n in NN$, $f compose phi_(n-1) = psi_n$ and $g compose psi_(n-1) = phi_n$.],
  )
]

#exercise(
  title: [Composition --- Cantor--Schröder--Bernstein (II)],
  source: 141,
  goal: [Now build the three blocks and glue the bijection together.],
)[
  #parts(
    [Prove that $forall x in X, forall n in NN, (psi_(n-1)^(-1)({f(x)}) = phi_(n-1)^(-1)({x}))$.
      What is the analogous statement for $y in Y$?],
  )

  For $x in X$, write $n_x$ for the smallest $n in ZZ_(>=0)$ with $phi_n^(-1)({x}) = emptyset$,
  if such an $n$ exists. Now partition $X$ into
  $
    X_"no"   &:= {x in X : n_x "does not exist"}, \
    X_"odd"  &:= {x in X : n_x "is odd"}, \
    X_"even" &:= {x in X : n_x "is even"}.
  $
  The sets $Y_"no"$, $Y_"odd"$, $Y_"even"$ are defined analogously, with $psi$ in place of $phi$.

  #parts(
    start: 2,
    [Prove that $f(X_"no") = Y_"no"$, and that $f': X_"no" -> Y_"no"$ given by $f'(x) = f(x)$ is a
      bijection.],
    [Prove that $f(X_"even") = Y_"odd"$, and that $f'': X_"even" -> Y_"odd"$ given by
      $f''(x) = f(x)$ is a bijection.],
    [Prove that $g(Y_"even") = X_"odd"$, and that $g': X_"odd" -> Y_"even"$ given by
      $g'(x) = g^(-1)(x)$ is a bijection.],
    [Construct a bijection $h: X -> Y$.],
  )
]

// ---------------------------------------------------------------------------
// 8.4 Images and preimages (Practicing Proofs, Ch. 21)
// ---------------------------------------------------------------------------

#slide(title: [Images and Preimages])[
  For $f: X -> Y$, $A subset X$ and $S subset Y$:
  $
    f[A] := {f(a) : a in A} subset Y
    #h(2em)
    f^(-1)(S) := {x in X : f(x) in S} subset X.
  $

  Note that $f^(-1)(S)$ makes sense *whether or not $f$ is invertible*. The notation is overloaded
  and you must read it from context.

  The preimage commutes with $union$, $inter$, and complement. The image does *not* --- and exactly
  when it does turns out to characterize injectivity.
]

#exercise(
  title: [Preimages --- Notation],
  source: 142,
  goal: [The same notation gets used with different meanings. Guard against confusion.],
)[
  Let $f: RR -> RR$ be given by $f(x) = x^2$.

  Which of the following are defined, and what do they mean? If defined, compute it; if not, explain
  why not.

  #parts(
    [$f^(-1)(3)$],
    [$f^(-1)({3})$],
    [$f^(-1)({-3})$],
    [$f^(-1)(x)$],
    [$f^(-1)([0, 1])$],
  )
]

#exercise(
  title: [Preimages --- Images and Preimages],
  source: 143,
  goal: [Build intuition for how functions transform subsets of the domain and codomain.],
)[
  #parts(
    [Let $S = {-1, 0, 2, 4, 7}$. Find $f(S)$ if
      #enum(
        [$f: RR -> RR$, $f(x) = 1$.],
        [$f: RR -> RR$, $f(x) = 2x + 1$.],
        [$f: S -> ZZ$ is the inclusion $iota: S -> ZZ$.],
        [$f: RR -> RR$, $f(x) = ceil(x/5)$.],
      )],
    [Let $f: RR -> RR$, $f(x) = 2x$. What is $f(S)$ if
      #enum(
        [$S = {-2, -1, 0, 1/2, 5/6, pi}$],
        [$S = NN$],
        [$S = ZZ$],
        [$S = RR$],
      )],
    [Let $f: RR -> RR$, $f(x) = abs(x)$. Find
      #enum(
        [$f^(-1)({4})$],
        [$f^(-1)([2, 8])$],
        [$f^(-1)(ZZ)$],
        [$f^(-1)((-oo, 0])$],
      )],
  )
]

#exercise(
  title: [Preimages --- Preimages and Complements],
  source: 144,
  goal: [The logical structure of preimages and set operations. See also Problem 8.89 in the text.],
)[
  Let $f: X -> Y$ be a function and $S subset Y$.

  #parts(
    [Write out the definitions of $f^(-1)(S)$ and $S^c$ symbolically, as logical statements about
      elements.],
    [Using these definitions, prove that
      $
        f^(-1)(S^c) = (f^(-1)(S))^c.
      $],
    [Express this equality in words: how do complements behave under preimages?],
  )
]

#exercise(
  title: [Preimages --- Images of Intersections],
  source: 145,
  goal: [An important connection between properties of functions and operations on sets.],
)[
  Let $f: X -> Y$ be arbitrary and $A, B subset X$.

  #parts(
    [Show that $f(A inter B) subset f(A) inter f(B)$.],
    [Give an example where equality holds, and an example where it fails.],
    [Find a *sufficient* condition on $f$ guaranteeing $f(A inter B) = f(A) inter f(B)$.],
    [Prove your condition is also *necessary*: if $f(A inter B) = f(A) inter f(B)$ for all
      $A, B subset X$, then $f$ must be ... ?],
  )
]

#exercise(
  title: [Preimages --- The Characteristic Function],
  source: 146,
  goal: [A bridge between set theory and algebra: set operations become arithmetic formulas.],
)[
  Fix a universal set $U$. Each $S subset U$ defines a *characteristic function*
  $chi_S : U -> {0, 1}$ by
  $
    chi_S (x) = cases(1 & "if" x in S, 0 & "if" x in.not S.)
  $

  #parts(
    [What is the range of $chi_(emptyset)$? Of $chi_U$? What about $chi_S$ for
      $emptyset psubset S psubset U$?],
    [Fix $S subset U$. Find the preimage under $chi_S$ of each subset of ${0, 1}$: that is,
      determine $chi_S^(-1)({1})$, $chi_S^(-1)({0})$, $chi_S^(-1)({0,1})$,
      $chi_S^(-1)(emptyset)$.],
    [Prove that for any $S subset U$ we have $(chi_S)^2 = chi_S$.],
    [$chi_(A inter B) = chi_A dot chi_B$.],
    [$chi_(A union B) = chi_A + chi_B - chi_A dot chi_B$.],
    [$chi_(A^c) = 1 - chi_A$.],
    [Using the above, express $chi_(A symdiff B)$ in terms of $chi_A$ and $chi_B$, where
      $A symdiff B = (A union B) without (A inter B)$.],
  )

  Parts (d)--(f) are to be shown for all $A, B subset U$.
]

#exercise(
  title: [Preimages --- The Characteristic Function of $ZZ$],
  source: 147,
  goal: [Describe $chi_(ZZ) : RR -> {0,1}$ using only floor, ceiling, and algebra.],
)[
  Recall $floor(x)$ is the greatest integer $<= x$ and $ceil(x)$ the least integer $>= x$.

  #parts(
    [Suppose $x in ZZ$. What is $floor(x)$? What about $ceil(x)$?],
    [Prove that $floor(x) <= ceil(x)$.],
    [When does equality hold? Formulate and prove necessary and sufficient conditions.],
    [Prove that if equality does not hold, then $floor(x)$ and $ceil(x)$ are *consecutive*
      integers.],
    [Express $chi_(ZZ) : RR -> {0,1}$ using only the ceiling and floor functions (and algebra),
      where $chi_(ZZ)(x) = 1$ if $x in ZZ$ and $0$ otherwise.],
  )
]

#exercise(
  title: [Preimages --- Functions, Preimages, and Partitions],
  source: 148,
  goal: [Every function partitions its domain. Make the connection explicit.],
)[
  Let $f: X -> Y$ be a function.

  #parts(
    [Prove that distinct values have disjoint preimages: if $y_1 != y_2$ in $Y$, then
      $f^(-1)({y_1}) inter f^(-1)({y_2}) = emptyset$.],
    [Show that $display(X = union.big_(y in Y) f^(-1)({y}))$.],
    [Does the collection ${f^(-1)({y}) | y in Y}$ form a *partition* of $X$? If so, prove it; if
      not, formulate a related correct statement and prove that.],
    [Suppose $f: RR -> ZZ$ is the floor function $f(x) = floor(x)$. Describe in detail the
      collection of preimages.],
  )
]
