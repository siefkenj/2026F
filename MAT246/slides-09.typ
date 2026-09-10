#import "preamble.typ": *
#show: mat246-slides.with([Cardinality], sources: (ernst_textbook,))

// Covers textbook Chapter 9 (Cardinality).
//
// NOTE: the *Practicing Proofs* handouts (ElGarem, Gross, Matos Wiederhold,
// Yoshinobu) stop at §8.4 and contain nothing for Chapter 9. The problems in
// this deck are therefore taken from the textbook itself:
//   Dana C. Ernst, *An Introduction to Proof via Inquiry-Based Learning*,
//   CC BY-SA 4.0, https://danaernst.com/IBL-IntroToProof/IntroToProof.pdf


#slide(title: [Where We Are Going])[
  *Cardinality* is the formalization of "size" that survives contact with infinite sets.

  Everything rests on Chapter 8: we compare sets by asking which *functions* exist between them.

  - $"card"(A) = "card"(B)$ --- there is a *bijection* $A -> B$.
  - $"card"(A) <= "card"(B)$ --- there is an *injection* $A -> B$.

  Consequences that should bother you:
  - An infinite set can be in bijection with a *proper subset of itself*.
  - $QQ$ is countable; $RR$ is not.
  - There is no largest infinity.
]

// ---------------------------------------------------------------------------
// 9.1 Introduction to cardinality
// ---------------------------------------------------------------------------

#slide(title: [Same Cardinality])[
  #definition(title: [Definition 9.1])[
    Let $A$ and $B$ be sets. $A$ and $B$ have the *same cardinality* if there exists a *bijection*
    between $A$ and $B$. In this case we write $"card"(A) = "card"(B)$.
  ]

  Note we have *not* defined $"card"(A)$ on its own. The expression $"card"(A) = "card"(B)$ is a
  statement about the *existence of a function*, nothing more.

  Since $f$ is a bijection $A -> B$ exactly when $f^(-1)$ is a bijection $B -> A$, you may build
  whichever direction is easier. Often one direction is much easier than the other --- a limitation
  of the human mind rather than of the mathematics.
]

#exercise(
  title: [Cardinality --- Warm-Up Bijections],
  book: [Problem 9.6],
  goal: [In each case, build an explicit bijection and briefly justify that it is one.],
  num_prefix: auto,
)[
  Prove each of the following.

  + $"card"({a,b,c}) = "card"({x,y,z})$
  + $"card"(NN) = "card"({2n+1 | n in NN})$
  + $"card"(NN) = "card"(ZZ)$
  + $"card"((a,b)) = "card"((c,d))$, where $(a,b)$ and $(c,d)$ are intervals.

    _Hint: try a linear function $f: (a,b) -> (c,d)$. Draw a picture._
  + $"card"(NN) = "card"({1/2^n | n in NN})$
]

#exercise(
  title: [Cardinality --- Products and Functions],
  book: [Problems 9.7 and 9.9],
  goal: [Two short problems that will pay off later in the chapter.],
  num_prefix: auto,
)[
  + If $A$ is a set, do $A$ and $A times {x}$ have the same cardinality? Justify your answer.
  + Let $cal(F)$ denote the set of functions from $NN$ to ${0, 1}$.

    #enum(
      [Describe at least three functions in $cal(F)$.],
      [Prove that $cal(F)$ and $cal(P)(NN)$ have the same cardinality.

        _Hint: define $phi: cal(F) -> cal(P)(NN)$ so that $phi(f)$ is the subset of $NN$
        determined by where $f$ outputs a $1$._],
    )
]

