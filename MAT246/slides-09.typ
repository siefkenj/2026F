#import "preamble.typ": *
#show: mat246-slides.with([Cardinality], sources: (ernst_textbook,))

// Covers textbook Chapter 9 (Cardinality).
//
// NOTE: the *Practicing Proofs* handouts (ElGarem, Gross, Matos Wiederhold,
// Yoshinobu) stop at §8.4 and contain nothing for Chapter 9. The problems in
// this deck are therefore taken from the textbook itself:
//   Dana C. Ernst, *An Introduction to Proof via Inquiry-Based Learning*,
//   CC BY-SA 4.0, https://danaernst.com/IBL-IntroToProof/IntroToProof.pdf

// Restriction bar, e.g. `$f restrict_X$`. A plain `|` is barely taller than
// the letter beside it, so the subscript looks cramped.
#let restrict = math.class("normal", math.stretch(sym.bar.v, size: 140%))

#let line_number_proof(body) = {
  block(stroke: (paint: blue, thickness: 1pt, dash: "dashed"), inset: 1em, width: 100%)[
    #set enum(numbering: d => text(fill: blue.darken(50%))[(#d)#h(1em)])

    #body
  ]
}

#slide(title: [Where We Are Going])[
  *Cardinality* is the formalizes the "size" of a set, allowing infinite sets as well.

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
  #definition(title: [Definition 9.1])[
    Let $A$ and $B$ be sets. $A$ and $B$ have the *same cardinality* if there exists a *bijection*
    between $A$ and $B$. In this case we write $"card"(A) = "card"(B)$.
  ]

  + Based on Definition 9.1, does it make sense to say "$"card"({1,2,3})$" is three? Why or why not?
  Prove each of the following.
  2. $"card"({a,b,c}) = "card"({x,y,z})$
  + $"card"(NN) = "card"({2n+1 : n in NN})$
  + $"card"(NN) = "card"(ZZ)$
  + Let $I = (a,b) subset.eq RR$ and $J = (c,d) subset.eq RR$ be non-empty intervals for some
    $a,b,c,d in RR$.

    Then $"card"(I) = "card"(J)$.

  // _Hint: try a linear function $f: I -> J$. Draw a picture._
  // + $"card"(NN) = "card"({1/2^n : n in NN})$
]

#exercise(
  title: [Cardinality --- Products and Functions],
  book: [Problems 9.9],
  goal: [Two short problems that will pay off later in the chapter.],
  num_prefix: auto,
)[
  // + If $A$ is a set, do $A$ and $A times {x}$ have the same cardinality? Justify your answer.
  Let $cal(F)$ denote the set of functions from $NN$ to ${0, 1}$.

  + Describe at least three functions in $cal(F)$.,
  + Prove that $cal(F)$ and $cal(P)(NN)$ have the same cardinality.

  // _Hint: define $phi: cal(F) -> cal(P)(NN)$ so that $phi(f)$ is the subset of $NN$ determined by
  // where $f$ outputs a $1$._
]

// #exercise(
//   title: [Cardinality --- Dyck Paths],
//   book: [Problem 9.8],
//   goal: [A combinatorial bijection. Counting the same thing two ways is a proof technique in
//     itself.],
//   num_prefix: auto,
// )[
//   A *North-East lattice path* from $(0,0)$ to $(n,n)$ takes unit steps North or East. Let $D_n$ be
//   the collection of such paths that never drop below the line $y = x$ --- these are called *Dyck
//   paths*, after Walther von Dyck (1856--1934).

//   A sequence of parentheses is *balanced* if there are equally many "(" and ")", and reading left to
//   right there is never an excess of ")". For example $()()()$ and $()(())$ are balanced, while
//   $())(()$ and $()(()($ are not. Let $B_n$ be the collection of balanced parenthesizations with $n$
//   pairs, so
//   $
//     B_3 = {()()(), #h(.3em) ()(()), #h(.3em) (()()), #h(.3em) (())(), #h(.3em) ((()))}.
//   $

//   + Find all Dyck paths in $D_3$.
//   + Prove that $"card"(D_n) = "card"(B_n)$.
// ]

