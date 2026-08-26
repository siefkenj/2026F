# 2026F

Course slides for the 2026–2027 semesters.

| Folder | Course |
| --- | --- |
| [`MAT235`](MAT235) | Calculus for Life Sciences (multivariable) |
| [`MAT246`](MAT246) | Concepts in Abstract Mathematics |
| [`MAT336`](MAT336) | Elements of Analysis |

Slides are written in [Typst](https://typst.app) and built by GitHub Actions on
every push; the resulting PDFs are published to the GitHub Pages site built from
[`website/landing-page`](website/landing-page).

To build locally, from this directory:

```sh
typst compile --font-path ./fonts MAT246/slides-02.typ
```

The `--font-path` flag matters: every font the decks use is vendored in
[`fonts/`](fonts) rather than assumed to be installed — Fira Sans and Fira Mono
for MAT235/MAT336, and Nimbus Sans L, Bitstream Charter and Latin Modern Mono
for MAT246.

## Layout

| Path | What it is |
| --- | --- |
| [`libs/`](libs) | Slide library, a verbatim copy of `book/libs/` from [IBLODEs](https://github.com/siefkenj/IBLODEs). Keep it a straight copy so it can be re-synced. |
| [`preamble.typ`](preamble.typ) | Shared course setup: the `course-slides` template, `cover`, `parts`, `fit-frame`, boxes, notation, attribution. |
| `MATNNN/preamble.typ` | Binds the course code, name and credits; re-exports the above. |
| `MATNNN/slides-*.typ` | The decks themselves. |

Because a deck imports `../preamble.typ`, **the project root is the repository,
not the deck's folder** — always build with `--root .` (CI does).

MAT336 and MAT246 use the library's autosizer, which reflows a slide into two
columns and shrinks the text to fit. MAT235 is built around cetz/lilaq figures,
which that autosizer cannot resize (it only changes text size), so those decks
use `fit-frame` instead: a uniform geometric shrink, the way they behaved
before.

MAT235 slides do not lay out columns of their own: each one is a single flow
that `fit-frame` shrinks to fit. A slide's scale is set by its tallest element,
so an `#image()` or a cetz canvas with no explicit size takes the full frame
width — and therefore a large height — and drags everything else down with it.
Give figures a `height:`.

Note that removing the hand-rolled `#columns(2)[...]` left a dozen slides in
chapters 13, 14, 15 and 19 saying "to the left is a contour plot ..." about a
figure that now sits *above* the text. Reword those when you next touch them.

