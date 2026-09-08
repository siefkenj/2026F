#import "preamble.typ": *
#show: mat246-slides.with([Mathematics and Logic], sources: (practicing_proofs,))

// Problems in this deck are ported from
//   *Practicing Proofs: MAT246 Handouts* by Noha ElGarem, Gal Gross,
//   Tonatiuh Matos Wiederhold and Stan Yoshinobu (University of Toronto, 2025),
//   https://danaernst.com/IBL-IntroToProof/PracticingProofs.pdf
// which accompanies Dana Ernst's *An Introduction to Proof via Inquiry-Based
// Learning*. Both are licensed CC BY-SA 4.0.
//
// Covers textbook Chapter 2 (A Taste of Number Theory, Introduction to Logic,
// Proving Conditional Propositions, Quantification).


// ---------------------------------------------------------------------------
// 2.1 Definitions & a taste of number theory (Practicing Proofs, Ch. 2)
// ---------------------------------------------------------------------------
#let line_number_proof(body) = {
  block(stroke: (paint: blue, thickness: 1pt, dash: "dashed"), inset: 1em, width: 100%)[
    #set enum(numbering: d => text(fill: blue.darken(50%))[(#d)#h(1em)])

    #body
  ]
}

#let ub(..args) = {
  let l = args.pos().at(0, default: 3em)
  box(width: l, stroke: (bottom: 1pt + blue), fill: blue.lighten(80%), height: 1.5em)
}

#slide(title: [Warmup: Embettering a Proof 2])[
  #block(width: 100%, height: 100%)[
    #set text(size: .9em)
    Fill in the missing blocks.
    #line_number_proof[
      *Claim:* The sum of two odd integers is even.\
      #ub(3em)*:*

      + Let $m$ and $n$ be odd integers.
      + #ub(10em) $m = 2j + 1$ and $n = 2k + 1$ for some $j, k in ZZ$. \ #ub(3em) such an $j$ and
        $k$.
      + #ub(10em) $m + n = 2j + 2k + 2 = 2(j + k + 1)$ #ub(2em)
      + #ub(8em) $j + k + 1 in ZZ$ ~#ub(7em)~ $m + n$ is even #ub(2em)
    ]
  ]
]

#slide(title: [Where We Are Going])[
  Chapter 2 is where the course really starts. We will:

  - Pin down what a mathematical *definition* is, and what it licenses us to say.
  - Learn the language of *propositional logic*.
  - Learn the standard techniques for proving *conditional* statements.
  - Learn to read and write statements with *quantifiers*.

  Everything else in the course --- sets, induction, relations, functions, cardinality --- is built
  on top of these four things.
]

#slide(title: [What Does this Class Feel Like?])[
  On your proof-learning journey, *expect a cycle of victory and defeat*, and a full range of
  emotions. Sometimes exhilaration, other times something close to paralysis.

  *If you are doing things well, you should be confused on a regular basis.*

  Productive struggle and mistakes are where the growth happens. I am here to guide and challenge
  you, but I cannot do the learning for you --- just as a music teacher cannot move your fingers for
  you.

  #v(.4em)
  Think of the textbook as a mountaineering guidebook: a list of summits, with a hint about which
  trailhead to start from. There are always multiple routes. Some summits take a day; some take an
  expedition; many are laced with false summits.

  *The journey is vastly more important than the destinations.*
]

#exercise(
  title: [Definitions --- Vocabulary],
  source: 1,
  goal: [Practice the mathematical symbols, vocabulary, and syntax (grammar) introduced in the
    text.],
)[
  The following symbols were introduced in the text:
  $
    := #h(2em) = #h(2em) in #h(2em) divides #h(2em) NN #h(2em) ZZ #h(2em) RR
  $

  For each symbol above:

  #parts(
    [explain its meaning; compare and contrast it with other symbols or closely-related concepts;],
    [give an example of correct usage, and the meaning of your example;],
    [give an example of an _incorrect_ usage, and explain the error.],
  )
]