#exercise(
  title: [Cardinality --- Dyck Paths],
  book: [Problem 9.8],
  goal: [A combinatorial bijection. Counting the same thing two ways is a proof technique in itself.],
  num_prefix: auto,
)[
  A *North-East lattice path* from $(0,0)$ to $(n,n)$ takes unit steps North or East. Let $D_n$ be
  the collection of such paths that never drop below the line $y = x$ --- these are called *Dyck
  paths*, after Walther von Dyck (1856--1934).

  A sequence of parentheses is *balanced* if there are equally many "(" and ")", and reading left to
  right there is never an excess of ")". For example $()()()$ and $()(())$ are balanced, while
  $())(()$ and $()(()($ are not. Let $B_n$ be the collection of balanced parenthesizations with $n$
  pairs, so
  $
    B_3 = {()()(), #h(.3em) ()(()), #h(.3em) (()()), #h(.3em) (())(), #h(.3em) ((()))}.
  $

  + Find all Dyck paths in $D_3$.
  + Prove that $"card"(D_n) = "card"(B_n)$.
]

#exercise(
  title: [Cardinality --- Basic Theorems],
  book: [Theorems 9.10, 9.12 and Corollary 9.11],
  goal: [The bookkeeping results. None should be surprising --- but each needs a bijection built.],
  num_prefix: auto,
)[
  Let $A$, $B$, $C$, $D$ be sets.

  + Prove that $"card"(A) = "card"(A)$.
  + Prove that if $"card"(A) = "card"(B)$ then $"card"(B) = "card"(A)$.
  + Prove that if $"card"(A) = "card"(B)$ and $"card"(B) = "card"(C)$ then
    $"card"(A) = "card"(C)$.
  + Conclude that "has the same cardinality as" is an *equivalence relation* on $cal(P)(X)$ for any
    set $X$.
  + Suppose $"card"(A) = "card"(C)$ and $"card"(B) = "card"(D)$. Prove that if $A, B$ are disjoint
    and $C, D$ are disjoint, then $"card"(A union B) = "card"(C union D)$.
  + With the same hypotheses, prove $"card"(A times B) = "card"(C times D)$.
]

#slide(title: [Comparing Cardinalities])[
  #definition(title: [Definitions 9.13 and 9.16])[
    If there is an *injective* function $A -> B$, we write $"card"(A) <= "card"(B)$.

    We write $"card"(A) < "card"(B)$ if $"card"(A) <= "card"(B)$ and
    $"card"(A) != "card"(B)$.
  ]

  *Warning.* $"card"(A) < "card"(B)$ is much stronger than "there is an injection $A -> B$ that is
  not surjective". It asserts that *every* injection $A -> B$ fails to be surjective.

  In general, statements of the form $"card"(A) != "card"(B)$ and $"card"(A) < "card"(B)$ are hard
  to prove.
]

#exercise(
  title: [Cardinality --- Comparison],
  book: [Theorem 9.14 and Problem 9.15],
  goal: [Practice the definition of $<=$ on cardinalities --- and see where finite intuition breaks.],
  num_prefix: auto,
)[
  Let $A$, $B$, $C$ be sets.

  + Prove that if $A subset B$, then $"card"(A) <= "card"(B)$.
  + Prove that if $"card"(A) <= "card"(B)$ and $"card"(B) <= "card"(C)$, then
    $"card"(A) <= "card"(C)$.
  + Prove that if $C subset A$ while $"card"(B) = "card"(C)$, then $"card"(B) <= "card"(A)$.
  + Provide an example of sets $A$, $B$ with $"card"(A) = "card"(B)$ *despite* the existence of an
    injective function $A -> B$ that is not surjective.
]

// ---------------------------------------------------------------------------
// 9.2 Finite sets
// ---------------------------------------------------------------------------

#slide(title: [Finite Sets])[
  #definition(title: [Definitions 9.17 and 9.18])[
    For each $n in NN$, define $[n] := {1, 2, dots, n}$.

    A set $A$ is *finite* if $A = emptyset$, or $"card"(A) = "card"([n])$ for some $n in NN$. We
    then say $A$ has *cardinality* $0$ or $n$, respectively.
  ]

  *Warning.* The notation $[n]$ looks exactly like our notation for equivalence classes. The
  concepts are unrelated; only context distinguishes them.
]