#exercise(
  title: [Cardinality --- Basic Theorems],
  book: [Theorems 9.10, 9.12 and Corollary 9.11],
  goal: [The bookkeeping results. None should be surprising --- but each needs a bijection built.],
  num_prefix: auto,
)[
  Let $A$, $B$, $C$ be non-empty sets.

  + Prove that $"card"(A) = "card"(A)$.
  + Prove that if $"card"(A) = "card"(B)$ then $"card"(B) = "card"(A)$.
  // + Prove that if $"card"(A) = "card"(B)$ and $"card"(B) = "card"(C)$ then $"card"(A) = "card"(C)$.
  + Show that "has the same cardinality as" is an *equivalence relation* on sets.
  + If $"card"(A) != "card"(B)$ could $A=B$?
  // + Suppose $"card"(A) = "card"(C)$ and $"card"(B) = "card"(D)$. Prove that if $A, B$ are disjoint
  //   and $C, D$ are disjoint, then $"card"(A union B) = "card"(C union D)$.
  // + With the same hypotheses, prove $"card"(A times B) = "card"(C times D)$.
]

#slide(title: [Comparing Cardinalities], num_prefix: auto)[
  #definition(title: [Definitions 9.13 and 9.16])[
    If there is a *one-to-one* function $phi:A -> B$, we write #box[$"card"(A) <= "card"(B)$].

    We write $"card"(A) < "card"(B)$ if $"card"(A) <= "card"(B)$ and $"card"(A) != "card"(B)$.
  ]

  Let $A= ZZ$ and $B = NN$.

  + Prove that $"card"(B) <= "card"(A)$.
  + Is it true that $"card"(B) < "card"(A)$? Why or why not?
  // + Create your own set $X$ such that $"card"(X) < "card"(A)$ and prove your answer.
]

// #exercise(
//   title: [Cardinality --- Comparison],
//   book: [Theorem 9.14 and Problem 9.15],
//   goal: [Practice the definition of $<=$ on cardinalities --- and see where finite intuition
//     breaks.],
//   num_prefix: auto,
// )[
//   Let $A$, $B$, $C$ be sets.

//   + Prove that if $A subset B$, then $"card"(A) <= "card"(B)$.
//   + Prove that if $"card"(A) <= "card"(B)$ and $"card"(B) <= "card"(C)$, then
//     $"card"(A) <= "card"(C)$.
//   + Prove that if $C subset A$ while $"card"(B) = "card"(C)$, then $"card"(B) <= "card"(A)$.
//   + Provide an example of sets $A$, $B$ with $"card"(A) = "card"(B)$ *despite* the existence of an
//     injective function $A -> B$ that is not surjective.
// ]

// ---------------------------------------------------------------------------
// 9.2 Finite sets
// ---------------------------------------------------------------------------

#slide(title: [Finite Sets], num_prefix: auto)[
  #definition(title: [Definitions 9.17 and 9.18])[
    For each $n in NN$, define $[n] := {1, 2, dots, n}$.

    A set $A$ is *finite* if $A = emptyset$, or $"card"(A) = "card"([n])$ for some $n in NN$. We
    then say $A$ has *cardinality* $0$ or $n$, respectively.
  ]

  #text(fill: orange.darken(30%))[*Warning.* The notation $[n]$ looks exactly like our notation for
    equivalence classes. The concepts are unrelated; we use context to distinguish them.]

  + Prove that the set #text(font: "DejaVu Sans")[${$#emoji.face.happy, #emoji.face.neutral,
      #emoji.face.frown$}$] is finite.
  + Prove that $"card"([1]) < "card"([2])$.
  + Prove that if $A$ is finite and $"card"(A) = "card"(B)$, then $B$ is finite.

  #theorem(title: "Pigeonhole Principle")[Let $a,b in NN$ with $a > b$ and let $f:[a] -> [b]$ be a
    function. Then, $f$ is not one-to-one.]

  4. Prove that $"card"([a]) < "card"([a+1])$ using the pigeonhole principle.

    How could you approach a proof without the pigeonhole principle?

  + Prove every subset of a finite set is finite.
]

