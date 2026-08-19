#import "preamble.typ": *
#show: mat246-theme.with([Set Theory])

// Problems ported from *Practicing Proofs: MAT246 Handouts* (ElGarem, Gross,
// Matos Wiederhold, Yoshinobu; University of Toronto, 2025), CC BY-SA 4.0.
// https://danaernst.com/IBL-IntroToProof/PracticingProofs.pdf
//
// Covers textbook Chapter 3 (Sets, Russell's Paradox, Power Sets, Indexing
// Sets, Cartesian Products).

#title-slide()

#slide(title: [Where We Are Going])[
  Sets are the raw material out of which the rest of mathematics is built. In this chapter:

  - *Sets and set operations* --- and how to prove two sets are equal.
  - *Russell's paradox* --- why "the set of all sets" is not allowed.
  - *Power sets* --- sets whose elements are themselves sets.
  - *Indexed families* --- unions and intersections over arbitrary index sets.
  - *Cartesian products* --- ordered pairs, and how $times$ interacts with everything else.

  Watch the distinction between $in$ and $subset$. It is the single most common source of errors in
  this chapter.
]

// ---------------------------------------------------------------------------
// 3.1 Sets (Practicing Proofs, Ch. 6)
// ---------------------------------------------------------------------------

#exercise(
  title: [Sets --- Set-Builder Notation],
  source: 29,
  goal: [Practice _packing_ sets into a rule and _unpacking_ them into a list.],
)[
  #parts(
    [List the elements of the set ${n in NN | n < 5}$.],
    [List the elements of the set ${x in ZZ | -2 < x <= 2}$.],
    [Express the set ${dots, -4, -2, 0, 2, 4, dots}$ in set-builder notation.],
    [Express the interval $(2, 5]$ in set-builder notation.],
  )
]

#exercise(
  title: [Sets --- Subsets],
  source: 30,
  goal: [The definition of a subset, and how to decide whether one set is a subset of another.],
)[
  #parts(
    [For each pair, decide whether $A_i subset B_i$:
      $
        A_1 &= {1, 2, 3},   & B_1 &= {1, 2, 3, 4}, \
        A_2 &= {1, 3, 5},   & B_2 &= {2, 4, 6},    \
        A_3 &= {{1}},       & B_3 &= {1, {1}}.
      $],
    [Give an example of sets $A$ and $B$ with $A psubset B$.],
    [Show that $emptyset subset A$ for every set $A$.],
    threshold: 3,
  )
]

#exercise(
  title: [Sets --- Set Equality],
  source: 31,
  goal: [Prove equality from the definition rather than by listing elements --- a habit that pays off later.],
)[
  Use the definition of set equality via *double subset inclusion* to prove that
  $
    {1, 2} = {x in RR | x^2 - 3 x + 2 = 0}.
  $

  That is: show every element of the left-hand set lies in the right-hand set, and vice versa.
]

#exercise(
  title: [Sets --- Set Operations],
  source: 32,
  goal: [Compute unions, intersections, differences, and complements straight from the definitions.],
  size: .95em,
)[
  Let $A = {1, 2, 3}$ and $B = {2, 3, 4}$ be sets in the universe $U = {1, 2, 3, 4, 5}$. Compute the
  following (no proof needed --- just state your answer):

  #parts(
    [$A union B$], [$A inter B$], [$A without B$], [$B without A$],
    [$A^c$], [$(A^c)^c$], [$B^c$], [$(A union B)^c$],
    [$A^c inter B^c$], [$(A inter B)^c$], [$A^c union B^c$],
  )

  Are $A$ and $B$ disjoint? Are $A$ and $B without A$ disjoint?
]

#exercise(
  title: [Sets --- The Empty Set],
  source: 33,
  goal: [How the empty set interacts with unions, intersections, and complements.],
)[
  Prove that for a set $A$ in the universe $U$:

  #parts(
    [$A union emptyset = A$],
    [$A inter emptyset = emptyset$],
    [$emptyset^c = U$],
  )
]