#exercise(
  title: [Finite Sets --- Basic Results],
  book: [Theorems 9.19--9.23],
  goal: [Do not forget to consider the empty set in each of these.],
  num_prefix: auto,
)[
  + Prove that if $A$ is finite and $"card"(A) = "card"(B)$, then $B$ is finite.
  + Prove that if $A$ has cardinality $n in NN union {0}$ and $x in.not A$, then $A union {x}$ is
    finite with cardinality $n + 1$.
  + Prove that for every $n in NN$, every subset of $[n]$ is finite. _(Consider induction.)_
  + Prove that if $A$ has cardinality $n in NN$, then for all $x in A$, $A without {x}$ is finite
    with cardinality $n - 1$.
  + Prove that every subset of a finite set is finite. In particular, if $A$ is finite then
    $"card"(B) < "card"(A)$ for every *proper* subset $B$ of $A$.

  Note that the last statement fails badly for infinite sets --- that failure is the subject of §9.3.
]

#exercise(
  title: [Finite Sets --- Unions and the Pigeonhole Principle],
  book: [Theorems 9.24 and 9.25],
  goal: [Induction is a sensible approach to the first; the second is surprisingly useful.],
  num_prefix: auto,
)[
  + Prove that if $A_1, A_2, dots, A_k$ is a finite collection of finite sets, then
    $display(union.big_(i=1)^k A_i)$ is finite.
  + *(Pigeonhole Principle.)* Prove that if $n, k in NN$ and $f: [n] -> [k]$ with $n > k$, then $f$
    is *not* injective.

  The name comes from the idea: if $n$ pigeons roost in a house with $k$ pigeonholes and $n > k$,
  then some hole contains more than one pigeon. (Note $n = 2$ is the smallest case that makes
  sense.)
]

// ---------------------------------------------------------------------------
// 9.3 Infinite sets
// ---------------------------------------------------------------------------

#slide(title: [Infinite Sets])[
  #definition(title: [Definition 9.26])[
    A set $A$ is *infinite* if $A$ is not finite.
  ]

  This tells us what infinite sets are *not*. A more useful picture: pick an element of $A$ and set
  it aside; call it the "first". Pick another; call it the "second". Continue. If $A$ is infinite,
  you never run out --- otherwise you would have built a bijection with some $[n]$.

  Theorem 9.31 will show that this picture, and the "bijection with a proper subset" picture, are
  both correct.
]

#exercise(
  title: [Infinite Sets --- First Results],
  book: [Theorems 9.27, 9.28 and Problem 9.29],
  goal: [Prove $NN$ is infinite, then bootstrap.],
  num_prefix: auto,
)[
  + Prove that $NN$ is infinite.

    _Hint: for contradiction, suppose there is a bijection $f: [n] -> NN$. What can you say about
    $m := max(f(1), f(2), dots, f(n)) + 1$?_
  + Prove that if $A$ is infinite and $"card"(A) = "card"(B)$, then $B$ is infinite.

    _Hint: try contradiction; you should end up composing two bijections $f: A -> B$ and
    $g: B -> [n]$._
  + Quickly verify that the following sets are infinite, appealing to the results above:
    the odd naturals; the even naturals; $ZZ$; ${1/2^n | n in NN}$; $NN times {a}$.
]

#exercise(
  title: [Infinite Sets --- The Infinite Hotel],
  book: [Problem 9.30],
  goal: [Hilbert's hotel, after David Hilbert (1862--1942).],
  num_prefix: auto,
)[
  The Infinite Hotel has rooms numbered $1, 2, 3, 4, dots$ Every room is currently occupied.

  + Is it possible to make room for one more guest (who wants a room to themselves)?
  + An infinite number of new guests $g_1, g_2, g_3, dots$ show up in the lobby, each demanding a
    room. Is it possible to accommodate them all, even though the hotel is already full?

  In both cases, describe your re-housing scheme precisely enough that it could be announced over
  the hotel intercom.
]