// #exercise(
//   title: [Finite Sets --- Basic Results],
//   book: [Theorems 9.19--9.23],
//   goal: [Do not forget to consider the empty set in each of these.],
//   num_prefix: auto,
// )[
//   + Prove that if $A$ is finite and $"card"(A) = "card"(B)$, then $B$ is finite.
//   + Prove that if $A$ has cardinality $n in NN union {0}$ and $x in.not A$, then $A union {x}$ is
//     finite with cardinality $n + 1$.
//   + Prove that for every $n in NN$, every subset of $[n]$ is finite. _(Consider induction.)_
//   + Prove that if $A$ has cardinality $n in NN$, then for all $x in A$, $A without {x}$ is finite
//     with cardinality $n - 1$.
//   + Prove that every subset of a finite set is finite. In particular, if $A$ is finite then
//     $"card"(B) < "card"(A)$ for every *proper* subset $B$ of $A$.

//   Note that the last statement fails badly for infinite sets --- that failure is the subject of
//   §9.3.
// ]

// #exercise(
//   title: [Finite Sets --- Unions and the Pigeonhole Principle],
//   book: [Theorems 9.24 and 9.25],
//   goal: [Induction is a sensible approach to the first; the second is surprisingly useful.],
//   num_prefix: auto,
// )[
//   + Prove that if $A_1, A_2, dots, A_k$ is a finite collection of finite sets, then
//     $display(union.big_(i=1)^k A_i)$ is finite.
//   + *(Pigeonhole Principle.)* Prove that if $n, k in NN$ and $f: [n] -> [k]$ with $n > k$, then $f$
//     is *not* injective.

//   The name comes from the idea: if $n$ pigeons roost in a house with $k$ pigeonholes and $n > k$,
//   then some hole contains more than one pigeon. (Note $n = 2$ is the smallest case that makes
//   sense.)
// ]

// ---------------------------------------------------------------------------
// 9.3 Infinite sets
// ---------------------------------------------------------------------------

// #slide(title: [Infinite Sets])[
//   #definition(title: [Definition 9.26])[
//     A set $A$ is *infinite* if $A$ is not finite.
//   ]

//   This tells us what infinite sets are *not*. A more useful picture: pick an element of $A$ and set
//   it aside; call it the "first". Pick another; call it the "second". Continue. If $A$ is infinite,
//   you never run out --- otherwise you would have built a bijection with some $[n]$.

//   Theorem 9.31 will show that this picture, and the "bijection with a proper subset" picture, are
//   both correct.
// ]

#exercise(
  title: [Infinite Sets --- First Results],
  book: [Theorems 9.27, 9.28 and Problem 9.29],
  goal: [Prove $NN$ is infinite, then bootstrap.],
  num_prefix: auto,
)[
  #definition(title: [Definition 9.26])[
    A set $A$ is *infinite* if $A$ is not finite.
  ]

  + Prove that $NN$ is infinite.

    _Hint: for contradiction, suppose there is a bijection $f: [n] -> NN$. What can you say about
    $m := max(f(1), f(2), dots, f(n)) + 1$?_
  + Prove that if $A$ is infinite and $"card"(A) = "card"(B)$, then $B$ is infinite.

    _Hint: try contradiction; you should end up composing two bijections $f: A -> B$ and
    $g: B -> [n]$._
  + Quickly verify that the following sets are infinite (use the results you just proved):
    + the odd naturals
    + the even naturals
    + $ZZ$
    + ${1/2^n : n in NN}$
    + $NN times {a}$.
]

#exercise(
  title: [Infinite Sets --- The Infinite Hotel],
  book: [Problem 9.30],
  goal: [Hilbert's hotel, after David Hilbert (1862--1942).],
  num_prefix: auto,
)[
  Hilbert's Infinite Hotel has rooms numbered $1, 2, 3, 4, dots$ and every room is currently
  occupied.

  + Is it possible to make room for one more guest (who wants a room to themselves)?
  + An infinite number of new guests $g_1, g_2, g_3, dots$ show up in the lobby, each demanding a
    room. Is it possible to accommodate them all, even though the hotel is already full?

  In both cases, describe your re-housing scheme precisely enough that it could be announced over
  the hotel intercom.
]