#exercise(
  title: [Sets --- Properties of Set Operations],
  source: 34,
  goal: [Some parts ask for an example (which does _not_ prove the statement); others ask for a full proof.],
  size: .95em,
)[
  #parts(
    [*(Transitivity of Subsets, Thm 3.10.)* Prove that if $A subset B$ and $B subset C$, then
      $A subset C$.],
    [*(Distribution, Thm 3.22.)* Verify with a concrete example of sets $A$, $B$, $C$ that
      #enum(
        [$A inter (B union C) = (A inter B) union (A inter C)$, and],
        [$A union (B inter C) = (A union B) inter (A union C)$.],
      )],
    [Show union is associative: $A union (B union C) = (A union B) union C$.],
    [Show intersection is associative: $A inter (B inter C) = (A inter B) inter C$.],
    [Show that for any set $A$ in a universe $U$, $(A^c)^c = A$.],
    threshold: 2,
  )
]

#exercise(
  title: [Sets --- Subset Equivalences],
  source: 35,
  goal: [Connect the definition of subset with two equivalent conditions on unions and intersections.],
)[
  Show that
  $
    A subset B #h(1em) &<==> #h(1em) A union B = B,
  $
  and that
  $
    A subset B #h(1em) &<==> #h(1em) A inter B = A.
  $
]

#exercise(
  title: [Sets --- Set Equalities],
  source: 36,
  goal: [Translate between set operations and their complements.],
)[
  Let $A$ and $B$ be arbitrary sets in the universe $U$. Prove each of the following.

  #parts(
    [$U^c = emptyset$],
    [$A inter A^c = emptyset$],
    [$A union A^c = U$],
    [*(De Morgan)* $(A union B)^c = A^c inter B^c$],
    [*(De Morgan)* $(A inter B)^c = A^c union B^c$],
  )
]

#exercise(
  title: [Sets --- Union-Complement Form],
  source: 37,
  goal: [Practice rewriting set expressions in different forms.],
)[
  Express the following using *only* unions and complements:

  #parts(
    [$A without (B inter C)$],
    [$(A without B) inter (C without D)$],
  )
]

#exercise(
  title: [Sets --- Symmetric Difference],
  source: 38,
  goal: [Meeting a new definition: start from what you know, then build intuition with examples and non-examples.],
  size: .95em,
)[
  Define $A symdiff B := (A without B) union (B without A)$.

  #parts(
    [Compute $A symdiff B$ for $A = {1, 2, 3}$, $B = {3, 4, 5}$.],
    [Compute $B symdiff A$ for the same sets.],
    [Show $symdiff$ is commutative: for any sets $A$ and $B$, $A symdiff B = B symdiff A$.],
    [Explain in words which elements are contained in $A symdiff B$.],
    [Show that $A symdiff B = (A union B) without (A inter B)$.],
  )
]

// ---------------------------------------------------------------------------
// 3.3 Power sets (Practicing Proofs, Ch. 7)
// ---------------------------------------------------------------------------

#slide(title: [Power Sets])[
  #defn[Power Set][
    If $S$ is a set, then the *power set* of $S$, denoted $cal(P)(S)$, is the set of subsets of $S$.
  ]

  The elements of $cal(P)(S)$ are *sets*, not elements of $S$. So
  $
    X in cal(P)(S) #h(1em) <==> #h(1em) X subset S.
  $

  Getting this equivalence into your fingers is most of the work in this section.
]

#exercise(
  title: [Power Sets --- Definition],
  source: 39,
  goal: [Practice the distinction between _elements_ and _subsets_.],
  size: .95em,
)[
  Consider the set $A = {1, 2}$.

  #parts(
    [Find $cal(P)(A)$.],
    [For each statement below, determine whether it is true or false, and explain briefly.

      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: 1em,
        enum([$cal(P)(A) subset A$], [$emptyset subset A$], [$emptyset subset cal(P)(A)$], [$emptyset in A$]),
        enum(start: 5, [$emptyset in cal(P)(A)$], [$1 in A$], [$1 in cal(P)(A)$], [${1} in A$]),
        enum(start: 9, [${1} in cal(P)(A)$], [${1} subset A$], [${1} subset cal(P)(A)$]),
      )],
    threshold: 1,
  )
]