#exercise(
  title: [Definitions --- Parity],
  source: 2,
  goal: [Practice mathematical definitions and how to apply them.],
)[
  #definition(title: [Definition 2.1])[
    An integer $n$ is *even* if $n = 2k$ for some $k in ZZ$. An integer $n$ is *odd* if $n = 2k + 1$
    for some $k in ZZ$.
  ]

  #parts(
    [Use the definition above to _prove_ that $101$ is odd and $246$ is even.],
    [Can we use the definition to prove that $101$ is _not_ even? If so, how? If not, what else
      would we need?],
  )
]

#exercise(
  title: [Definitions --- Squaring],
  source: 3,
  goal: [Practice using definitions to prove novel results.],
)[
  Use Definition 2.1 to prove the following theorem from the text.

  #theorem(title: [2.2])[If $n$ is an even integer, then $n^2$ is an even integer.]

  #parts(
    [Where in the proof have you used the definition?],
    [Apart from using Definition 2.1, did you make any assumptions in your proof? Can you identify
      them and clearly state each one?],
  )
]

#exercise(
  title: [Definitions --- Divisibility],
  source: 4,
  goal: [New definitions generalize old ones --- and claims of "generalization" need proof.],
)[
  #definition(title: [Definition 2.5])[
    Given $n, m in ZZ$, we say $n$ *divides* $m$, written $n divides m$, if there exists $k in ZZ$
    such that $m = n k$. We may also say $m$ is *divisible by* $n$, or that $n$ is a *factor* of
    $m$.
  ]

  #parts(
    [Use Definitions 2.1 and 2.5 to prove that if $n$ is even, then it is divisible by $2$.],
    [Use Definitions 2.1 and 2.5 to prove that if $n$ is divisible by $2$, then it is even.],
    [What is the difference between (a) and (b)? Do they mean the same thing? Are the proofs the
      same? Can we use one to prove the other?],
    [Use Definition 2.5 to state precisely what it means to say $n$ is _not_ divisible by $2$.],
    [Suppose $n$ is odd. Can we conclude $n$ is not divisible by $2$? Why or why not?],
  )
]

// ---------------------------------------------------------------------------
// 2.2 Propositional logic (Practicing Proofs, Ch. 3)
// ---------------------------------------------------------------------------

#slide(title: [Propositional Logic])[
  A *proposition* is a statement that is either true or false --- exactly one of the two.

  Propositions are combined into *compound propositions* with the connectives
  $
    not #h(1.5em) and #h(1.5em) or #h(1.5em) ==> #h(1.5em) <==>
  $

  A connective is _defined_ by what it does to truth values. Nothing more.
]

#exercise(
  title: [Logic --- Translation],
  source: 5,
  goal: [Practice expressing logical ideas using the symbols of propositional logic.],
)[
  Let Mai be a mathematician, and set
  $
    R & = "It is currently raining in Toronto", \
    U & = "Mai is holding an umbrella".
  $

  Use $R$, $U$, and the connectives $not, or, and, ==>, <==>$ to express the following symbolically.

  #parts(
    [If it is currently raining in Toronto, then Mai is holding an umbrella.],
    [It is not currently raining in Toronto.],
    [It is currently raining in Toronto or Mai is holding an umbrella.],
    [Mai is holding an umbrella if and only if it is currently raining in Toronto.],
    [It is currently raining in Toronto and Mai is holding an umbrella.],
    [Whenever Mai is not holding an umbrella, it is not raining in Toronto.],
  )
]

#exercise(
  title: [Logic --- Truth Values],
  source: 6,
  goal: [Practice assigning truth values to compound propositions.],
)[
  For each compound proposition from your answer to the previous exercise, describe a situation in
  which the proposition is *true* and a situation in which it is *false*.

  (By "situation" we mean the weather conditions and the umbrella-holding.)
]

