#import "preamble.typ": *
#show: mat246-slides.with([Relations and Partitions], sources: (practicing_proofs,))

// Problems ported from *Practicing Proofs: MAT246 Handouts* (ElGarem, Gross,
// Matos Wiederhold, Yoshinobu; University of Toronto, 2025), CC BY-SA 4.0.
// https://danaernst.com/IBL-IntroToProof/PracticingProofs.pdf
//
// Covers textbook Chapter 7 (Relations, Equivalence Relations, Partitions,
// Modular Arithmetic).
//
// Note: the handout draws several relations as figures. Those are images in
// the PDF, so the digraphs below are drawn here with `digraph` and are not
// pixel-copies of the handout's.


#slide(title: [Where We Are Going])[
  A *relation* is nothing more than a subset of $A times B$ --- but that bare definition supports a
  surprising amount of structure.

  - *Relations* and their properties: reflexive, symmetric, transitive, antisymmetric.
  - *Equivalence relations* and *equivalence classes*.
  - *Partitions* --- and the fact that partitions and equivalence relations are two descriptions of
    the same thing.
  - *Representatives* and modular arithmetic: when can we define an operation on classes by working
    with representatives?

  The chapter ends by building $ZZ$ out of $NN$, and $QQ$ out of $ZZ$, using nothing but equivalence
  classes.
]

// ---------------------------------------------------------------------------
// 7.1 Relations (Practicing Proofs, Ch. 14)
// ---------------------------------------------------------------------------

#exercise(
  title: [Relations --- Describing Relations],
  source: 91,
  goal: [Three common ways of depicting a relation: as a set, as a digraph, and as a logical table.],
)[
  Let $X = {1, 2, dots, 10}$ and $Y = {a, b, c, d, e}$. Define a relation $R$ from $X$ to $Y$ by:

  - $a$ is related to every element;
  - $b$ is related to the even elements and to no odd element;
  - $3 R c$, $6 R c$, and $9 R c$;
  - $4 R d$ and $8 R d$;
  - $5 R e$ and $10 R e$.

  + Is $R subset X times Y$ or $R subset Y times X$?
  + Write out the set $R$.
  + Draw a directed graph depicting $R$.
  + Complete the *logical table* for $R$: the elements of $X$ label the rows and those of $Y$ the
    columns; the cell in row $x$ and column $y$ holds $1$ if $x R y$, and $0$ otherwise.
]

#exercise(
  title: [Relations --- Properties of Relations],
  source: 92,
  goal: [Practice the common properties of relations. We will meet them again in later sections.],
)[
  Let $S$ be the set of all students at the University of Toronto, and define relations on $S$:
  - $a C b$ #h(.4em) iff $a$ has taken more courses than $b$.
  - $a D b$ #h(.4em) iff $a$ and $b$ are in the same degree program.
  - $a N b$ #h(.4em) iff $a$ and $b$ have no course in common this semester.
  - $a S b$ #h(.4em) iff $a$ and $b$ have at least one course in common.

  For each relation, determine *with an explanation* which of the properties below it has.

  #align(center, table(
    columns: 4,
    align: center,
    [], [reflexive], [symmetric], [transitive],
    [$C$], [], [], [],
    [$D$], [], [], [],
    [$N$], [], [], [],
    [$S$], [], [], [],
  ))
]

#exercise(
  title: [Relations --- Describing Properties (reflexive)],
  source: 93,
  goal: [The same properties, seen through each of the three representations.],
)[
  Consider relations on the set $A := {a, b, c, d, e}$, represented either as a *logical table* or
  as a *digraph*.

  + Suppose $R$ is a *reflexive* relation on $A$. How would you fill the logical table to reflect
    this? How would you modify the digraph?
  + Suppose you must determine whether a relation is reflexive. How would you do it if the relation
    is given as a set? As a digraph? As a logical table? Which description would you rather
    receive, and why?
]