#exercise(
  title: [Power Sets --- Computation],
  source: 40,
  goal: [Practice computing power sets.],
)[
  For each of the following sets, find its power set.

  #parts(
    [$A = {a}$],
    [$B = {a, b}$],
    [$C = {a, {b}}$],
    [$D = {emptyset, {emptyset}}$],
    [$E = cal(P)(A)$, where $A = {a}$],
    [$F = {a, b, c}$],
  )
]

#exercise(
  title: [Power Sets --- Cardinality],
  source: 41,
  goal: [The relationship between the number of elements of a set and of its power set.],
)[
  For each set $S$ in the previous exercise, how many elements are in $S$, and how many are in
  $cal(P)(S)$?

  #parts(
    [$A = {a}$],
    [$B = {a, b}$],
    [$C = {a, {b}}$],
    [$D = {emptyset, {emptyset}}$],
    [$E = cal(P)(A)$, where $A = {a}$],
    [$F = {a, b, c}$],
  )

  Can you predict how many elements are in the power set of $G = {1, 2, 3, 4}$? What about
  $K = {1, 2, 3, dots, k}$, where $k in NN$?
]

#exercise(
  title: [Power Sets --- Possible Power Sets],
  source: 42,
  goal: [Start thinking systematically about the special structure of power sets.],
)[
  For each set below, determine whether it can be the power set $cal(P)(S)$ of some set $S$. If it
  can, find $S$. If not, explain why.

  #parts(
    [${1}$],
    [$emptyset$],
    [${emptyset, {1}}$],
    [${emptyset}$],
    [${emptyset, {1}, {emptyset, 1}}$],
    [${emptyset, {1}, {2}}$],
    [${emptyset, {1}, {2}, {1, 2}}$],
  )
]

#exercise(
  title: [Power Sets --- Closure Properties],
  source: 43,
  goal: [Power sets are closed under the set operations --- and "downward closed" under taking subsets.],
  size: .95em,
)[
  Suppose $S$ is a set.

  #parts(
    [Prove that if $X, Y in cal(P)(S)$, then $X union Y in cal(P)(S)$.],
    [Prove that if $X, Y in cal(P)(S)$, then $X inter Y in cal(P)(S)$.],
    [Prove that if $X in cal(P)(S)$, then $X^c := S without X in cal(P)(S)$.],
    [Prove that if $X in cal(P)(S)$ and $Y subset X$, then $Y in cal(P)(S)$.],
    [Revisit the previous exercise in light of this. Can you prove that ${{1}}$ is not a power set?
      How about ${emptyset, {1}, {2}}$?],
  )
]

#exercise(
  title: [Power Sets --- Set Operations],
  source: 44,
  goal: [How operations on the base sets affect the power set.],
  size: .95em,
)[
  Let $U$ be a fixed universe and $A, B subset U$. For each statement, decide whether it is true or
  false and justify briefly.

  #parts(
    [$emptyset in cal(P)(A)$],
    [If $X in cal(P)(A)$, then $X in A$.],
    [If $A subset B$, then $cal(P)(A) subset cal(P)(B)$.],
    [$cal(P)(A inter B) = cal(P)(A) inter cal(P)(B)$],
    [$cal(P)(A) union cal(P)(B) subset cal(P)(A union B)$],
    [$cal(P)(A union B) = cal(P)(A) union cal(P)(B)$],
    [$cal(P)(A^c) = (cal(P)(A))^c$, where the complement of $cal(P)(A)$ is taken inside
      $cal(P)(U)$.],
    [$cal(P)(A) inter cal(P)(A^c) = {emptyset}$],
  )
]

// ---------------------------------------------------------------------------
// 3.4 Indexing sets (Practicing Proofs, Ch. 8)
// ---------------------------------------------------------------------------

