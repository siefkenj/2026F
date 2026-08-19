#import "preamble.typ": *
#show: mat246-theme.with([Induction])

// Problems ported from *Practicing Proofs: MAT246 Handouts* (ElGarem, Gross,
// Matos Wiederhold, Yoshinobu; University of Toronto, 2025), CC BY-SA 4.0.
// https://danaernst.com/IBL-IntroToProof/PracticingProofs.pdf
//
// Covers textbook Chapter 4 (Introduction to Induction, More on Induction,
// Complete Induction, The Well-Ordering Principle).

#title-slide()

#slide(title: [Where We Are Going])[
  Induction is the first genuinely *infinite* proof technique you will meet: a finite argument that
  establishes infinitely many statements.

  - *Ordinary induction* --- base case, inductive step, done.
  - *Complete (strong) induction* --- when $P(n+1)$ needs more than just $P(n)$.
  - *The Well-Ordering Principle* --- every nonempty subset of $NN$ has a least element.

  The last two turn out to be _equivalent_ to ordinary induction. We will prove that.
]

// ---------------------------------------------------------------------------
// 4.1 Introduction to induction (Practicing Proofs, Ch. 10)
// ---------------------------------------------------------------------------

#exercise(
  title: [Induction --- Inductive Reasoning],
  source: 69,
  goal: [Reflect on the axiom of induction, and on why it is plausible.],
  size: .95em,
)[
  A common metaphor for induction is a chain of dominoes: if the first one falls, and each domino
  knocks over the next, then they all fall.

  #parts(
    [Let $P: NN -> {"True", "False"}$ be a predicate on $NN$. Suppose $P(1)$ is true and
      $(forall n in NN)(P(n) ==> P(n+1))$. Prove $P(2)$, $P(3)$, $P(4)$.],
    [How would you go about proving that $P(100)$ is true? (You are not asked to actually prove
      it!)],
    [Can you explain informally why, from the two assumptions above, it is plausible to conclude
      that $P(n)$ is true for _all_ natural numbers $n$?],
    [A tough question worth reflecting on carefully: why do we need a whole new *axiom* of
      induction? Can we not prove $(forall n in NN) P(n)$ directly?],
    threshold: 2,
  )
]

#exercise(
  title: [Induction --- Recap],
  source: 70,
  goal: [Reconstruct the key example from the textbook on your own. For this exercise, do _not_ refer back to the text or your notes!],
  size: .95em,
)[
  The $n$-th *triangular number* $T_n$ is defined by $display(T_n = (n(n+1))/2)$.

  #parts(
    [Compute the first five triangular numbers.],
    [Consider the claim: _the sum of the first $n$ natural numbers is the $n$-th triangular
      number._ Use mathematical notation to define a predicate $P(n)$ of the form $a = b$ expressing
      this claim. Our goal is to prove $(forall n in NN) P(n)$ by induction.],
    [What is $P(1)$? Is it true? This is the *base case*.],
    [What is $P(n+1)$? The *inductive step* is the proof that $P(n) ==> P(n+1)$; we call $P(n)$ the
      *inductive hypothesis*.],
    [Use direct proof to show $P(n) ==> P(n+1)$.],
    [Can you summarize the proof pattern we have just used? What are the key steps of an inductive
      proof?],
    threshold: 2,
  )
]

#exercise(
  title: [Induction --- Writing Inductive Proofs],
  source: 71,
  goal: [Translate an informal statement into a formal one, then prove it inductively.],
)[
  We will prove that _the sum of the first $n$ odd natural numbers is the $n$-th square number._

  #parts(
    [Verify the first five cases of the claim.],
    [Define a predicate $P(n)$ of the form $a = b$ expressing the claim mathematically.],
    [What is $P(1)$?],
    [What is $P(n+1)$?],
    [Use direct proof to prove $P(n) ==> P(n+1)$.],
  )
]

#exercise(
  title: [Induction --- Writing Inductive Proofs II],
  source: 72,
  goal: [A problem as it would appear on an exam. Write a complete proof!],
)[
  Use mathematical induction to prove that for every $n in NN$,
  $
    1 dot 2 + 2 dot 3 + 3 dot 4 + dots.c + n(n+1) = (n(n+1)(n+2))/3.
  $

  Make sure to define a predicate and clearly explain each step of your proof.
]