#exercise(
  title: [Infinite Sets --- Three Equivalent Characterizations],
  book: [Theorem 9.31],
  goal: [The central theorem of §9.3: infinite sets are exactly the ones that can be shrunk without loss.],
  num_prefix: auto,
)[
  #theorem(title: [9.31])[
    The following are equivalent for a set $A$:
    #enum(
      [$A$ is infinite;],
      [there exists an injective function $f: NN -> A$;],
      [$A$ can be put in bijection with a *proper* subset of itself.],
    )
  ]

  Prove it.

  _Hints: for (i) $==>$ (ii) construct $f$ recursively. For (ii) $==>$ (i) try contradiction. For
  (ii) $==>$ (iii), let $B = A without {f(1), f(2), dots}$ and put $A$ in bijection with
  $B union {f(2), f(3), dots}$. For (iii) $==>$ (ii), suppose $g: A -> C$ is a bijection onto a
  proper subset $C$, pick $a in A without C$, and define $f(n) = g^n (a)$._
]

#exercise(
  title: [Infinite Sets --- Consequences],
  book: [Corollaries 9.32--9.33],
  goal: [Two corollaries, and a question about what the proof quietly assumed.],
  num_prefix: auto,
)[
  + Did you use the *Axiom of Choice* in proving (i) $==>$ (ii) of Theorem 9.31? If so, where?
  + Prove that a set is infinite if and only if it has an infinite subset.
  + Prove that if $A$ is infinite, then $"card"(NN) <= "card"(A)$.
]

#exercise(
  title: [Infinite Sets --- Practice],
  book: [Problems 9.34 and 9.35],
  goal: [Use the new characterizations rather than the definition.],
  num_prefix: auto,
)[
  + Find a *new* proof that $NN$ is infinite, using (iii) $==>$ (i) of Theorem 9.31.
  + Quickly verify that each of the following is infinite, appealing to either Theorem 9.31
    ((ii) $==>$ (i)) or Corollary 9.32:

    #enum(
      [the odd naturals],
      [the even naturals],
      [$ZZ$],
      [$NN times NN$],
      [$QQ$],
      [$RR$],
      [the perfect squares in $NN$],
      [$(0,1)$],
      [$CC = {a + b i | a, b in RR}$],
    )
]

// ---------------------------------------------------------------------------
// 9.4 Countable sets
// ---------------------------------------------------------------------------

#slide(title: [Countable Sets])[
  #definition(title: [Definitions 9.36 and 9.37])[
    If $"card"(A) = "card"(NN)$, then $A$ is *denumerable* and has cardinality $aleph_0$ (read
    "aleph naught").

    A set is *countable* if it is finite or denumerable, and *uncountable* otherwise.
  ]

  A set of cardinality $1, 2, dots$ or $aleph_0$ is exactly one whose elements you can label
  "first", "second", "third", ... --- one you can *count*.
]

#exercise(
  title: [Countable --- Warm-Up],
  book: [Problem 9.38],
  goal: [Quickly justify countability, appealing to earlier problems. Which of these are denumerable?],
  num_prefix: auto,
)[
  + ${a, b, c}$
  + the odd natural numbers
  + the even natural numbers
  + ${1/2^n | n in NN}$
  + the perfect squares in $NN$
  + $ZZ$
  + $NN times {a}$
]

#exercise(
  title: [Countable --- Structural Results],
  book: [Theorems 9.39--9.43],
  goal: [The toolkit for recognizing countable sets.],
  num_prefix: auto,
)[
  + Prove that every infinite set contains a *denumerable* subset. _(Use Theorem 9.31 or Corollary
    9.33.)_
  + Prove that if $A$ is countable and $f: A -> B$ is a bijection, then $B$ is countable.
  + Prove that every subset of a countable set is countable. _(Consider the cases $A$ finite versus
    infinite; the contrapositive of Corollary 9.32 helps in the finite case.)_
  + Prove that a set is countable if and only if it has the same cardinality as some subset of
    $NN$.
  + Prove that if $f: NN -> A$ is surjective, then $A$ is countable.
]