#exercise(
  title: [Logic --- Truth Tables],
  source: 7,
  goal: [Connectives are defined by their action on truth values. Practice those definitions.],
  // Wide tables: they need the whole frame, not a column.
  one-column: true,
)[
  It is customary to write $0$ for "false" and $1$ for "true". Complete the truth tables for each of
  the following.

  #let tt(head, ..rows) = table(columns: head.len(), ..head, ..rows.pos())
  #set align(center)
  #v(.3em)
  #grid(
    columns: 5,
    column-gutter: 1.2em,
    tt(([$A$], [$not A$]), [$0$], [], [$1$], []),
    tt(
      ([$A$], [$B$], [$A and B$]),
      [$0$],
      [$0$],
      [],
      [$0$],
      [$1$],
      [],
      [$1$],
      [$0$],
      [],
      [$1$],
      [$1$],
      [],
    ),
    tt(
      ([$A$], [$B$], [$A or B$]),
      [$0$],
      [$0$],
      [],
      [$0$],
      [$1$],
      [],
      [$1$],
      [$0$],
      [],
      [$1$],
      [$1$],
      [],
    ),
    tt(
      ([$A$], [$B$], [$A ==> B$]),
      [$0$],
      [$0$],
      [],
      [$0$],
      [$1$],
      [],
      [$1$],
      [$0$],
      [],
      [$1$],
      [$1$],
      [],
    ),
    tt(
      ([$A$], [$B$], [$A <==> B$]),
      [$0$],
      [$0$],
      [],
      [$0$],
      [$1$],
      [],
      [$1$],
      [$0$],
      [],
      [$1$],
      [$1$],
      [],
    ),
  )
]

#exercise(
  title: [Logic --- Truth Tables (cont.)],
  source: 7,
  goal: [Now compare columns: two propositions with identical columns are _logically equivalent_.],
  one-column: true,
)[
  #set align(center)
  #v(.5em)
  #grid(
    columns: 2,
    column-gutter: 2.5em,
    table(
      columns: 5,
      [$A$], [$B$], [$not A$], [$(not A) or B$], [$A ==> B$],
      [$0$], [$0$], [], [], [],
      [$0$], [$1$], [], [], [],
      [$1$], [$0$], [], [], [],
      [$1$], [$1$], [], [], [],
    ),
    table(
      columns: 6,
      [$A$], [$B$], [$A ==> B$], [$not (A ==> B)$], [$not B$], [$A and (not B)$],
      [$0$], [$0$], [], [], [], [],
      [$0$], [$1$], [], [], [], [],
      [$1$], [$0$], [], [], [], [],
      [$1$], [$1$], [], [], [], [],
    ),
  )
]

#exercise(
  title: [Logic --- Truth Tables (cont.)],
  source: 7,
  goal: [One more. What does the last pair of columns tell you about $<==>$?],
  one-column: true,
)[
  #set align(center)
  #v(.8em)
  #table(
    columns: 6,
    [$A$], [$B$], [$A ==> B$], [$B ==> A$], [$(A ==> B) and (B ==> A)$], [$A <==> B$],
    [$0$], [$0$], [], [], [], [],
    [$0$], [$1$], [], [], [], [],
    [$1$], [$0$], [], [], [], [],
    [$1$], [$1$], [], [], [], [],
  )
]

#exercise(
  title: [Logic --- Arithmetic],
  source: 8,
  goal: [Propositional logic is the basis of digital technology: connectives are functions of $0$
    and $1$.],
)[
  For any proposition $A$ with truth value $0$ or $1$, we can express $not A$ as the arithmetic
  function $1 - A$, since

  #align(center, table(
    columns: 3,
    [$A$], [$not A$], [$1 - A$],
    [$0$], [$1$], [$1$],
    [$1$], [$0$], [$0$],
  ))

  #parts(
    [Study the truth table of $and$. Can you express $A and B$ as a familiar arithmetic function of
      $A$ and $B$?],
    [Study the truth table of $or$. Can you express $A or B$ arithmetically?],
    [Study the truth table of $==>$. Can you express $A ==> B$ arithmetically?],
    [Study the truth table of $<==>$. Can you express $A <==> B$ arithmetically?],
  )

  This is essentially how computers represent logical operations!
]