#slide(title: [Indexed Families of Sets])[
  When we have a whole family of sets ${S_i}_(i in I)$, indexed by a set $I$, we write
  $
    union.big_(i in I) S_i := {x | exists i in I, x in S_i}
    #h(2em)
    inter.big_(i in I) S_i := {x | forall i in I, x in S_i}.
  $

  The index set $I$ may be finite, countably infinite ($NN$), or uncountable ($RR$). *Every* proof
  about these "big" symbols comes straight from the two definitions above --- an $exists$ on the
  left, a $forall$ on the right.
]

#exercise(
  title: [Index Sets --- Finite Indices],
  source: 45,
  goal: [The relationship between the new "big" symbols and the familiar "small" ones.],
)[
  Consider the sets
  $
    S_1 := {1, 2}; #h(2em) S_2 := {2, 3}; #h(2em) S_3 := {3, 4}.
  $

  Compute the following sets:

  #parts(
    [$union.big_(i=1)^3 S_i$],
    [$inter.big_(i=1)^2 S_i$],
    [$inter.big_(i=1)^3 S_i$],
  )
]

#exercise(
  title: [Index Sets --- Infinite Indices],
  source: 46,
  goal: [The "big" symbols really earn their keep on infinite sequences.],
  size: .95em,
)[
  For each $n in NN$, let $display(S_n := [0, (n-1)/n))$.

  #parts(
    [Compute the first three sets in the sequence: $S_1$, $S_2$, $S_3$.],
    [Prove that if $m, n in NN$ with $m < n$, then $S_m subset S_n$. Start by rewriting this claim
      in mathematical notation.],
    [Find $inter.big_(i=1)^oo S_i$ and prove your answer.],
    [Find $union.big_(i=1)^oo S_i$ and prove your answer. You may use without proof Problem 2.70:
      "if $epsilon > 0$, then there exists $N in NN$ such that $1\/N < epsilon$."],
  )
]

#exercise(
  title: [Index Sets --- Uncountable Unions],
  source: 47,
  goal: [Use the "big union" symbol over an uncountably large collection.],
  size: .95em,
)[
  For each $r in RR$, define $S_r$ as below. Compute $union.big_(r in RR) S_r$. You do not need to
  prove your answers.

  #parts(
    [$S_r := {-r}$],
    [$S_r := {r^2}$],
    [$S_r := {e^r}$, where $e approx 2.718$],
    [$S_r := {1}$],
    [$S_r := {r, r^2, -r}$],
    [$S_r := {1, r}$],
    [$S_r := [0, abs(r))$],
    [$S_r := [-abs(r), abs(r)]$],
    [$S_r := (-abs(r), abs(r))$],
    [$S_r := {r^m : m in NN}$],
  )
]

#exercise(
  title: [Index Sets --- Uncountable Unions Revisited],
  source: 48,
  goal: [Now prove it, straight from the definition of the "big union".],
)[
  For each $r in RR$ define
  $
    S_r := {r^2} #h(3em) T_r := {r^3}.
  $

  #parts(
    [Use the definition of the "big union" to prove $union.big_(r in RR) S_r subset [0, oo)$.],
    [Use the definition to prove $[0, oo) subset union.big_(r in RR) S_r$. Conclude that
      $union.big_(r in RR) S_r = [0, oo)$.],
    [Compute $union.big_(r in RR) T_r$ and prove your answer is correct.],
  )
]

#exercise(
  title: [Index Sets --- Uncountable Intersections],
  source: 49,
  goal: [The same, for the "big intersection" symbol.],
  size: .95em,
)[
  For each $r in RR$, define $S_r$ as below. Compute $inter.big_(r in RR) S_r$. You do not need to
  prove your answers.

  #parts(
    [$S_r := {r}$],
    [$S_r := [-abs(r), abs(r)]$],
    [$S_r := (-abs(r), abs(r))$],
    [$S_r := [0, abs(r)]$],
    [$S_r := (0, abs(r))$],
    [$S_r := (-1 - abs(r), 1 + abs(r))$],
    [$S_r := {m + r : m in ZZ}$],
  )
]

