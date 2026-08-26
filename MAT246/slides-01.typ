#import "preamble.typ": *
#show: mat246-slides.with([Introduction], sources: (ernst_textbook, ernst_style))

// Covers textbook Chapter 1 (Introduction) and Appendix A (Elements of Style
// for Proofs), plus the opening-day activities for the course.
//
// NOTE: the *Practicing Proofs* handouts (ElGarem, Gross, Matos Wiederhold,
// Yoshinobu) begin at §2.1 and contain nothing for Chapter 1, so the material
// here comes from the textbook and from the course itself:
//   Dana C. Ernst, *An Introduction to Proof via Inquiry-Based Learning*,
//   CC BY-SA 4.0, https://danaernst.com/IBL-IntroToProof/IntroToProof.pdf


// ---------------------------------------------------------------------------
// Opening: setting the stage
// ---------------------------------------------------------------------------

#slide(title: [Setting the Stage])[
  Directions.

  For each of the questions that follow, I will ask you to:

  + *Think* about a possible answer on your own.
  + *Discuss* your answer with the rest of your group.
  + *Share* a summary of each group's discussion.
]

#slide(title: [Setting the Stage])[
  What makes an argument *convincing*?
]

#slide(title: [Setting the Stage])[
  Is there anything you are *certain* is true?

  How did you become certain of it?
]

#slide(title: [Setting the Stage])[
  What do you reasonably expect to remember from your mathematics courses in 20 years?
]

#slide(title: [Class Details])[
  This class is about *training your mind*.

  You will practice by:
  - Working problems in class, in groups.
  - Presenting and critiquing proofs in tutorial.
  - Working through the *Practicing Proofs* handouts and problem sets.

  *AI Warning.* AI can often produce a plausible-looking proof, but *the journey is the point*. Do
  not ask AI to do (or "help" with) your homework. The entire skill you are here to acquire is the
  one it would be doing for you.
]

// ---------------------------------------------------------------------------
// 1.1-1.2 What is this about / what to expect
// ---------------------------------------------------------------------------

#slide(title: [What Should You Expect?])[
  Up to now, mathematics has probably meant *formulas and algorithms*: "solve for $x$", "take the
  derivative", "integrate this". Success came from mimicking examples.

  That is one part of mathematics. But mathematicians also *experiment*, *make conjectures*, *write
  definitions*, and *prove theorems*.

  This course is about that second part.

  #v(.3em)
  Your progress will be fuelled by your willingness to wrestle with ideas. Do not be afraid to
  tinker and to make mistakes. Do not expect to get things right on the first --- or second, or
  third --- attempt. The material is too rich for that.
]

#slide(title: [An Inquiry-Based Approach])[
  In many classrooms, "doing mathematics" means following rules the teacher dictates, and "knowing
  mathematics" means remembering them.

  Our textbook takes a different approach: *inquiry-based learning* (IBL). Rather than showing you a
  smooth path to each solution, it hands you a structured sequence of problems and asks you to build
  the path.

  According to Laursen and Rasmussen (2019), the *Four Pillars of IBL* are:

  - Students engage deeply with coherent and meaningful mathematical tasks.
  - Students collaboratively process mathematical ideas.
  - Instructors inquire into student thinking.
  - Instructors foster equity in their design and facilitation choices.
]

#slide(title: [What This Will Feel Like])[
  Expect a cycle of victory and defeat, and a full range of emotions. Sometimes exhilaration, other
  times something close to paralysis.

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

// ---------------------------------------------------------------------------
// 1.4 Structure of the textbook
// ---------------------------------------------------------------------------

#slide(title: [How to Read This Textbook])[
  The labels in the book tell you what is expected of you.

  #v(.3em)
  #table(
    columns: (auto, 1fr),
    align: (right, left),
    stroke: none,
    row-gutter: .5em,
    [*Definition*, *Example*], [Read and digest these. They are given to you.],
    [*Problem*], [Requires action. Some are computational; others ask for a proof, or for a
      counterexample.],
    [*Theorem*, *Corollary*], [Requires action. Produce a valid *proof*. Corollaries follow quickly
      from an earlier theorem, so expect short proofs.],
  )

  #v(.4em)
  There are deliberately *very few worked examples* in this book. Producing the examples you need in
  order to internalize a concept is part of your job --- and it is where most of the learning
  happens.
]

#slide(title: [Our Route Through the Book])[
  #table(
    columns: (auto, 1fr),
    align: (right, left),
    stroke: none,
    row-gutter: .45em,
    [*Ch. 1--2*], [Introduction; Mathematics and Logic --- definitions, propositional logic,
      proving conditionals, quantifiers.],
    [*Ch. 3*], [Set Theory --- sets, power sets, indexed families, Cartesian products.],
    [*Ch. 4*], [Induction --- ordinary, complete, and the Well-Ordering Principle.],
    [*Ch. 7*], [Relations and Partitions --- equivalence relations, partitions, representatives.],
    [*Ch. 8*], [Functions --- injections, surjections, composition, inverses, images.],
    [*Ch. 9*], [Cardinality --- countable and uncountable, and infinitely many infinities.],
  )
]