#exercise(
  title: [Logic --- Propositions],
  source: 9,
  goal: [Practice translating symbolic language back into intuitive mathematical language.],
)[
  Let
  $
    E & = "The integer " 2 " is an even number"; \
    F & = "The integer " 4 " is an even number"; \
    P & = "The integer " 2 " is a prime number"; \
    Q & = "The integer " 4 " is a prime number".
  $

  For each compound proposition below, write it in mathematical English and determine whether it is
  true or false.

  #parts(
    [$E and P$],
    [$E or P$],
    [$E ==> (not E)$],
    [$(not E) ==> E$],
    [$P ==> E$],
    [$E <==> P$],
    [$(not E) <==> P$],
    [$F <==> Q$],
  )
]

#exercise(
  title: [Logic --- Cards],
  source: 10,
  goal: [A classic exercise on the meaning of mathematical ("material") implication.],
)[
  An unusual deck of alphanumeric cards has one of the letters A--Z on one side and one of the
  numerals 0--9 on the other. Four cards are on the table:

  #align(center, box(inset: .6em, text(size: 1.6em)[
    #box(stroke: .5pt, inset: .5em)[1] #h(1em) #box(stroke: .5pt, inset: .5em)[2] #h(1em) #box(
      stroke: .5pt,
      inset: .5em,
    )[A] #h(1em)
    #box(stroke: .5pt, inset: .5em)[B]
  ]))

  Your mathematician friend claims: _if a card has an even number on one side, then it has a vowel
  on the other side._

  #parts(
    [Translate this hypothesis into a compound proposition. Clearly define your component
      propositions.],
    [Which cards (if any) must be turned over to verify or falsify the hypothesis?],
  )
]

#exercise(
  title: [Logic --- Nested Implications],
  source: 11,
  goal: [Continue the reflection on material implication, this time via its negation.],
)[
  Let $A, B, C, dots, Z$ be propositions.

  #parts(
    [Suppose $A ==> B$ is false. What are the truth values of $A$ and $B$?],
    [Suppose $B ==> A$ is false. What are the truth values of $A$ and $B$?],
    [Suppose $A ==> (B ==> C)$ is false. What are the truth values of $A$ and $B$?],
    [Suppose $(A ==> B) ==> C$ is false. What are the truth values of $A$, $B$, and $C$?],
    [Suppose $A ==> (B ==> (C ==> ( dots.c (Y ==> Z) dots.c )))$ is false. What are the truth values
      of $A, B, dots, Z$?],
  )
]

#exercise(
  title: [Logic --- Words],
  source: 12,
  goal: [Theorems are stated in words, not symbols. Practice decoding the common phrases.],
)[
  Consider the compound proposition $A ==> B$.

  #parts(
    [Use logical connectives to express the *converse*, the *inverse*, and the *contrapositive*.
      Which (if any) are logically equivalent to $A ==> B$?],
    [Use $==>$ to express each of the following:

      #enum(
        [$A$ is _necessary_ for $B$.],
        [$A$ is _sufficient_ for $B$.],
        [$A$ only if $B$.],
        [$A$ if $B$.],
        [$A$ whenever $B$.],
      )],
  )
]

#exercise(
  title: [Logic --- Equivalence],
  source: 13,
  goal: [Mathematicians switch between logically equivalent statements without warning. Practice
    spotting them.],
)[
  Let $A$ and $B$ be propositions. Which of the following are logically equivalent to each other?
  Collect them into groups.

  #parts(
    [$A ==> B$],
    [$B ==> A$],
    [$(not A) ==> (not B)$],
    [$(not B) ==> (not A)$],
    [$not (A ==> B)$],
    [$(not A) and (not B)$],
    [$(not A) or (not B)$],
    [$(not A) or B$],
    [$A or (not B)$],
    [$(not A) and B$],
    [$A and (not B)$],
    [$not (A and B)$],
    [$not (A or B)$],
  )
]