#exercise(
  title: [Countable --- The Rationals],
  book: [Theorem 9.44],
  goal: [Perhaps the most counterintuitive result so far.],
  num_prefix: auto,
)[
  Prove that the set $QQ$ of rational numbers is *countable*.

  This may seem impossible: between any two distinct rationals there are infinitely many others
  (take repeated midpoints).

  #aside([One possible approach])[
    Make a table with column headings $0, 1, -1, 2, -2, dots$ and row headings $1, 2, 3, 4, 5, dots$
    The entry in column $m$, row $n$ is the fraction $m\/n$.

    Find a way to *zig-zag* through the table hitting every entry exactly once. This gives a
    bijection between $NN$ and the entries of the table. (Do you see why?)

    But every rational appears infinitely often in the table. Resolve this by appealing to Theorem
    9.41.
  ]
]

#exercise(
  title: [Countable --- Unions],
  book: [Theorems 9.45--9.47],
  goal: [Building up to: a countable union of countable sets is countable.],
  num_prefix: auto,
)[
  + Prove that if $A$ and $B$ are countable, then $A union B$ is countable.
  + Let ${A_n}_(n=1)^oo$ be a collection of sets. Define $B_1 := A_1$ and, for $n > 1$,
    $display(B_n := A_n without union.big_(i=1)^(n-1) A_i)$. Prove that ${B_n}_(n=1)^oo$ is
    pairwise disjoint and that
    $display(union.big_(n=1)^oo A_n = union.big_(n=1)^oo B_n)$.
  + Let $Delta$ be $NN$ or $[k]$ for some $k in NN$. Prove that if ${A_n}_(n in Delta)$ is a
    countable collection of countable sets, then $display(union.big_(n in Delta) A_n)$ is
    countable.
  + Did you use the Axiom of Choice in the previous part? If so, where?

  _For 3: the finite case follows from 1 by induction. For the infinite case, use 2 to get
  pairwise disjoint $B_n = {b_(n,1), b_(n,2), dots}$, then either build a bijection from $NN$ by
  zig-zagging, or define $f(b_(n,m)) = 2^n 3^m$, show it is injective, and appeal to Theorem 9.41.
  Try both._
]

#exercise(
  title: [Countable --- Products and Sequences],
  book: [Theorems 9.48--9.50],
  goal: [Three more constructions that stay inside the countable world.],
  num_prefix: auto,
)[
  + Prove that if $A$ and $B$ are countable, then $A times B$ is countable.
  + Prove that the set of all *finite* sequences of $0$'s and $1$'s (for example $0110010$) is
    countable.
  + Prove that the collection of all *finite* subsets of a countable set is countable.

  Keep the word *finite* in view --- it is exactly what makes these results true, as the next
  section shows.
]

// ---------------------------------------------------------------------------
// 9.5 Uncountable sets
// ---------------------------------------------------------------------------

#slide(title: [Uncountable Sets])[
  A set is *uncountable* if it is not countable. Since every finite set is countable, an uncountable
  set must be infinite --- so $A$ is uncountable exactly when there is *never* a bijection
  $NN -> A$.

  It is not even clear that uncountable sets exist! They do. Our first will be the interval $(0,1)$,
  via *Cantor's Diagonalization Argument*, after Georg Cantor (1845--1918).

  #v(.3em)
  *Standard decimal form.* A number $0.a_1 a_2 a_3 dots$ in $(0,1)$ is in *standard decimal form* if
  its expansion does not end in a repeating string of $9$'s. So $0.2$ is standard while
  $0.1overline(9)$ is not, even though they are the same number. Every real number has a *unique*
  standard decimal form; we take this for granted.
]