#exercise(
  title: [Relations --- Describing Properties (symmetric, transitive)],
  source: 93,
  goal: [Now the same three representations, for symmetry and transitivity.],
)[
  3. Suppose $S$ is a *symmetric* relation on $A$ with $b S b$, $c S d$, and $e S a$. How would you
    fill the logical table to reflect these facts? How would you modify the digraph?
  + How would you determine whether a relation is symmetric from each of the three descriptions?
    Which would you prefer, and why?
  + Which of the three descriptions would you prefer if you had to determine whether a relation is
    *transitive*?
]

#exercise(
  title: [Relations --- Counting Relations],
  source: 94,
  goal: [Think through the definition of a relation by counting.],
)[
  + If $R$ is a relation on ${1, 2, 3}$, then $R$ is a subset of which set?
  + How many different relations on ${1, 2, 3}$ are there? What about on ${1, 2, dots, n}$?
  + If $R$ is a *reflexive* relation on ${1, 2, 3}$, which elements must $R$ contain?
  + How many different reflexive relations on ${1, 2, 3}$ are there? On ${1, 2, dots, n}$?
  + How many relations on ${1, 2, 3}$ are both reflexive *and* symmetric? On ${1, 2, dots, n}$?
  + List all relations on ${1, 2, 3}$ that are reflexive, symmetric, *and* transitive.
]

#exercise(
  title: [Relations --- Weak Ordering],
  source: 95,
  goal: [Order relations are everywhere --- you already know several examples.],
)[
  #definition(title: [Antisymmetric / Ordering])[
    A relation $R$ on $A$ is *antisymmetric* if for all $a, b in A$, $a R b$ and $b R a$ together
    imply $a = b$.

    $R$ is a *(weak) ordering* if it is reflexive, antisymmetric, and transitive.
  ]

  Prove that each of the following relations is an ordering.

  + The relation $<=$ on $NN$.
  + The relation $subset$ on $cal(P)({1, 2, 3})$.
  + The divisibility relation on $NN$ (that is, $a R b$ if and only if $a divides b$).
]

#exercise(
  title: [Relations --- Strict Ordering],
  source: 96,
  goal: [Think of the difference between $<=$ and $<$. Each definition can be derived from the other.],
)[
  #definition(title: [Asymmetric / Strict Ordering])[
    A relation $R$ on $A$ is *asymmetric* if for all $a, b in A$, $a R b$ implies $not (b R a)$.

    $R$ is a *strict ordering* if it is asymmetric and transitive.
  ]

  + Prove that $<$ on $NN$ is a strict ordering.
  + Prove that a strict ordering is necessarily *irreflexive*: for all $a in A$, $not (a R a)$.
  + Let $R$ be a weak ordering on $A$. Define $S$ by $a S b <==> (a R b "and" a != b)$. Prove $S$
    is a strict ordering on $A$.
  + Let $S$ be a strict ordering on $A$. Define $R$ by $a R b <==> (a S b "or" a = b)$. Prove $R$
    is a weak ordering on $A$.
]

// ---------------------------------------------------------------------------
// 7.2 Equivalence relations (Practicing Proofs, Ch. 15)
// ---------------------------------------------------------------------------

#slide(title: [Equivalence Relations])[
  #definition(title: [Equivalence Relation])[
    A relation $tilde.op$ on a set $A$ is an *equivalence relation* if it is *reflexive*,
    *symmetric*, and *transitive*.

    The *equivalence class* of $a in A$ is $[a] := {x in A : x tilde.op a}$.
  ]

  An equivalence relation is a way of declaring certain elements "the same for present purposes".
  Its equivalence classes then chop $A$ into disjoint pieces --- which is exactly what a *partition*
  is. That correspondence is the main theorem of this chapter.
]