#exercise(
  title: [Logic --- Complete Sets of Connectives],
  source: 14,
  goal: [Logic gates are built from a few simple types. Which connectives can express which?],
)[
  Consider the five compound propositions
  $
    not A, #h(1em) A and B, #h(1em) A or B, #h(1em) A ==> B, #h(1em) A <==> B.
  $

  For each one, find a logically equivalent proposition using only:

  #parts(
    [the connectives $not, or$;],
    [the connectives $not, and$;],
    [the connectives $not, ==>$;],
    [the single connective $arrow.t$ defined by the truth table below.

      #align(center, table(
        columns: 3,
        [$A$], [$B$], [$A arrow.t B$],
        [$0$], [$0$], [$1$],
        [$0$], [$1$], [$1$],
        [$1$], [$0$], [$1$],
        [$1$], [$1$], [$0$],
      ))],
  )
]

#exercise(
  title: [Logic --- Tautologies and Contradictions],
  source: 15,
  goal: [Practice identifying tautologies and contradictions.],
)[
  Let $A$, $B$, and $C$ be propositions. For each compound proposition below, determine (with
  justification) whether it is a *tautology*, a *contradiction*, or neither.

  #parts(
    [$((A and B) ==> C) ==> (A ==> (B ==> C))$],
    [$((not A) and B) ==> ((not B) or C)$],
    [$(A ==> (B ==> C)) and (A and B and (not C))$],
  )
]

// ---------------------------------------------------------------------------
// 2.3 Proving conditional propositions (Practicing Proofs, Ch. 4)
// ---------------------------------------------------------------------------

#slide(title: [Proving Conditional Propositions])[
  Almost every theorem you will meet has the shape $A ==> B$. There are three standard attacks:

  - *Direct proof.* Assume $A$; deduce $B$.
  - *Contrapositive.* Assume $not B$; deduce $not A$.
  - *Contradiction.* Assume $A$ and $not B$; deduce something absurd.

  The second and third are useful precisely because they hand you an _extra_ assumption to work
  with.
]

#exercise(
  title: [Conditionals --- Contrapositive Statements],
  source: 16,
  goal: [Practice translating an implication into its logically equivalent contrapositive.],
)[
  Find the contrapositive of each of the following.

  #parts(
    [If $x > 3$, then $x + 2 > 5$.],
    [If today is Wednesday, then tomorrow is Thursday.],
    [If $f$ is differentiable at $x$, then $f$ is continuous at $x$.],
    [If $n$ is a multiple of $6$, then $n$ is a multiple of $3$.],
  )

  What is the truth value of each statement? What about its contrapositive?
]

#exercise(
  title: [Conditionals --- Direct Proofs],
  source: 17,
  goal: [Practice direct proofs and the useful technique of "unpacking" mathematical statements.],
)[
  Give a *direct proof* of each of the following.

  #parts(
    [If $a$ and $b$ are integers and $a divides b$, then $a divides b c$ for every integer $c$.],
    [If $m$ and $n$ are both odd integers, then $m + n$ is even.],
    [If $a divides b$ and $b divides c$, then $a divides c$.],
    [If $n$ is divisible by $6$, then $n$ is divisible by $2$ and by $3$.],
  )
]

#exercise(
  title: [Conditionals --- Contra- Proofs],
  source: 18,
  goal: [Proofs by contradiction _add_ assumptions; proofs by contrapositive _change_ them.],
)[
  Prove each of the following *both* by contrapositive *and* by contradiction. Throughout, $m$ and
  $n$ are integers.

  #parts(
    [If $n^2$ is even, then $n$ is even.],
    [If $n^2$ is not divisible by $3$, then $n$ is not divisible by $3$.],
    [If $7 n^3$ is odd, then $n$ is odd.],
    [If $m dot n$ is even, then at least one of $m$, $n$ is even.],
  )
]