// #exercise(
//   title: [Infinite Sets --- Three Equivalent Characterizations],
//   book: [Theorem 9.31],
//   goal: [The central theorem of §9.3: infinite sets are exactly the ones that can be shrunk without
//     loss.],
//   num_prefix: auto,
// )[
//   #theorem(title: [9.31])[
//     The following are equivalent for a set $A$:
//     #enum(
//       [$A$ is infinite;],
//       [there exists an injective function $f: NN -> A$;],
//       [$A$ can be put in bijection with a *proper* subset of itself.],
//     )
//   ]

//   Prove it.

//   _Hints: for (i) $==>$ (ii) construct $f$ recursively. For (ii) $==>$ (i) try contradiction. For
//   (ii) $==>$ (iii), let $B = A without {f(1), f(2), dots}$ and put $A$ in bijection with
//   $B union {f(2), f(3), dots}$. For (iii) $==>$ (ii), suppose $g: A -> C$ is a bijection onto a
//   proper subset $C$, pick $a in A without C$, and define $f(n) = g^n (a)$._
// ]

// #exercise(
//   title: [Infinite Sets --- Consequences],
//   book: [Corollaries 9.32--9.33],
//   goal: [Two corollaries, and a question about what the proof quietly assumed.],
//   num_prefix: auto,
// )[
//   + Did you use the *Axiom of Choice* in proving (i) $==>$ (ii) of Theorem 9.31? If so, where?
//   + Prove that a set is infinite if and only if it has an infinite subset.
//   + Prove that if $A$ is infinite, then $"card"(NN) <= "card"(A)$.
// ]

// #exercise(
//   title: [Infinite Sets --- Practice],
//   book: [Problems 9.34 and 9.35],
//   goal: [Use the new characterizations rather than the definition.],
//   num_prefix: auto,
// )[
//   + Find a *new* proof that $NN$ is infinite, using (iii) $==>$ (i) of Theorem 9.31.
//   + Quickly verify that each of the following is infinite, appealing to either Theorem 9.31 ((ii)
//     $==>$ (i)) or Corollary 9.32:

//     #enum(
//       [the odd naturals],
//       [the even naturals],
//       [$ZZ$],
//       [$NN times NN$],
//       [$QQ$],
//       [$RR$],
//       [the perfect squares in $NN$],
//       [$(0,1)$],
//       [$CC = {a + b i : a, b in RR}$],
//     )
// ]

// ---------------------------------------------------------------------------
// 9.4 Countable sets
// ---------------------------------------------------------------------------

#slide(title: [Countable Sets], num_prefix: auto)[
  #definition(title: [Definitions 9.36 and 9.37])[
    If $"card"(A) = "card"(NN)$, then $A$ is *denumerable* and has cardinality $aleph_0$ (read
    "aleph naught").

    A set is *countable* if it is finite or denumerable, and *uncountable* otherwise.
  ]

  #block(breakable: false, width: 100%)[
    + For each set, which descriptors apply?

    #align(center, table(
      columns: (auto, 7em, 7em, 7em, 7em),
      rows: 1.4em,
      align: center + horizon,
      stroke: none,
      ..range(4).map(x => table.vline(x: x + 1, stroke: .5pt)),
      table.header([Set], [Finite], [Infinite], [Denumerable], [Countable]),
      table.hline(stroke: .5pt),
      [${a, b, c}$], [], [], [], [],
      [$emptyset$], [], [], [], [],
      [$ZZ$], [], [], [], [],
      [$QQ$], [], [], [], [],
    ))
  ]
]