#exercise(
  title: [Induction --- A False Proof],
  source: 73,
  goal: [Play the role of peer-reviewer: criticize an inductive argument.],
)[
  Define the predicate $P(n)$ by
  $
    1 + 2 + 4 + dots.c + 2^n = 2^(n+1) + 1.
  $

  #parts(
    [What is the assertion $P(n+1)$?],
    [Use direct proof to show that $forall n in NN, (P(n) ==> P(n+1))$.],
    [What is $P(3)$? Is it true?],
    [Why have we _not_ shown $forall n in NN, P(n)$? Is induction wrong after all?],
    [*Challenge.* Can you "correct" the claim --- find a very similar predicate that _is_ true for
      every natural number?],
    threshold: 3,
  )
]

// ---------------------------------------------------------------------------
// 4.2 More on induction (Practicing Proofs, Ch. 11)
// ---------------------------------------------------------------------------

#exercise(
  title: [Induction --- Asymptotic Growth],
  source: 74,
  goal: [Induction can prove statements that are only _eventually_ true.],
)[
  Recall that $n!$ ("$n$ factorial") is the product of the first $n$ integers,
  $n! = 1 dot 2 dot 3 dots.c n$.

  Use mathematical induction to prove that *eventually* the following inequality holds:
  $
    n! > 2^n.
  $

  Remember to define a predicate, and to clearly label the inductive hypothesis and where it is
  used. (Part of the problem is deciding what "eventually" should mean here.)
]

#exercise(
  title: [Induction --- Asymptotic Growth II],
  source: 75,
  goal: [This looks like the previous exercise, but the inductive step needs one more idea than plain substitution. Be alert!],
)[
  Use mathematical induction to prove that *eventually* the following inequality holds:
  $
    n^n > n!.
  $

  Remember to define a predicate, and to clearly label the inductive hypothesis and where it is
  used.
]

#exercise(
  title: [Induction --- Convergence],
  source: 76,
  goal: [Induction is not only about the natural numbers --- here it does work in analysis.],
  size: .85em,
)[
  The *double factorial* skips every other multiplicand:
  $
    n!! = n dot (n-2) dot (n-4) dots.c a,
  $
  where $a = 1$ if $n$ is odd and $a = 2$ if $n$ is even. (Careful: $n!! != (n!)!$. In fact
  $n!! < n! < (n!)!$ for every $n >= 2$.)

  #parts(
    [Compute $n!!$ for $n = 1, 2, dots, 10$.],
    [The factorial has the recursive definition $(n+1)! = (n+1) dot n!$. Find a similar recursive
      definition for the double factorial.],
    [Define $display(a_n = ((2n-1)!!)/((2n)!!))$. Compute the first five terms of the sequence.],
    [Derive a recurrence for $a_(n+1)$ in terms of $a_n$.],
    [Use mathematical induction to prove
      $
        1/sqrt(4n) <= a_n <= 1/sqrt(2n+1).
      $
      Conclude that $a_n$ converges to $0$.],
    threshold: 2,
  )
]

#exercise(
  title: [Induction --- Convergence II],
  source: 77,
  goal: [Induction proving convergence of an infinite _product_ --- with different patterns for odd and even terms.],
  size: .9em,
)[
  Consider the sequence ${p_n}_(n=1)^oo$ whose $n$-th term is the product
  $
    p_n = product_(k=1)^n (1 + (-1)^k/(k+1)).
  $

  #parts(
    [Compute the first six terms of the sequence.],
    [Do you see a pattern? Conjecture a formula for the odd terms $p_(2n-1)$ and for the even terms
      $p_(2n)$.],
    [Use mathematical induction to prove your conjecture about the odd terms $p_(2n+1)$.],
    [Prove your conjecture about the even terms $p_(2n)$.],
    [Conclude that the infinite product $display(product_(k=1)^oo (1 + (-1)^k/(k+1)))$ converges,
      and find its limit.],
    threshold: 3,
  )
]

// ---------------------------------------------------------------------------
// 4.3 Complete induction (Practicing Proofs, Ch. 12)
// ---------------------------------------------------------------------------

#slide(title: [Complete (Strong) Induction])[
  In ordinary induction the inductive step may use $P(n)$ only.

  In *complete induction* it may use *all* of $P(1), P(2), dots, P(n)$.

  This is what you need whenever the object at stage $n+1$ is built out of _several_ earlier
  stages --- recurrences like $a_n = a_(n-1) + a_(n-2)$ are the standard example.

  #v(.3em)
  Watch your *base cases*: a recurrence that reaches back two steps needs two of them.
]