#exercise(
  title: [Index Sets --- Uncountable Intersections Revisited],
  source: 50,
  goal: [Prove it from the definition of the "big intersection".],
)[
  For each $r in RR$, define
  $
    S_r := [-abs(r), abs(r)] #h(3em) T_r := (-1 - abs(r), 1 + abs(r)).
  $

  #parts(
    [Use the definition of "big intersection" to prove $inter.big_(r in RR) S_r subset {0}$.],
    [Use the definition to prove ${0} subset inter.big_(r in RR) S_r$. Conclude that
      $inter.big_(r in RR) S_r = {0}$.],
    [Compute $inter.big_(r in RR) T_r$ and prove your answer is correct.],
  )
]

#exercise(
  title: [Index Sets --- Unions and Intersections I],
  source: 51,
  goal: [A capstone sequence: complex unions and intersections of infinite sequences, and mixtures of the two.],
  size: .95em,
)[
  For each $n in NN$, define the interval
  $
    I_n := [(-1)^n / n, #h(.2em) 2 + 1/n].
  $

  #parts(
    [What are the intervals $I_1$, $I_2$, $I_3$, $I_4$?],
    [If $k in NN$, what is $I_(2k)$? What about $I_(2k+1)$?],
    [For every $k in NN$, define $display(J_k := inter.big_(n=k)^oo I_(2n))$. Prove that
      $[1/(2k), 2] subset J_k$.],
    [Prove that $display(J_k subset [1/(2k), (4k+1)/(2k)])$.],
  )
]

#exercise(
  title: [Index Sets --- Unions and Intersections II],
  source: 52,
  goal: [A continuation of the previous exercise.],
  size: .95em,
)[
  Recall $display(I_n := [(-1)^n / n, #h(.2em) 2 + 1/n])$ and
  $display(J_k := inter.big_(n=k)^oo I_(2n))$.

  #parts(
    [Use proof by contradiction to prove that $(x in J_k) ==> x <= 2$. Conclude that
      $J_k subset [1/(2k), 2]$, and therefore $J_k = [1/(2k), 2]$.

      You may use without proof Problem 2.70: "if $epsilon > 0$, then there exists $N in NN$ such
      that $1\/N < epsilon$."],
    [For every $k in NN$, define $display(J'_k := inter.big_(n=k)^oo I_(2n+1))$. Compute $J'_k$.
      You do not need to prove your answer (but you are encouraged to).],
    [For every $k in NN$, define $display(E_k := inter.big_(n=k)^oo I_n)$. Compute $E_k$. You do
      not need to prove your answer.],
    [Compute $display(union.big_(k=1)^oo E_k)$. Prove your answer.],
    threshold: 2,
  )
]

#exercise(
  title: [Index Sets --- Unions and Intersections III],
  source: 53,
  goal: [A continuation of the previous two exercises.],
)[
  Recall that for each $n in NN$ we defined
  $
    I_n := [(-1)^n / n, #h(.2em) 2 + 1/n].
  $

  Find, *with proof*, the value of
  $
    inter.big_(k=1)^oo union.big_(n=k)^oo I_n.
  $
]

#exercise(
  title: [Index Sets --- Monotone Sequences],
  source: 54,
  goal: [Generalizing Problem 3.36 from the textbook, and several of the exercises above.],
  size: .95em,
)[
  A sequence of sets ${S_n}_(n=1)^oo$ is *increasing* if $S_1 subset S_2 subset S_3 subset dots.c$,
  i.e. $forall m, n in NN, [(m < n) ==> (S_m subset S_n)]$. It is *decreasing* if
  $S_1 supset S_2 supset S_3 supset dots.c$.

  #parts(
    [Suppose ${S_n}_(n=1)^oo$ is increasing. Find, with proof, $display(inter.big_(i=1)^oo S_i)$.],
    [Suppose ${S_n}_(n=1)^oo$ is decreasing. Formulate a guess as to what
      $display(union.big_(i=1)^oo S_i)$ is.],
    [Prove that ${S_n}_(n=1)^oo$ is increasing if and only if ${S_n^c}_(n=1)^oo$ is decreasing.],
    [Suppose ${S_n}_(n=1)^oo$ is decreasing. Use the generalized De Morgan laws to compute
      $display(union.big_(i=1)^oo S_i)$.],
  )
]

#exercise(
  title: [Index Sets --- Pairwise Disjoint],
  source: 55,
  goal: [More challenging: the definition of pairwise disjoint, plus proof techniques from Chapter 2.],
)[
  For each $n in NN$, let
  $
    S_n := {1/n + m : m in ZZ}.
  $

  Use *proof by contradiction* to show that the collection ${S_n}_(n in NN)$ is pairwise disjoint.
]