#exercise(
  title: [Countable --- A False Proof],
  goal: [Play the role of peer-reviewer.],
  num_prefix: auto,
)[
  Consider the following proof that the set $QQ^+$, the positive rationals, are *uncountable*.

  #line_number_proof[
    + Since $NN subset.eq QQ^+$ there is an injection from $NN$ to $QQ^+$, so $QQ^+$ is infinite.
    + Since $QQ^+$ is not finite, $QQ^+$ is countable only if there is a bijection from $NN$ to
      $QQ^+$.
    + Arrange $QQ^+$ in a table as follows:
      #block(breakable: false, width: 100%, align(center, text(size: .9em, table(
        columns: 5,
        inset: (x: .5em, y: .3em),
        align: center + horizon,
        stroke: none,
        table.vline(x: 1, stroke: .5pt),
        [], [$1$], [$2$], [$3$], [$dots$],
        table.hline(stroke: .5pt),
        [$1$], [$1\/1$], [$2\/1$], [$3\/1$], [$dots$],
        [$2$], [$1\/2$], [$2\/2$], [$3\/2$], [$dots$],
        [$dots.v$], [$dots.v$], [$dots.v$], [$dots.v$], [],
      ))))
    + Notice that the first row of the table is $1/1$, $2/1$, $3/1$, etc. has the cardinality of
      $NN$, so any injective function $f: NN -> QQ^+$ that outputs along the rows only covers
      fractions with denominator $1$.
    + Similarly, the first column of the table is $1/1$, $1/2$, $1/3$, etc. has the cardinality of
      $NN$, so any injective function $f: NN -> QQ^+$ that outputs along the columns only covers
      fractions with numerator $1$.

    + Since we cannot find an injective function $f : NN -> QQ^+$, it must be that $QQ^+$ is
      uncountable.
  ]
  + Is the proof correct? If not, fix it.
]

#exercise(
  title: [Countable Rationals],
  goal: [Play the role of peer-reviewer.],
  num_prefix: auto,
)[
  In the previous question, we proved that $QQ^+$ is countable.
  + Prove that $QQ$ is countable.
]

#exercise(
  title: [Decimals],
  num_prefix: auto,
)[
  Let $D:= {0,1,2,3,4,5,6,7,8,9}$ and define
  $D^n := underbrace(D times D times dots.c times D, n "times")$. Further, define $D^(aleph_0)$ to
  be the set of denumerable sequences of $D$.

  Let $I=[0,1] subset.eq RR$.

  + What is the cardinality of $D^n$?
  + Find an injection from $D^n$ to $I$. (_Hint: think about decimals!_)
  + Is there an injection from $I$ to $D^n$? How do you know?
  + Interpret $(d_1, d_2, d_3, ...) in D^(aleph_0)$ as an infinite decimal expansion
    $0.d_1 d_2 d_3 ...$. Does this define a function from $D^(aleph_0)$ to $I$? Why or why not?
  + Is the map you just defined injective? Why or why not?
  + Can you define an injective function from $I$ to $D^(aleph_0)$? How are you making sure your
    function is well defined?
  + Do you have enough information to argue $"card"(D^(aleph_0)) = "card"(I)$? Why or why not?

  #theorem(title: [Cantor--Bernstein])[Let $A$ and $B$ be sets. If $"card"(A) <= "card"(B)$ and
    $"card"(B) <= "card"(A)$, then $"card"(A) = "card"(B)$.]

  8. Can you use the Cantor--Bernstein theorem to argue that $"card"(D^(aleph_0)) = "card"(I)$? Why
    or why not?
]