#exercise(
  title: [Equivalence --- Real-World Relations],
  source: 97,
  goal: [Practice the definitions of equivalence relation and equivalence class.],
)[
  Recall the relations on the set $S$ of all students at the University of Toronto:
  - $a C b$ #h(.4em) iff $a$ has taken more courses than $b$.
  - $a D b$ #h(.4em) iff $a$ and $b$ are in the same degree program.
  - $a N b$ #h(.4em) iff $a$ and $b$ have no course in common this semester.
  - $a S b$ #h(.4em) iff $a$ and $b$ have at least one course in common.

  For each relation, determine whether it is an equivalence relation. If it is, describe its
  equivalence classes.
]

#exercise(
  title: [Equivalence --- String Length],
  source: 98,
  goal: [The same practice, with a more mathematical example.],
)[
  Let $S$ be the set of all words in the English language. For $w_1, w_2 in S$, define
  $w_1 tilde.op w_2$ if they have the same length (number of letters).

  So $"cat" tilde.op "dog"$, since each has exactly $3$ letters. But
  $"cat" tilde.not "bird"$, since $"cat"$ has length $3$ while $"bird"$ has length $4$.

  Prove that $tilde.op$ is an equivalence relation, and describe its equivalence classes.
]

#exercise(
  title: [Equivalence --- Digraphs],
  source: 99,
  goal: [Interpret relations presented as digraphs.],
)[
  For each digraph below, determine whether the relation it depicts is an equivalence relation. If
  not, explain which properties fail. If so, list the equivalence classes.

  #v(.4em)
  #align(center, grid(
    columns: 3,
    column-gutter: 2em,
    row-gutter: .3em,
    digraph(
      (("a", (0, 0)), ("b", (1.4, 0)), ("c", (0, -1.3)), ("d", (1.4, -1.3))),
      edges: (("a", "b"), ("b", "a"), ("c", "d"), ("d", "c")),
      loops: ("a", "b", "c", "d"),
      scale: 1.1,
    ),
    digraph(
      (("a", (0, 0)), ("b", (1.4, 0)), ("c", (0, -1.3)), ("d", (1.4, -1.3))),
      edges: (("a", "b"), ("b", "a"), ("c", "d"), ("d", "c")),
      loops: ("a", "b", "c"),
      scale: 1.1,
    ),
    digraph(
      (("a", (0, 0)), ("b", (1.4, 0)), ("c", (2.8, 0)), ("d", (1.4, -1.3))),
      edges: (("a", "b"), ("b", "a"), ("b", "c"), ("c", "b")),
      loops: ("a", "b", "c", "d"),
      scale: 1.1,
    ),
    [(a)], [(b)], [(c)],
  ))
]

#exercise(
  title: [Equivalence --- A Common Misconception],
  source: 100,
  goal: [Read a short proof and spot the subtle error.],
)[
  Below is a "proof" that every symmetric and transitive relation is reflexive (and hence an
  equivalence relation). Explain the error, and *prove* it is an error by constructing a
  counterexample.

  #bogus_proof[
    *Proof.* Let $tilde.op$ be a relation on a set $X$ that is symmetric and transitive. We prove
    $tilde.op$ is reflexive, and therefore an equivalence relation.

    Let $a in X$ be arbitrary. For any $b in X$ such that $a tilde.op b$, we have $b tilde.op a$ by
    symmetry. Since $a tilde.op b$ and $b tilde.op a$, transitivity gives $a tilde.op a$. This
    proves $tilde.op$ is reflexive. #h(1fr) $qed$
  ]
]

#exercise(
  title: [Equivalence --- Multifunctional Relations],
  source: 101,
  goal: [Prove a new theorem about a new concept --- then use it right away on a novel relation.],
)[
  A relation $R$ on a set $X$ is *multifunctional* if
  $
    forall x in X, exists y in X, (x R y).
  $
  For example, $R$ on $RR$ defined by $x R y <==> x^2 = y$ is multifunctional. (Do you see why?)

  + Prove that if $R$ is multifunctional, symmetric, and transitive, then $R$ is an equivalence
    relation.
  + Consider the relation $tilde.op$ on $M_n (RR)$ (the $n times n$ matrices with real entries)
    defined by $A tilde.op B <==> A - B$ is invertible. Which of reflexivity, symmetry,
    transitivity, and multifunctionality does $tilde.op$ have? Justify your answer.
]