#exercise(
  title: [Conditionals --- Direct Proofs II],
  source: 19,
  goal: [More direct proofs --- with the added benefit of practicing inequalities.],
)[
  Give a direct proof of each of the following. You may use familiar facts about real numbers and
  inequalities from high-school algebra.

  #parts(
    [If $x > 3$, then $x^2 > 9$.],
    [If $0 < x < y$, then $x^2 < y^2$.],
    [If $0 <= x <= 1$, then $x^2 <= x$.],
    [If $0 < x < y$, then $1/x > 1/y$.],
    [If $abs(x) < 1$, then $x^2 < 1$.],
  )
]

#exercise(
  title: [Conditionals --- Contra- Proofs II],
  source: 20,
  goal: [More contrapositive and contradiction --- now negating inequalities.],
)[
  Prove the following by contrapositive *and* by contradiction.

  #parts(
    [If $a^2 != b^2$, then $a != b$.],
    [If $x >= 0$, then $x <= 1 + x^2$.],
    [If $abs(x) > 5$, then $x^2 > 25$.],
    [If $abs(x - 3) < 2$, then $1 < x < 5$.],
    [Use a proof by contradiction to show that if $x^2 = 2$, then $x$ is not rational.],
  )
]

#exercise(
  title: [Conditionals --- Practicing Proofs],
  source: 21,
  goal: [A capstone exercise. Use any of the techniques we have learned.],
)[
  Prove each of the following.

  #parts(
    [If $m$ and $n$ are integers and $m^2 + n^2$ is even, then $m$ and $n$ are both even or both
      odd.],
    [If $n$ is an integer, then $n^2 - n$ is even.],
    [If $m$ and $n$ are integers and $m + n$ is odd, then $m^2 + n^2$ is odd.],
    [If $m$ and $n$ are integers, then $m n$ is even if and only if $m$ is even or $n$ is even.],
    [If $n$ is odd, then $8 divides (n^2 - 1)$.],
    [If $x >= 0$ and $y >= 0$ are real numbers, then $x + y >= 2 sqrt(x y)$.],
  )
]

// ---------------------------------------------------------------------------
// 2.4-2.5 Quantification (Practicing Proofs, Ch. 5)
// ---------------------------------------------------------------------------

#slide(title: [Quantification])[
  A *predicate* is a statement with free variables --- it has no truth value until those variables
  are bound.

  Quantifiers bind them:
  $
    forall x, P(x) #h(2em) "and" #h(2em) exists x, P(x)
  $

  Two things determine what a quantified statement _means_:
  - the *universe of discourse* the variables range over, and
  - the *order* in which the quantifiers appear.

  Both will trip you up. That is the point of the next several exercises.
]

#exercise(
  title: [Quantifiers --- Proposition vs. Predicate],
  source: 22,
  goal: [Practice the definitions of proposition and predicate.],
)[
  For each expression below: (i) is it a *proposition* (does it have a definite truth value)? If so,
  which? If not, why not? (ii) Is it a *predicate*? Which variables are free, and which are bound?

  #parts(
    [The sun is hot.],
    [Where is Waldo?],
    [$x^2 > 4$],
    [$P(y)$, where $P(y) := y < 1$],
    [$Q(0)$, where $Q(x) := x > 1$],
    [There exists some integer $z$ such that $2 z + 1 = 1$.],
    [For every real number $r$, $r > 1$.],
  )
]

#exercise(
  title: [Quantifiers --- Vocabulary],
  source: 23,
  goal: [Practice the definition and usage of the two common quantifiers.],
)[
  One of your classmates has missed the lecture and asks you to explain the logical quantifiers
  $forall$ and $exists$. Help them understand how to use these symbols!

  In addition to explaining their meaning, make sure to provide some examples of correct
  mathematical usage --- and also of _incorrect grammatical_ usage.
]