#exercise(
  title: [Uncountable Sets?],
  num_prefix: auto,
)[
  #set text(size: 0.85em)
  Cantor opened the flood gates when he was the first to prove that there are infinite sets strictly
  bigger than countable! Let's see if we can find one.

  Let $B := {0, 1}$, and define $B^(aleph_0)$ to be the set of denumerable sequences of $0$'s and
  $1$'s.

  + Prove $"card"(B^(aleph_0)) >= "card"(NN)$.

  Next we will prove there is no bijection $phi: NN -> B^(aleph_0)$.

  #block(breakable: false, width: 100%, grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    align: horizon,
    [Suppose there is such a bijection. Use it to make the following table:],
    table(
      columns: 2,
      inset: (x: .8em, y: .35em),
      align: (center, left),
      stroke: none,
      table.vline(x: 1, stroke: .5pt),
      table.header([$n$], [$phi(n)$]),
      table.hline(stroke: .5pt),
      [$1$], [$b_(1,1) b_(1,2) b_(1,3) dots$],
      [$2$], [$b_(2,1) b_(2,2) b_(2,3) dots$],
      [$3$], [$b_(3,1) b_(3,2) b_(3,3) dots$],
      [$dots.v$], [$dots.v$],
    ),
  ))

  2. What does $b_(n,1)b_(n,2)b_(n,3)dots.c$ mean in the table?
  + Assume $phi$ is a bijection, does the table contain every element of $B^(aleph_0)$? Why or why
    not?
  Construct $c = c_1 c_2 c_3 dots.c$ as follows: $c_i = 1 - b_(i,i)$.
  4. Is $c in B^(aleph_0)$? Why or why not?
  + Is $c$ on the table? Write down the definition of what that means and then prove your answer.
  + What can you say about $"card"(B^(aleph_0))$?
]

#exercise(
  title: [Uncountable --- The Real Numbers],
  book: [Theorems 9.53, 9.55, and 9.56],
  goal: [Combine the previous two questions.],
  num_prefix: auto,
)[
  Let $I:= [0,1] subset.eq RR$ and let $D := {0, 1, 2, dots, 9}$, and define $D^(aleph_0)$ as in the
  previous questions.

  + Use a (Cantor) diagonal argument to show that $D^(aleph_0)$ is *uncountable* (i.e., is not
    countable).
  + Does the uncountability of $D^(aleph_0)$ imply the uncountability of $I$? What goes wrong?
  + Prove $I$ is uncountable. (_Hint: do you know of any other uncountable sets that won't have the
    $0.9999 dots.c=1.0000 dots.c$ problem?_)
  + Prove $RR$ is uncountable. (_Hint: can you find a bijection between $I$ and $RR$?_)
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

  + Prove that $"card"(NN) < "card"(cal(P)(NN))$. (_Hint: you've done all the work in previous
    questions_)

  Now let $A$ be any set. We will prove Cantor's theorem in steps.

  2. Prove $"card"(A) <= "card"(cal(P)(A))$.
  // + Prove Cantor's theorem if $"card"(A)$ is $0$ or $"card"(A) in NN$.

  We proceed by contradiction: suppose there exists $phi: A -> cal(P)(A)$ that is a bijection.
  3. Define $S := {x in A : x in.not f(x)}$. Explain why $S = f(a)$ for some $a in A$.
  + Fix such an $a$. Is $a in S$? Is $a in.not S$? Must one of those statements be true?
  + What can you say about $"card"(A)$ and $"card"(cal(P)(A))$?



  // #v(.4em)
  // Notice $NN$ is countable while $cal(P)(NN)$ is uncountable. In fact
  // $"card"(cal(P)(NN)) = "card"(RR)$ (stated without proof). Cantor's theorem says we can *always*
  // climb higher: there are sets strictly bigger than $RR$, and no end to the tower.
]

#slide(title: [How Many Infinities?], num_prefix: auto)[
  Cantor's theorem can be applied over and over again:
  $
    "card"(NN) < "card"(cal(P)(NN)) < "card"(cal(P)(cal(P)(NN))) < dots.c
  $

  + How many different sizes of infinity are there?
  + The *continuum hypothesis* states that there are no sets $X$ such that
    $ "card"(NN) < "card"(X) < "card"(RR). $

    Does Cantor's theorem prove the continuum hypothesis true or false? Neither?
  + Is there a *largest* infinity? That is, is there a set $X$ such that $"card"(A) <= "card"(X)$
    for every set $A$?

  How many cardinalities are there? Is there a cardinality for that?
  4. Suppose $S$ is a set containing a set of every cardinality, and let
    $U := union.big_(X in S) X$.
    #enum(
      numbering: "(a)",
      [Let $X in S$. Explain why $X subset.eq U$.],
      [Find an injective function $X -> U$. Conclude that $"card"(X) <= "card"(U)$.],
      [Use $cal(P)(U)$ and Cantor's theorem to reach a contradiction. What does this tell you?],
    )
]