#exercise(
  title: [Equivalence --- Remainders],
  source: 102,
  goal: [The most fundamental example of an equivalence relation: modular arithmetic.],
)[
  #theorem(title: [Division with Remainder])[
    For every $n, m in NN$ there exist unique $q in ZZ_(>=0)$ and $r in {0, 1, dots, m-1}$ such that
    $n = q m + r$.
  ]

  Fix $m in NN$ and define $M$ on $NN$ by $a M b$ if and only if $a$ and $b$ have the same remainder
  when divided by $m$.

  + Suppose $a >= b$. Prove that $a M b$ if and only if $m divides (b - a)$. (Here we assume every
    natural number divides $0$; formally, $x divides y <==> exists q in ZZ_(>=0), y = x q$.)
  + Prove that $M$ is an equivalence relation.
  + What are the equivalence classes for $m = 3$? For $m = 5$? What about $m = 1$?
  + Define $D$ on $NN$ by $a D b$ if and only if $a$ and $b$ end in the same digit. Prove that $D$
    is an equivalence relation.
]

#exercise(
  title: [Equivalence --- Advanced Mathematics],
  source: 103,
  goal: [Two famous equivalence relations from more advanced courses.],
)[
  + Consider $R$ on $RR$ defined by $x R y <==> y - x in ZZ$. Prove $R$ is an equivalence relation
    and describe its equivalence classes.
  + Consider $Q$ on $RR$ defined by $x Q y <==> y - x in QQ$. Prove $Q$ is an equivalence relation.
    Can you describe its equivalence classes?
]

// ---------------------------------------------------------------------------
// 7.3 Partitions (Practicing Proofs, Ch. 16)
// ---------------------------------------------------------------------------

#exercise(
  title: [Partitions --- Counting],
  source: 104,
  goal: [Practice the definition of a partition. Try this without referring back to the text!],
)[
  + Recall the definition of a partition.
  + One common way of representing data is a pie chart. Explain how a pie chart corresponds to a
    partition of the pie.
  + How many partitions of $emptyset$ are there?
  + How many partitions of ${1}$ are there? What about ${1, 2}$?
  + How many partitions of ${1, 2, 3}$ are there?
]

#exercise(
  title: [Partitions --- Find the Partitions],
  source: 105,
  goal: [Practice the definition of a set partition. Try to recall it before consulting your notes!],
)[
  For each set $A_i$ and each collection $Omega_j$, determine whether $Omega_j$ is a partition of
  $A_i$. If not, explain why not.

  + Let $A_1 = {1, 2, 3, 4, 5, 6}$.
    #enum(
      [$Omega_1 = {{1,2}, {2,3,4}, {4,5,6}}$],
      [$Omega_2 = {{1}, {2,3,6}, {4}, {5}}$],
      [$Omega_3 = {{2,4,6}, {1,3,5}}$],
      [$Omega_4 = {{1,4,5}, {2,6}}$],
      [$Omega_5 = {{1,2,3,4}, {5,6}, {}}$],
      [$Omega_6 = {{1,2,3,4,5,6}}$],
    )
  + Let $A_2 = ZZ$.
    #enum(
      [$Omega_7$ contains the set of even integers and the set of odd integers.],
      [$Omega_8$ contains the set of positive integers and the set of negative integers.],
      [$Omega_9$ contains the integers strictly less than $-100$, those with absolute value
        $<= 100$, and those strictly greater than $100$.],
      [$Omega_10$ contains the integers not divisible by $3$, the even integers, and the integers
        with remainder $3$ when divided by $6$.],
    )
]