#exercise(
  title: [Index Sets --- Limits (lim inf and lim sup)],
  source: 56,
  goal: [A capstone connecting this section to Real Analysis. Exercises 51--53 are a special case.],
  size: .8em,
)[
  Let ${S_n}_(n in NN)$ be a sequence of sets. Define
  $
    liminf S_n := union.big_(k=1)^oo inter.big_(n=k)^oo S_n
    #h(2em)
    limsup S_n := inter.big_(k=1)^oo union.big_(n=k)^oo S_n.
  $

  #parts(
    [Prove that $liminf S_n = {x : x in S_j "for all but finitely many" j in NN}$, where the
      right-hand condition means $exists B in NN, forall j in NN, [(j >= B) ==> (x in S_j)]$.],
    [Prove that $limsup S_n = {x : x in S_j "for infinitely many" j in NN}$, where the right-hand
      condition means $forall B in NN, exists j in NN, [(j >= B) and (x in S_j)]$.],
    [Revisit $I_n := [(-1)^n\/n, 2 + 1\/n]$ from Exercises 51--53. Show that
      $0 in inter.big_(k=1)^oo union.big_(n=k)^oo I_n$ but
      $0 in.not union.big_(k=1)^oo inter.big_(n=k)^oo I_n$, without computing these sets
      explicitly.],
    [Prove that $liminf S_n subset limsup S_n$.],
    [Suppose ${S_n}$ is a pairwise disjoint collection. Prove $limsup S_n = liminf S_n$ and find
      their common value.],
    [Suppose ${S_n}$ is increasing. Prove $limsup S_n = liminf S_n$ and find their common value.],
    [Suppose ${S_n}$ is decreasing. Prove $limsup S_n = liminf S_n$ and find their common value.],
    [Suppose $S_1 = S_3 = S_5 = dots.c$ and $S_2 = S_4 = S_6 = dots.c$. Compute $limsup S_n$ and
      $liminf S_n$.],
  )
]

// ---------------------------------------------------------------------------
// 3.5 Cartesian products (Practicing Proofs, Ch. 9)
// ---------------------------------------------------------------------------

#slide(title: [Cartesian Products])[
  #defn[Cartesian Product][
    For sets $A$ and $B$,
    $
      A times B := {(a, b) | a in A "and" b in B}.
    $
  ]

  The elements are *ordered pairs*: $(a, b) = (c, d)$ exactly when $a = c$ _and_ $b = d$. Order
  matters, unlike for sets.

  As a result $times$ is neither commutative nor associative --- but it distributes over
  $union$, $inter$, $without$, and $symdiff$ beautifully.
]

#exercise(
  title: [Products --- Tuples vs. Sets],
  source: 57,
  goal: [Reflect on the difference between sets and tuples via their definitions of equality.],
)[
  Suppose $a$ and $b$ are two *different* natural numbers.

  Explain in your own words why ${a, b} = {b, a}$ but $(a, b) != (b, a)$.

  Next, use the *definition of equality* (of sets, and of tuples) to prove that ${a, b} = {b, a}$
  but $(a, b) != (b, a)$.
]