#exercise(
  title: [Quantifiers --- Finite Universe of Discourse],
  source: 24,
  goal: [Quantifiers can be "unpacked" when the universe is finite.],
)[
  Suppose the universe of discourse for a predicate $P(x)$ is the set ${1, 2, 3, 4, 5}$. Express the
  following *without quantifiers*, using only $P$, negations, conjunctions, and disjunctions.

  #parts(
    [$forall x, P(x)$],
    [$exists x, P(x)$],
    [$not (exists x, P(x))$],
    [$not (forall x, P(x))$],
    [$[forall x, ((x != 3) ==> P(x))] or [exists x, (not P(x))]$],
  )

  *Bonus.* Suppose $P(x) := x > 0$. Interpret each statement above in plain English and determine
  its truth value.
]

#exercise(
  title: [Quantifiers --- Changing the Universe],
  source: 25,
  goal: [The meaning (and truth value) of a quantified statement depends on the universe of
    discourse.],
)[
  For each proposition below, evaluate its truth value when the universe of discourse is $NN$, then
  $ZZ$, then $RR$.

  #parts(
    [$forall x, (x^2 >= 0)$],
    [$forall x, (x > -1)$],
    [$exists x, (x > 0 and x < 1)$],
    [$exists x, (x + 1 < 0)$],
    [$forall x, ((x != 0) ==> x "is not a solution to" x^2 = 2)$],
  )
]

#exercise(
  title: [Quantifiers --- Translating],
  source: 26,
  goal: [With more than one variable, both the type and the order of quantification matter.],
)[
  Let the universe of discourse be all students at UofT, and let $K(x, y) :=$ "$x$ knows $y$".
  Interpret the meaning of each statement below. Pay attention to how changing the quantifiers and
  their order changes the meaning.

  #parts(
    [$forall x, forall y, K(x, y)$],
    [$forall x, y, (K(x, y) ==> K(y, x))$],
    [$forall x, exists y, K(x, y)$],
    [$exists x, forall y, K(x, y)$],
    [$exists x, exists y, K(x, y)$],
    [$exists x, y, ((x != y) and K(x, y))$],
  )
]

#exercise(
  title: [Quantifiers --- Evaluating],
  source: 27,
  goal: [A capstone: how comfortable are you interpreting quantified statements?],
)[
  For each statement below, decide whether it is true or false --- and whether it remains so if the
  order of the quantifiers is reversed. Explain your reasoning.

  #parts(
    [$forall x in RR, exists y in RR, (x + y = 0)$],
    [$forall x in NN, exists y in NN, (x < y)$],
    [$forall x in ZZ, exists y in ZZ, (x + y = 7)$],
    [$forall x in RR, exists y in RR, (y^2 = x)$],
    [$forall x in RR, exists y in RR, (y = x^2)$],
  )
]

#exercise(
  title: [Quantifiers --- Exchanging Quantifiers],
  source: 28,
  goal: [Reflect on the order of quantification.],
)[
  Let $U$ be a universe of discourse and $P(x, y)$ a predicate in the variables $x$ and $y$.

  #parts(
    [Is it possible that $forall x, exists y, P(x, y)$ is true but $exists x, forall y, P(x, y)$ is
      false? Prove your answer.],
    [Is it possible that $forall x, exists y, P(x, y)$ is true but $exists y, forall x, P(x, y)$ is
      false? Prove your answer.],
    [Is it possible that $exists x, forall y, P(x, y)$ is true but $forall x, exists y, P(x, y)$ is
      false? Prove your answer.],
    [Is it possible that $exists y, forall x, P(x, y)$ is true but $forall x, exists y, P(x, y)$ is
      false? Prove your answer.],
  )
]