#exercise(
  title: [Partitions --- Find the Partitions II],
  source: 106,
  goal: [Slightly more challenging partition-spotting. Think about the pie-chart analogy.],
)[
  Is $Omega_j$ a partition of $A_i$? If not, why not?

  Let $A_1 = ZZ times ZZ$. In each case $Omega_j$ is the set containing the set of pairs $(x, y)$
  where...

  + $x$ or $y$ is odd; $x$ is even; $y$ is even.
  + both $x$ and $y$ are odd; exactly one of $x$, $y$ is odd; both are even.
  + $x$ is positive; $y$ is positive; both $x$ and $y$ are negative.
  + $x > 0$ and $y > 0$; $x <= 0$ and $y > 0$; $x <= 0$ and $y <= 0$.
  + $x != 0$ and $y != 0$; $x = 0$ and $y != 0$; $x != 0$ and $y = 0$.
]

#exercise(
  title: [Partitions --- Find the Partitions II (cont.)],
  source: 106,
  goal: [The same question over the real line.],
)[
  Is $Omega_j$ a partition of $A_2 = RR$? If not, why not?

  + $Omega_6 = {{x in RR | x < 0}, {0}, {x in RR | x > 0}}$
  + $Omega_7 = {"the irrationals", "the rationals"}$
  + $Omega_8$ contains the intervals $[k, k+1]$, $k in ZZ$.
  + $Omega_9$ contains the intervals $(k, k+1)$, $k in ZZ$.
  + $Omega_10$ contains the intervals $(k, k+1]$, $k in ZZ$.
]

#exercise(
  title: [Partitions --- Constructing Partitions],
  source: 107,
  goal: [Among the infinitely many partitions of $NN$, find some with specific properties. (A variation on Exercise 7.56 in the text.)],
)[
  + Find a partition of $NN$ with exactly $3$ blocks, where $2$ blocks are finite and the third is
    infinite.
  + Find a partition of $NN$ with infinitely many blocks.
  + Find a partition of $NN$ with exactly $3$ blocks, each of which is infinite.
  + Our definition of a partition requires three conditions. For *each* condition, find a
    collection of subsets of $NN$ that fails that condition but satisfies the other two.
]

#exercise(
  title: [Partitions --- Relations from Subsets],
  source: 108,
  goal: [Partitions and equivalence relations are two sides of one coin. Here is the bridge.],
)[
  Recall (Definition 7.62 in the text) that given a collection $Omega$ of subsets of $A$, the
  *associated relation* $R_Omega$ is defined by
  $
    a R_Omega b <==> exists X in Omega "such that" a, b in X.
  $

  Let $A = {0, 1, 2, 3, 4, 5}$. For each collection $Omega_i$ below: (i) specify $R_(Omega_i)$ by
  listing its ordered pairs or drawing its digraph; (ii) determine whether $Omega_i$ is a partition;
  (iii) determine whether $R_(Omega_i)$ is an equivalence relation, and if so give its equivalence
  classes.

  + $Omega_1 = {{0}, {1,2}, {3,4,5}}$
  + $Omega_2 = {{0}, {1,2}, {3,4}}$
  + $Omega_3 = {{0,1}, {2,3}, {4,5}}$
  + $Omega_4 = {{0,1,2}, {3,4,5}}$
  + $Omega_5 = {{0,1}, {1,2,3}, {3,4,5}}$
  + $Omega_6 = {{0}, {1}, {2}, {3}, {4}, {5}}$
]