#exercise(
  title: [Complete Induction --- Recurrence],
  source: 78,
  goal: [The Lucas sequence: same recurrence as Fibonacci, different starting conditions. Compare with Problem 4.29 in the text.],
)[
  Let $a_1 = 1$, $a_2 = 3$, and $a_n = a_(n-1) + a_(n-2)$ for $n >= 3$.

  Prove by induction that $a_n < 2^n$ for all $n$.

  Remember to clearly define your predicate and prove the base case(s)!
]

#exercise(
  title: [Complete Induction --- Remainder Modulo 3],
  source: 79,
  goal: [A particular case of the Division Algorithm (the Quotient-Remainder formula).],
)[
  Use *complete induction* to prove that every integer $n >= 2$ can be expressed as
  $
    n = 3q + r, #h(1.5em) "with" q, r in ZZ_(>=0) "and" r in {0, 1, 2}.
  $

  Remember to clearly define your predicate and prove the base case(s)!
]

#exercise(
  title: [Complete Induction --- Making Change],
  source: 80,
  goal: [Practice strong induction. A variation on Problem 4.31 in the text.],
)[
  Suppose you have an infinite supply of \$6, \$10, and \$15 bills.

  Prove that any whole number of dollars greater than or equal to \$30 can be made exactly (no
  change required).

  For example, \$30 can be paid with five \$6 bills, three \$10 bills, or two \$15 bills.

  Remember to clearly define your predicate and prove the base case(s)!
]

#exercise(
  title: [Complete Induction --- Fibonacci],
  source: 81,
  goal: [Induction proving a closed form for a recursive relation.],
)[
  The Fibonacci sequence is given by $f_1 = f_2 = 1$ and $f_n = f_(n-1) + f_(n-2)$ for $n >= 3$:
  $
    1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, dots
  $

  Use complete induction to prove that
  $
    f_n = ((1 + sqrt(5))^n - (1 - sqrt(5))^n) / (2^n sqrt(5)).
  $

  Remember to clearly define your predicate and prove the base case(s)!
]

#exercise(
  title: [Complete Induction --- Divisibility],
  source: 82,
  goal: [An inductive statement that holds only for _some_ natural numbers, which are not consecutive.],
)[
  Let $a, b in NN$ be two fixed natural numbers (we do not know which).

  Prove by mathematical induction that for every *odd* natural number $n$, the number $a + b$
  divides $a^n + b^n$.

  It may not be immediately apparent how to use the inductive hypothesis here.
]

// ---------------------------------------------------------------------------
// 4.4 The well-ordering principle (Practicing Proofs, Ch. 13)
// ---------------------------------------------------------------------------

#slide(title: [The Well-Ordering Principle])[
  #thm[Well-Ordering Principle][
    Every *nonempty* subset of $NN$ has a *least* element.
  ]

  Every word in that statement is doing work. Drop "nonempty" and it is false; replace $NN$ by $ZZ$
  and it is false; replace "least" by "greatest" and it is false.

  #v(.3em)
  It is also *equivalent* to the axiom of induction --- each can be proved from the other.
]

#exercise(
  title: [Well-Ordering --- Maximum and Minimum],
  source: 83,
  goal: [Practice the definitions of minimum and maximum.],
)[
  Find the maximum and minimum, if they exist, of each of the following sets. Use the *definitions*
  of maximum and minimum to prove your answers.

  #parts(
    [$NN$],
    [$ZZ$],
    [$emptyset$],
    [$A = {n in NN : n "is a multiple of" 3}$],
    [$B = {z in ZZ : z > 11}$],
    [$C = {r in RR : 0 < r < 1} = (0, 1)$],
    [$D = {x in RR : 0 <= x <= 1} = [0, 1]$],
  )
]

#exercise(
  title: [Well-Ordering --- Spot the Error],
  source: 84,
  goal: [Common errors seen on solutions. Can you identify and correct them?],
)[
  Identify the error in each statement below, and give a set that serves as a counterexample.

  #parts(
    [Every subset of $NN$ has a least element.],
    [Every nonempty subset of $ZZ$ has a least element.],
    [Every nonempty subset of $NN$ has a greatest element.],
    threshold: 3,
  )
]

#exercise(
  title: [Well-Ordering --- from Induction],
  source: 85,
  goal: [Develop carefully the proof outline given in the text.],
)[
  We show that the principle of mathematical induction *implies* the Well-Ordering Principle.

  #parts(
    [For the sake of contradiction, suppose $S$ is a nonempty subset of $NN$ with no least element.
      Define the predicate $P(n) := n in.not S$. Use induction to prove $forall n in NN, P(n)$.],
    [Why do we now have a contradiction? Conclude that $S$ must have a least element.],
  )

  You have now proved that if the principle of mathematical induction holds, then the well-ordering
  principle holds. (Can you explain why?)
]