// // // GOOD QUESTION IF THERE IS TIME
// #exercise(
//   title: [Countable Products],
//   book: [Problem 9.38],
//   goal: [Quickly justify countability, appealing to earlier problems. Which of these are
//     denumerable?],
//   num_prefix: auto,
// )[
//   + Let $A$ be a finite set. Prove that $A times A$ is finite.
//   + Let $B$ be a denumerable set. Prove that $B times B$ is denumerable.
//   + Let $X$ and $Y$ be countable sets. What can you say about $X times Y$?
// ]

// #exercise(
//   title: [Countable --- Structural Results],
//   book: [Theorems 9.39--9.43],
//   goal: [The toolkit for recognizing countable sets.],
//   num_prefix: auto,
// )[
//   + Prove that every infinite set contains a *denumerable* subset. _(Use Theorem 9.31 or Corollary
//     9.33.)_
//   + Prove that if $A$ is countable and $f: A -> B$ is a bijection, then $B$ is countable.
//   + Prove that every subset of a countable set is countable. _(Consider the cases $A$ finite versus
//     infinite; the contrapositive of Corollary 9.32 helps in the finite case.)_
//   + Prove that a set is countable if and only if it has the same cardinality as some subset of $NN$.
//   + Prove that if $f: NN -> A$ is surjective, then $A$ is countable.
// ]


// #exercise(
//   title: [Countable --- Unions],
//   book: [Theorems 9.45--9.47],
//   goal: [Building up to: a countable union of countable sets is countable.],
//   num_prefix: auto,
// )[
//   + Prove that if $A$ and $B$ are countable, then $A union B$ is countable.
//   + Let ${A_n}_(n=1)^oo$ be a collection of sets. Define $B_1 := A_1$ and, for $n > 1$,
//     $display(B_n := A_n without union.big_(i=1)^(n-1) A_i)$. Prove that ${B_n}_(n=1)^oo$ is pairwise
//     disjoint and that $display(union.big_(n=1)^oo A_n = union.big_(n=1)^oo B_n)$.
//   + Let $Delta$ be $NN$ or $[k]$ for some $k in NN$. Prove that if ${A_n}_(n in Delta)$ is a
//     countable collection of countable sets, then $display(union.big_(n in Delta) A_n)$ is countable.
//   + Did you use the Axiom of Choice in the previous part? If so, where?

//   _For 3: the finite case follows from 1 by induction. For the infinite case, use 2 to get pairwise
//   disjoint $B_n = {b_(n,1), b_(n,2), dots}$, then either build a bijection from $NN$ by zig-zagging,
//   or define $f(b_(n,m)) = 2^n 3^m$, show it is injective, and appeal to Theorem 9.41. Try both._
// ]


// #exercise(
//   title: [Countable --- Products and Sequences],
//   book: [Theorems 9.48--9.50],
//   goal: [Three more constructions that stay inside the countable world.],
//   num_prefix: auto,
// )[
//   + Prove that if $A$ and $B$ are countable, then $A times B$ is countable.
//   + Prove that the set of all *finite* sequences of $0$'s and $1$'s (for example $0110010$) is
//     countable.
//   + Prove that the collection of all *finite* subsets of a countable set is countable.

//   Keep the word *finite* in view --- it is exactly what makes these results true, as the next
//   section shows.
// ]

// ---------------------------------------------------------------------------
// 9.5 Uncountable sets
// ---------------------------------------------------------------------------

// #slide(title: [Uncountable Sets])[
//   A set is *uncountable* if it is not countable. Since every finite set is countable, an uncountable
//   set must be infinite --- so $A$ is uncountable exactly when there is *never* a bijection
//   $NN -> A$.

//   It is not even clear that uncountable sets exist! They do. Our first will be the interval $(0,1)$,
//   via *Cantor's Diagonalization Argument*, after Georg Cantor (1845--1918).

//   #v(.3em)
//   *Standard decimal form.* A number $0.a_1 a_2 a_3 dots$ in $(0,1)$ is in *standard decimal form* if
//   its expansion does not end in a repeating string of $9$'s. So $0.2$ is standard while
//   $0.1overline(9)$ is not, even though they are the same number. Every real number has a *unique*
//   standard decimal form; we take this for granted.
// ]