#exercise(
  title: [Partitions --- Relations and Partitions],
  source: 109,
  goal: [A capstone: prove the main theorems of §7.3 for yourself.],
)[
  As above, $a R_Omega b <==> exists X in Omega$ with $a, b in X$.

  + Prove that $R_Omega$ is always *symmetric*.
  + Prove that $R_Omega$ is *reflexive* if and only if $Omega$ covers $A$.
  + Prove that $R_Omega$ is *transitive* if the sets in $Omega$ are pairwise disjoint.
  + Find an example where the sets in $Omega$ are *not* pairwise disjoint but $R_Omega$ is still
    transitive.
  + Conclude that if $Omega$ is a partition of $A$, then $R_Omega$ is an equivalence relation on
    $A$.
  + Suppose $Omega$ is a partition of $A$, so $R_Omega$ is an equivalence relation. What are its
    equivalence classes?
  + Suppose $R_Omega$ is an equivalence relation on $A$. Prove that the equivalence classes form a
    partition of $A$.
]

#exercise(
  title: [Partitions --- Relations and Partitions II],
  source: 110,
  goal: [Every partition gives an equivalence relation. Now the converse (Theorem 7.59 in the text).],
)[
  Suppose $R$ is an equivalence relation on $A$.

  Prove that the equivalence classes of $R$ form a *partition* of $A$.

  Together with the previous exercise, this establishes the claim that equivalence relations and
  partitions are two sides of the same coin: you can specify either one by specifying the other.
]

#exercise(
  title: [Partitions --- Refinements],
  source: 111,
  goal: [A "refinement" compares how two partitions organize the same information.],
)[
  Let $A$ be a set and $Omega_1$, $Omega_2$ partitions of $A$. We say $Omega_1$ is a *refinement* of
  $Omega_2$ if
  $
    forall X in Omega_1, exists Y in Omega_2, (X subset Y).
  $

  + Let $A = {1,2,3,4,5,6}$, $Omega_1 = {{1,2}, {3}, {4}, {5,6}}$, and
    $Omega_2 = {{1,2,3}, {4,5,6}}$. Is $Omega_1$ a refinement of $Omega_2$? Justify your answer.
  + With $A$ and $Omega_2$ as above, give an example of a partition $Omega$ of $A$ (different from
    $Omega_1$) that is a refinement of $Omega_2$.
  + Let $P_1, P_2, P_3$ be partitions of a set $B$ with $P_1$ a refinement of $P_2$ and $P_2$ a
    refinement of $P_3$. Prove, or give a counterexample: $P_1$ is a refinement of $P_3$.
  + Each partition corresponds to an equivalence relation. How does "$Q_1$ is a refinement of
    $Q_2$" translate into a relationship between $R_(Q_1)$ and $R_(Q_2)$? Explain.
]

// ---------------------------------------------------------------------------
// 7.4 Representatives & modular arithmetic (Practicing Proofs, Ch. 17)
// ---------------------------------------------------------------------------

#slide(title: [Representatives])[
  Once we work with equivalence classes, we constantly want to define things _via representatives_:
  $
    [a] plus.o [b] := [a plus.square b].
  $

  But $[a]$ has many representatives. For this to define anything at all, the answer must not depend
  on which one we pick --- the operation must be *well-defined*:
  $
    [a] = [a'] "and" [b] = [b'] #h(1em) ==> #h(1em) [a plus.square b] = [a' plus.square b'].
  $

  This is not automatic. Checking it is the whole game in §7.4.
]

#exercise(
  title: [Representatives --- Three Equivalent Conditions],
  source: 112,
  goal: [Specializes and extends Theorem 7.42 in the text. Try it without looking back!],
)[
  Let $R$ be an equivalence relation on $A$. Prove that for any $a, b in A$ the following are
  equivalent:

  + $[a] = [b]$;
  + $a in [b]$;
  + $a R b$.
]

