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
| [`libs/`](libs) | Slide library, a near-verbatim copy of `book/libs/` from [IBLODEs](https://github.com/siefkenj/IBLODEs). Keep it as close to a straight copy as possible so it can be re-synced; the divergences are listed in [`MAT246/README.md`](MAT246/README.md). |
| [`preamble.typ`](preamble.typ) | Shared course setup: the `course-slides` template, `cover`, `parts`, `fit-frame`, boxes, notation, attribution. |
| `MATNNN/preamble.typ` | Binds the course code, name and credits; re-exports the above. |
| `MATNNN/slides-*.typ` | The decks themselves. |

Because a deck imports `../preamble.typ`, **the project root is the repository,
not the deck's folder** — always build with `--root .` (CI does).