#exercise(
  title: [Uncountable --- Cantor's Diagonalization Argument],
  book: [Problem 9.51 and Theorem 9.52],
  goal: [The single most important argument in this chapter.],
  num_prefix: auto,
)[
  For contradiction, assume $(0,1)$ is countable, so there is a bijection $f: NN -> (0,1)$. Write
  $
    f(n) = 0.a_(1n) a_(2n) a_(3n) dots
  $
  in standard decimal form (padding with $0$'s if the expansion terminates). Now define
  $b = 0.b_1 b_2 b_3 dots$ where
  $
    b_i = cases(2 & "if" a_(i i) != 2, 3 & "if" a_(i i) = 2.)
  $

  + Prove that the expansion defining $b$ is in standard decimal form.
  + Prove that for all $n in NN$, $f(n) != b$.
  + Explain why $f$ cannot be surjective, and why this is a contradiction.

  You have just proved that the interval $(0,1)$ is *uncountable*.
]

#exercise(
  title: [Uncountable --- Propagating Uncountability],
  book: [Theorems 9.53, 9.55--9.59 and Corollary 9.54],
  goal: [Tools for finding more uncountable sets, now that we have one.],
  num_prefix: auto,
)[
  + Prove that if $A subset B$ and $A$ is uncountable, then $B$ is uncountable. _(Try
    contradiction, and look at Theorem 9.41.)_
  + Prove that if $A$ is uncountable and $B$ is countable, then $A without B$ is uncountable.
  + Prove that if $f: A -> B$ is injective and $A$ is uncountable, then $B$ is uncountable.
  + Prove that $RR$ is uncountable, and in fact $"card"((0,1)) = "card"(RR)$.

    _Hint: consider $f: (0,1) -> RR$ given by $f(x) = tan(pi x - pi/2)$._
  + Prove that if $a, b in RR$ with $a < b$, then $(a,b)$, $[a,b]$, $(a,b]$, and $[a,b)$ are all
    uncountable.
  + Prove that the set of irrational numbers is uncountable, and that $CC$ is uncountable.
]

#slide(title: [An Aside: The Continuum Hypothesis])[
  The *continuum hypothesis*, proposed by Cantor in 1878, states that there is *no* set whose
  cardinality lies strictly between that of $NN$ and that of $RR$.

  Cantor tried for years to prove it, without success.

  It follows from the work of Kurt Gödel (1906--1978) and Paul Cohen (1934--2007) that the continuum
  hypothesis and its negation are *independent* of the Zermelo--Fraenkel axioms: either one may be
  added as an axiom, and the result is consistent exactly when ZFC is.

  Nowadays most set theorists believe the continuum hypothesis should be *false*.
]

#exercise(
  title: [Uncountable --- True or False],
  book: [Problem 9.60],
  goal: [If a statement is true, prove it. Otherwise, give a counterexample.],
  num_prefix: auto,
)[
  Let $A$ and $B$ be sets with $A$ uncountable.

  + $A union B$ is uncountable.
  + $A inter B$ is uncountable.
  + $A times B$ is uncountable.
  + $A without B$ is uncountable.
]

#exercise(
  title: [Uncountable --- Infinite Binary Sequences],
  book: [Problem 9.61, Theorem 9.62 and Corollary 9.63],
  goal: [Compare with the _finite_ sequences of Theorem 9.49. One word changes everything.],
  num_prefix: auto,
)[
  Let $S$ be the set of *infinite* sequences of $0$'s and $1$'s.

  + Determine whether $S$ is countable or uncountable, and prove your answer. _(An approach
    similar to Cantor's Diagonalization Argument will help.)_
  + Prove that $"card"(cal(P)(NN)) = "card"(S)$.
  + Conclude that $cal(P)(NN)$ is uncountable.
]

#exercise(
  title: [Uncountable --- Cantor's Theorem],
  book: [Theorem 9.64],
  goal: [There is no largest infinity.],
  num_prefix: auto,
)[
  #theorem(title: [Cantor])[
    If $A$ is a set, then $"card"(A) < "card"(cal(P)(A))$.
  ]

  Prove it.

  _Hint: first exhibit an injective function $A -> cal(P)(A)$; this gives
  $"card"(A) <= "card"(cal(P)(A))$. For the strict inequality, argue by contradiction: assume
  $f: A -> cal(P)(A)$ is bijective and consider the set $B = {x in A | x in.not f(x)}$._

  #v(.4em)
  Notice $NN$ is countable while $cal(P)(NN)$ is uncountable. In fact
  $"card"(cal(P)(NN)) = "card"(RR)$ (stated without proof). Cantor's theorem says we can *always*
  climb higher: there are sets strictly bigger than $RR$, and no end to the tower.
]