#exercise(
  title: [Representatives --- Operations],
  source: 113,
  goal: [Defining an operation on classes via representatives --- carefully, because it can fail to make sense!],
)[
  Consider $equiv_10$ on $ZZ$: $a equiv_10 b$ if and only if $10 divides (b - a)$ (equivalently, $a$
  and $b$ have the same last digit).

  Suppose $plus.square_i$ is a binary operation on $ZZ$, and define $plus.o_i$ on
  $ZZ\/equiv_10$ by $[a] plus.o_i [b] = [a plus.square_i b]$.

  In each case, determine *with proof* whether $plus.o_i$ is well-defined --- that is, whether
  $[a] = [a']$ and $[b] = [b']$ imply $[a] plus.o_i [b] = [a'] plus.o_i [b']$.

  + $a plus.square_1 b = a$.
  + $a plus.square_2 b$ is $0$ if $a + b$ is even, and $1$ if $a + b$ is odd.
  + $a plus.square_3 b$ is the remainder of $a + b$ when divided by $3$.
  + $a plus.square_4 b = min{a, b}$.
  + $a plus.square_5 b = 2a + 3b$.
]

#exercise(
  title: [Representatives --- Inherited Properties],
  source: 114,
  goal: [Properties of the operation on representatives are inherited by the operation on classes. Generalizes Theorems 7.92--7.93.],
)[
  Let $X$ be a set with a binary operation $plus.square$, and let $R$ be an equivalence relation on
  $X$ such that $[a] plus.o [b] = [a plus.square b]$ is well-defined.

  + Suppose $plus.square$ is *associative*: $(x plus.square y) plus.square z = x plus.square (y
    plus.square z)$ for all $x, y, z in X$. Prove $plus.o$ is associative on $X\/R$.
  + Suppose $plus.square$ is *commutative*: $x plus.square y = y plus.square x$. Prove
    $plus.o$ is commutative on $X\/R$.
  + Suppose $o in X$ is an *identity*: $o plus.square x = x$ for all $x in X$. Prove $plus.o$
    also has an identity element --- what is it?
  + Suppose every $x in X$ has an *inverse*: some $y in X$ with $x plus.square y = o$. Prove every
    class $A in X\/R$ also has an inverse.
  + Which parts of your proofs use the fact that $plus.o$ is well-defined?
]

#slide(title: [Two Capstone Exercises])[
  The next two exercises may look long and abstract --- do not be intimidated. They are capstones
  for the whole of Chapter 7.

  By the end you will have built:
  - the *integers* as equivalence classes of pairs of naturals, and
  - the *rationals* as equivalence classes of pairs of integers.

  This construction is ubiquitous in modern mathematics: $ZZ$ from $NN$, $QQ$ from $ZZ$, $RR$ from
  $QQ$. Even quantum mechanics is formulated on spaces whose "points" are equivalence classes of
  functions --- otherwise the distance between two points would not be well-defined.
]

#exercise(
  title: [Representatives --- The Integers (I)],
  source: 115,
  goal: [Building $ZZ$ out of $NN$. The pair $(a, b)$ is standing in for the difference $a - b$.],
)[
  On the set $cal(Z) = (NN union {0}) times NN$, define a relation $tilde.op$ by
  $
    (a, b) tilde.op (c, d) #h(1em) <==> #h(1em) a + d = b + c.
  $

  + Prove that $tilde.op$ is an equivalence relation.
  + Prove that $[(n, 0)]$ for $n in NN union {0}$, together with $[(0, n)]$ for $n in NN$, form a
    *complete system of representatives*: every $(a, b) in cal(Z)$ lies in one of these classes,
    and no two of these classes coincide.

  This lets us *define* the integers as the set of equivalence classes of $tilde.op$: we identify
  $n in NN union {0}$ with $[(n, 0)]$, and define the symbol $-n$ to mean $[(0, n)]$.
]

#exercise(
  title: [Representatives --- The Integers (II)],
  source: 115,
  goal: [Now equip the construction with addition --- and check that it deserves the name.],
)[
  + Define $plus.square$ on classes by $[(a,b)] plus.square [(c,d)] = [(a+c, b+d)]$. Prove this is
    well-defined.
  + We think of $ZZ$ as an extension of $NN union {0}$ by finding "a copy" of $NN union {0}$ inside
    it, identifying $n$ with $[(n, 0)]$. The operation just defined *respects* addition of natural
    numbers. Explain in your own words what this means.
  + We get "a copy of $NN$ with a minus sign" by declaring $-n$ to mean $[(0, n)]$. Prove that
    $n + (-n) = 0$, interpreting this as an operation on equivalence classes.
  + Use this identification to prove that $5 - 2 = 3$ and that $2 - 5 = -3$. (We write $x - y$ as
    shorthand for $x + (-y)$.)
]