#exercise(
  title: [Well-Ordering --- Induction from Well-Ordering],
  source: 86,
  goal: [The converse direction: well-ordering implies induction.],
)[
  We prove that the Well-Ordering Principle implies the Axiom of Induction.

  Let $S subset NN$ be such that

  - $1 in S$, and
  - $forall n in NN, [(n in S) ==> (n + 1 in S)]$.

  Suppose towards a contradiction that $S != NN$, and consider $S^c = {n in NN : n in.not S}$. Use
  the well-ordering principle to arrive at a contradiction. Be sure to carefully justify each step.

  You have now proved that if the well-ordering principle holds, then so does the principle of
  mathematical induction. (Can you explain why?)
]

#exercise(
  title: [Well-Ordering --- Using It],
  source: 87,
  goal: [Since well-ordering is equivalent to induction, we should be able to use it wherever we would use induction.],
)[
  Use the *well-ordering principle* to prove that
  $
    2 + 4 + dots.c + 2n = n(n+1).
  $

  *Do not use induction.*
]

#exercise(
  title: [Well-Ordering --- Division with Remainder],
  source: 88,
  goal: [Sometimes well-ordering is far more convenient than induction. Here is the full division theorem.],
  size: .85em,
)[
  #thm[Division with Remainder][
    For every $n, m in NN$ there exist $q in ZZ_(>=0)$ and $r in {0, 1, dots, m-1}$ such that
    $n = q m + r$. Furthermore $q$ and $r$ are *unique*. We call $q$ the *quotient* and $r$ the
    *remainder* of dividing $n$ by $m$.
  ]

  #parts(
    [Let $m, n in NN$ be arbitrary and consider
      $S = {x in ZZ_(>=0) : exists q in ZZ_(>=0), x = n - q m}$. Prove that $S$ is nonempty.],
    [Let $r$ be the minimal element of $S$. Prove that $r in {0, 1, dots, m-1}$. (Here we use the
      generalized well-ordering principle: $S$ is a subset of the integers bounded below by $0$.)],
    [Conclude that there exist $q in ZZ_(>=0)$ and $r in {0, 1, dots, m-1}$ with $n = q m + r$.],
    [Suppose $q, q' in ZZ_(>=0)$ and $r, r' in {0, 1, dots, m-1}$ satisfy
      $n = q m + r = q' m + r'$. Prove that $q = q'$ and $r = r'$.],
    threshold: 2,
  )
]

#exercise(
  title: [Well-Ordering --- Spot the Error II],
  source: 89,
  goal: [Well-ordering has its own common but not-so-obvious false steps. Can you spot this one?],
  size: .85em,
)[
  Recall the Fibonacci sequence $f_1 = f_2 = 1$, $f_n = f_(n-1) + f_(n-2)$ for $n >= 3$:
  $1, 1, 2, 3, 5, 8, 13, 21, 34, 55, dots$

  Here is a "proof" that all Fibonacci numbers are even. Identify and explain the error.

  #boxed(accent: rgb("#7a1f1f"))[
    *Proof attempt.* Let $S = {n in NN : f_n "is odd"}$ be the set of counterexamples. We prove $S$
    is empty using the well-ordering principle.

    Assume for contradiction that $S$ is nonempty, so by the well-ordering principle it has a
    minimal element, say $s in S$. Now $f_s = f_(s-1) + f_(s-2)$. Since $s$ is the minimal element
    of $S$, we know $s-1, s-2 in.not S$, so $f_(s-1)$ and $f_(s-2)$ must be even. Therefore
    $f_s = f_(s-1) + f_(s-2)$ is also even, contradicting $s in S$.

    We supposed $S$ is nonempty and arrived at a contradiction. This proves $S$ is empty, so all
    Fibonacci numbers are even. #h(1fr) $qed$
  ]
]

#exercise(
  title: [Well-Ordering --- Roundabout],
  source: 90,
  goal: [A classic result where well-ordering is far easier than induction. Challenge yourself!],
)[
  The mythical country *Maths* has a finite number of cities, connected by a finite number of
  *one-way* roads, in such a way that each city is reachable from any other city (though not
  necessarily by a direct route).

  Prove that it is possible to plan a *round trip* --- a tour starting and ending at the same city
  --- which does not visit any city more than once. (The starting city is "visited" exactly twice:
  at the beginning and at the end.)

  You may choose the starting point, and your tour need not visit every city.
]