// #exercise(
//   title: [Uncountable --- Cantor's Diagonalization Argument],
//   book: [Problem 9.51 and Theorem 9.52],
//   goal: [The single most important argument in this chapter.],
//   num_prefix: auto,
// )[
//   For contradiction, assume $(0,1)$ is countable, so there is a bijection $f: NN -> (0,1)$. Write
//   $
//     f(n) = 0.a_(1n) a_(2n) a_(3n) dots
//   $
//   in standard decimal form (padding with $0$'s if the expansion terminates). Now define
//   $b = 0.b_1 b_2 b_3 dots$ where
//   $
//     b_i = cases(2 & "if" a_(i i) != 2, 3 & "if" a_(i i) = 2.)
//   $

//   + Prove that the expansion defining $b$ is in standard decimal form.
//   + Prove that for all $n in NN$, $f(n) != b$.
//   + Explain why $f$ cannot be surjective, and why this is a contradiction.

//   You have just proved that the interval $(0,1)$ is *uncountable*.
// ]

// #exercise(
//   title: [Uncountable --- Propagating Uncountability],
//   book: [Theorems 9.53, 9.55--9.59 and Corollary 9.54],
//   goal: [Tools for finding more uncountable sets, now that we have one.],
//   num_prefix: auto,
// )[
//   + Prove that if $A subset B$ and $A$ is uncountable, then $B$ is uncountable. _(Try contradiction,
//     and look at Theorem 9.41.)_
//   + Prove that if $A$ is uncountable and $B$ is countable, then $A without B$ is uncountable.
//   + Prove that if $f: A -> B$ is injective and $A$ is uncountable, then $B$ is uncountable.
//   + Prove that $RR$ is uncountable, and in fact $"card"((0,1)) = "card"(RR)$.

//     _Hint: consider $f: (0,1) -> RR$ given by $f(x) = tan(pi x - pi/2)$._
//   + Prove that if $a, b in RR$ with $a < b$, then $(a,b)$, $[a,b]$, $(a,b]$, and $[a,b)$ are all
//     uncountable.
//   + Prove that the set of irrational numbers is uncountable, and that $CC$ is uncountable.
// ]

// #slide(title: [An Aside: The Continuum Hypothesis])[
//   The *continuum hypothesis*, proposed by Cantor in 1878, states that there is *no* set whose
//   cardinality lies strictly between that of $NN$ and that of $RR$.

//   Cantor tried for years to prove it, without success.

//   It follows from the work of Kurt Gödel (1906--1978) and Paul Cohen (1934--2007) that the continuum
//   hypothesis and its negation are *independent* of the Zermelo--Fraenkel axioms: either one may be
//   added as an axiom, and the result is consistent exactly when ZFC is.

//   Nowadays most set theorists believe the continuum hypothesis should be *false*.
// ]

// #exercise(
//   title: [Uncountable --- True or False],
//   book: [Problem 9.60],
//   goal: [If a statement is true, prove it. Otherwise, give a counterexample.],
//   num_prefix: auto,
// )[
//   Let $A$ and $B$ be sets with $A$ uncountable.

//   + $A union B$ is uncountable.
//   + $A inter B$ is uncountable.
//   + $A times B$ is uncountable.
//   + $A without B$ is uncountable.
// ]

// #exercise(
//   title: [Uncountable --- Infinite Binary Sequences],
//   book: [Problem 9.61, Theorem 9.62 and Corollary 9.63],
//   goal: [Compare with the _finite_ sequences of Theorem 9.49. One word changes everything.],
//   num_prefix: auto,
// )[
//   Let $S$ be the set of *infinite* sequences of $0$'s and $1$'s.

//   + Determine whether $S$ is countable or uncountable, and prove your answer. _(An approach similar
//     to Cantor's Diagonalization Argument will help.)_
//   + Prove that $"card"(cal(P)(NN)) = "card"(S)$.
//   + Conclude that $cal(P)(NN)$ is uncountable.
// ]