#exercise(
  title: [Products --- Computing Products],
  source: 58,
  goal: [Practice the definition of the Cartesian product.],
  size: .95em,
)[
  #parts(
    [Let $A = {0, 1}$ and $B = {-1, 1}$. Which of the following tuples are elements of $A times B$?

      #enum([$(0, -1)$], [$(1, 2)$], [$(-1, 1)$], [$(1, 1)$], [$(0, 0)$])],
    [Let $A = {1, 2}$ and $B = {3, 4, 5}$.

      #enum(
        [List all elements of $A times B$.],
        [List all elements of $B times A$.],
        [Is $A times B = B times A$?],
      )],
    [Let $A = {x, y, z}$ and $B = {1}$. List all elements of $A times B$.],
    [Let $A$ be an arbitrary set and $B = {b}$. Use set-builder notation to describe $A times B$.],
    threshold: 2,
  )
]

#exercise(
  title: [Products --- Empty Products],
  source: 59,
  goal: [Practice the definition of the Cartesian product.],
)[
  Prove that $A times B = emptyset$ if and only if one of $A$, $B$ is the empty set. That is:

  #parts(
    [Prove that if $A = emptyset$, then $A times B = emptyset$.],
    [Prove that if $B = emptyset$, then $A times B = emptyset$.],
    [Prove that if $A times B = emptyset$, then $A = emptyset$ or $B = emptyset$.],
  )
]

#exercise(
  title: [Products --- Algebraic Properties],
  source: 60,
  goal: [The Cartesian "product" does not behave much like multiplication of integers or matrices.],
  size: .95em,
)[
  #parts(
    [*Commutativity.* Give an example of sets $A$, $B$ for which $A times B != B times A$.],
    [Give an example of sets $A$, $B$ for which $A times B = B times A$. Can you formulate a
      hypothesis for _which_ sets satisfy $A times B = B times A$?],
    [*Associativity.* Prove that if $A, B, C != emptyset$ then
      $(A times B) times C != A times (B times C)$. What happens if one of the sets is empty?],
    [*Cancellation.* Prove that if $A != emptyset$ and $A times B = A times C$, then $B = C$. Give
      an example showing the conclusion can fail if $A = emptyset$.],
    threshold: 2,
  )
]

#exercise(
  title: [Products --- Criteria for Commutativity],
  source: 61,
  goal: [When exactly is the Cartesian product commutative?],
)[
  Let $A$, $B$, $C$, $D$ be sets.

  #parts(
    [Suppose $A subset C$ and $B subset D$. Prove that $A times B subset C times D$.],
    [Suppose $A, B != emptyset$. Prove that
      $(A times B subset C times D) ==> [(A subset C) and (B subset D)]$. Give an example showing
      the conclusion may fail if one of $A$, $B$ is empty.],
    [Prove that $A times B = B times A$ if and only if $A = B$, or one of $A$, $B$ is empty.],
    threshold: 3,
  )
]

#exercise(
  title: [Products --- Projections],
  source: 62,
  goal: [Slightly more challenging --- and it sets the stage for Chapter 7.],
  size: .9em,
)[
  Let $A$, $B$ be sets and $S subset A times B$. Define the *projections*
  $
    pi_A (S) := {a in A : exists b in B, [(a, b) in S]}
    #h(1.5em)
    pi_B (S) := {b in B : exists a in A, [(a, b) in S]}.
  $

  #parts(
    [Let $A = {1, 2}$ and $B = {3, 4}$. What is the size of $A times B$? How many different choices
      are there for $S subset A times B$? What are the possible sizes of $S$?],
    [Choose an $S$ of each possible size and compute $pi_A (S)$ and $pi_B (S)$.],
    [Is it always true that $pi_A (S) times pi_B (S) = S$?],
    [Can you find conditions on $A$, $B$, $S$ under which $pi_A (S) times pi_B (S) = S$? Make your
      condition as general as possible, and try to prove it.],
  )
]