// ---------------------------------------------------------------------------
// 1.5 Some minimal guidance
// ---------------------------------------------------------------------------

#slide(title: [Some Minimal Guidance])[
  Early on it will not be clear which facts from your prior mathematics you are "allowed" to use.
  That is genuinely hard to pin down, and we will sort it out along the way.

  So that you do not feel abandoned, here is a starting checklist.

  - The statement you are proving should be on the *same page* as the beginning of your proof.
  - Indicate where the proof begins by writing "*Proof.*"
  - Make your assumptions explicit at the very beginning: "Assume...", "Suppose...", "Let..."
  - Consider the *order* carefully. Each sentence should follow from an earlier one, or from a
    result already proved.
  - Write in *complete sentences*, in paragraphs, with proper grammar. This is not high-school
    two-column geometry.
]

// The textbook numbers these 1-23, so these three slides opt out of the deck's
// (a), (b), (c) enumeration and keep the book's numbers.
#let style-list(start, ..items) = enum(numbering: "1.", start: start, ..items)

#slide(title: [Elements of Style for Proofs (1--8)])[
  #set text(size: .92em)
  #style-list(
    1,
    [*The burden of communication lies on you, not on your reader.* If you did not write it down,
      you did not communicate it.],
    [*Tell the reader what you are proving or citing.* Do not just write "by Theorem 2.13" ---
      summarize it.],
    [*Use English words.* Real proofs consist mostly of English sentences.],
    [*Use complete sentences*, with verbs. Do not begin a sentence with a symbol.],
    [*Show the logical connections*: "Therefore", "Thus", "since", "because", "if..., then...".],
    [*Know the difference between statements and objects.* "$x^2 + 3$" is an object;
      "$x^2 + 3 < 7$" is a statement.],
    [*The symbol $=$ means "equals".* Do not write $A = B$ unless $A$ really equals $B$.],
    [*Do not interchange $=$ and $==>$.* Avoid $==>$ in formal write-ups entirely.],
  )
]

#slide(title: [Elements of Style for Proofs (9--16)])[
  #set text(size: .92em)
  #style-list(
    9,
    [*Avoid logical symbols in your proofs.* $forall$, $exists$, $or$, $and$, $<==>$ belong in your
      scratch work, not your write-up.],
    [*Say exactly what you mean.* Do not write $A in B$ when you mean $A subset B$.],
    [*Do not utilize anything unproven.*],
    [*Write strings of equalities (or inequalities) in the proper order.*],
    [*Avoid circularity.*],
    [*Do not write the proof backwards* --- do not start from what you are trying to prove.],
    [*Be concise.*],
    [*Introduce every symbol you use.*],
  )
]

#slide(title: [Elements of Style for Proofs (17--23)])[
  #set text(size: .92em)
  #style-list(
    17,
    [*Use appropriate quantifiers --- once.*],
    [*Use a symbol to mean only one thing.*],
    [*Do not "prove by example."* One case is not a proof (though one case _is_ enough to
      disprove).],
    [*Write "Let $x = dots$"* when you introduce a new object.],
    [*Make your counterexamples concrete and specific.*],
    [*Do not include examples in proofs.*],
    [*Use scratch paper.* The proof you hand in is the polished result, not the search.],
  )

  #v(.5em)
  These are Appendix A of the textbook. Keep them at hand every time you write a proof this
  semester.
]

// ---------------------------------------------------------------------------
// Warm-up activity
// ---------------------------------------------------------------------------

#slide(title: [Warm-Up: Is This a Proof?])[
  Consider the claim: *the sum of any two odd integers is even.*

  Below are three attempted arguments. For each, decide whether it is a proof. If not, say exactly
  what is missing.

  #v(.3em)
  #set text(size: .9em)
  + $3 + 5 = 8$, $7 + 11 = 18$, $1 + 9 = 10$. All even. Therefore the sum of two odd integers is
    even.
  + An odd number is one more than an even number. Adding two of them gives an even number plus
    two, which is even.
  + Let $m$ and $n$ be odd integers. Then $m = 2j + 1$ and $n = 2k + 1$ for some $j, k in ZZ$. So
    $m + n = 2j + 2k + 2 = 2(j + k + 1)$. Since $j + k + 1 in ZZ$, $m + n$ is even.
]

#slide(title: [Warm-Up: What Are We Allowed To Use?])[
  In the third argument on the previous slide, we used several facts without comment.

  + Which facts about the integers did we assume?
  + Which of those would you be comfortable assuming in this course? Which feel like they ought to
    be proved first?
  + We wrote "$m = 2j + 1$ for some $j in ZZ$". Where did that come from? Is it a *definition*, or
    something that needs proof?

  #v(.4em)
  This is the question we will be answering for the rest of the semester: *what may we assume, and
  what must we prove?*
]

#slide(title: [For Next Class])[
  - Read *Chapter 1* and *§2.1* of the textbook.
  - Skim *Appendix A: Elements of Style for Proofs*. You will refer back to it all term.
  - Download the *Practicing Proofs* handouts --- we will work from them in class and in tutorial.
  - Find *3--4 people* to form a study group with. Mathematics should not be done alone.
]