#exercise(
  title: [Representatives --- The Integers (III)],
  source: 115,
  goal: [And now subtraction, which is the whole point of extending $NN$ to $ZZ$.],
)[
  5. Prove that $[(a,b)]$ is identified with $n in NN union {0}$ if and only if $[(b,a)]$ is
    identified with $-n$.
  + We therefore define $minus.square[(a,b)] = [(b,a)]$. Prove this is well-defined.
  + Define $[(a,b)] minus.square [(c,d)] = [(a,b)] plus.square (minus.square[(c,d)])$. What is this
    operation in terms of representatives --- find $e, f$ with
    $[(a,b)] minus.square [(c,d)] = [(e,f)]$. Is it well-defined? Check it by proving again that
    $2 - 5 = -3$.
]

#exercise(
  title: [Representatives --- The Rationals (I)],
  source: 116,
  goal: [The same idea builds $QQ$: the pair $(a, b)$ stands in for the fraction $a\/b$.],
)[
  When we first learn fractions we want $1/2$ to equal $2/4$, $3/6$, $(-4)/(-8)$, .... The symbol
  $1/2$ stands for infinitely many other symbols --- which is exactly what an equivalence relation
  is for.

  Let $cal(Q) = ZZ times (ZZ without {0})$ and define $tilde.op$ on $cal(Q)$ by
  $
    (a, b) tilde.op (c, d) #h(1em) <==> #h(1em) a d = b c.
  $

  + Prove that $tilde.op$ is an equivalence relation on $cal(Q)$.
  + Define $times.o$ by $[(a,b)] times.o [(c,d)] = [(a c, b d)]$. Prove $times.o$ is
    well-defined.
  + Prove that this operation works well with the identification of $z in ZZ$ with $[(z, 1)]$.
  + Use the definition of the symbol $a/b$ to prove that for any $z in ZZ without {0}$ we have
    $z times 1/z = 1$.
]

#exercise(
  title: [Representatives --- The Rationals (II)],
  source: 116,
  goal: [Why the naive definition of addition fails.],
)[
  When first learning fractions one wants to try $a/b plus.square c/d = (a+c)/(b+d)$. It does not
  work.

  + Define $plus.square$ on $cal(Q)$ by $[(a,b)] plus.square [(c,d)] = [(a+c, b+d)]$. Prove that
    $plus.square$ is *not* well-defined.
  + We must use the common-denominator definition instead. Define $plus.o$ by
    $[(a,b)] plus.o [(c,d)] = [(a d + b c, b d)]$. Prove that $plus.o$ is well-defined.
  + Prove that this operation works well with the identification of $z in ZZ$ with $[(z, 1)]$.
]

#exercise(
  title: [Representatives --- The Rationals (III)],
  source: 116,
  goal: [Just as $ZZ$ gave us a global subtraction, the point of $QQ$ is a global division.],
)[
  4. Define $div$ on $cal(Q) without {0}$ by $div[(a,b)] = [(b,a)]$, for $a != 0$. Prove that $div$
    is well-defined.
  + For $c != 0$, define $[(a,b)] div [(c,d)] = [(a,b)] times.o (div[(c,d)])$. Is this a
    well-defined operation?
  + Use the definition of the symbol $a/b$ to prove that for $a, b in ZZ$ with $b != 0$ we have
    $a div b = a/b$. More generally, prove that for $s, t, u != 0$,
    $display(r/s div t/u = (r u)/(s t))$.
]