#exercise(
  title: [Products --- Visualizing Products],
  source: 63,
  goal: [Use the Cartesian plane to visualize Cartesian products.],
)[
  Sketch each Cartesian product below as a region of the plane $RR^2$, and describe the region in
  words. Pay special attention to the *boundary*.

  #parts(
    [$(0, 1) times [2, 3]$],
    [$(-oo, 0] times [0, oo)$],
    [$RR times NN$ --- is this the same set as $NN times RR$?],
    threshold: 3,
  )
]

#exercise(
  title: [Products --- Distributivity I],
  source: 64,
  goal: [Start investigating how the Cartesian product relates to the other set operations.],
)[
  Let $A = {0, 1}$, $B = {2, 3}$, and $C = {3, 4}$.

  #parts(
    [Compute $A times (B union C)$ and $(A times B) union (A times C)$.],
    [Compute $A times (B inter C)$ and $(A times B) inter (A times C)$.],
    [Compute $A times (B without C)$ and $(A times B) without (A times C)$.],
  )
]

#exercise(
  title: [Products --- Distributivity II],
  source: 65,
  goal: [Now prove the general rules suggested by the previous exercise.],
  size: .9em,
)[
  Let $A$, $B$, $C$ be arbitrary sets (possibly empty).

  #parts(
    [*Over union.* Prove $A times (B union C) = (A times B) union (A times C)$.],
    [*Over intersection.* Prove $A times (B inter C) = (A times B) inter (A times C)$.],
    [*Over set-difference.* Prove $A times (B without C) = (A times B) without (A times C)$.],
    [*Over symmetric difference.* Prove $A times (B symdiff C) = (A times B) symdiff (A times C)$,
      where $X symdiff Y = (X without Y) union (Y without X) = (X union Y) without (X inter Y)$.],
    [Does the product distribute "from the right" as well as "from the left"? Is
      $(A union B) times C = (A times C) union (B times C)$? What if $union$ is replaced by
      $inter$, $without$, or $symdiff$?],
    threshold: 2,
  )
]

#exercise(
  title: [Products --- Other Set Operations],
  source: 66,
  goal: [How two or more Cartesian products behave under union and intersection.],
)[
  Let $A$, $B$, $C$, $D$ be sets.

  #parts(
    [Prove that $(A times C) inter (B times D) = (A inter B) times (C inter D)$.],
    [Give a counterexample showing
      $(A times C) union (B times D) != (A union B) times (C union D)$.],
    [Suppose $A$, $B$ are nonempty and disjoint and
      $(A times C) union (B times D) = (A union B) times (C union D)$. What can you conclude about
      $C$ and $D$?],
    threshold: 3,
  )
]

#exercise(
  title: [Products --- Other Set Operations II],
  source: 67,
  goal: [How Cartesian products behave under complementation.],
)[
  Suppose $U$, $V$ are universes with $X subset U$ and $Y subset V$, so $X^c = U without X$ and
  $Y^c = V without Y$. Then $X times Y subset U times V$, so
  $(X times Y)^c = (U times V) without (X times Y)$.

  #parts(
    [Give an example to show that $(X times Y)^c != X^c times Y^c$.],
    [Prove that $(X times Y)^c = (X^c times V) union (U times Y^c)$.],
  )
]

#exercise(
  title: [Products --- Distributivity Revisited],
  source: 68,
  goal: [Generalize the distributivity results to arbitrary index sets.],
)[
  Let $I$ be an arbitrary nonempty index set (possibly infinite), ${A_i}_(i in I)$ a collection of
  sets indexed by $I$, and $B$ an arbitrary set.

  #parts(
    [Prove that $(union.big_(i in I) A_i) times B = union.big_(i in I) (A_i times B)$.],
    [Prove that $(inter.big_(i in I) A_i) times B = inter.big_(i in I) (A_i times B)$.],
    [What if the "big symbols" appear on the right, as in $B times (union.big_(i in I) A_i)$?],
    threshold: 3,
  )
]
