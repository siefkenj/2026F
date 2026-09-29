# 2026F

Course slides for the 2026–2027 academic year, written in [Typst](https://typst.app).

**Built slides: <https://siefkenj.github.io/2026F/>**

| Folder | Course |
| --- | --- |
| [`MAT235`](MAT235) | Calculus for Life Sciences (multivariable) |
| [`MAT246`](MAT246) | Concepts in Abstract Mathematics |
| [`MAT336`](MAT336) | Elements of Analysis |

## Building

GitHub Actions builds every deck on each push to `main` and publishes the PDFs,
together with the landing page in [`website/landing-page`](website/landing-page),
to the site above.

To build a deck locally, run from this directory:

```sh
typst compile --root . --font-path ./fonts MAT246/slides-02.typ
```

Both flags are required:

- `--root .` lets a deck reach `../preamble.typ` and `../libs/`, which sit outside
  its own folder.
- `--font-path ./fonts` uses the fonts vendored in [`fonts/`](fonts) rather than
  whatever is installed: Fira Sans and Fira Mono for MAT235 and MAT336; Nimbus
  Sans L, Bitstream Charter and Latin Modern Mono for MAT246.

To publish a new deck, add it to the list in
[`.github/workflows/on-pull-request.yml`](.github/workflows/on-pull-request.yml).

## Layout

| Path | What it is |
| --- | --- |
| [`preamble.typ`](preamble.typ) | Shared course setup: the `course-slides` template, `cover`, `parts`, `fit-frame`, boxes, notation, attribution. |
| `MATNNN/preamble.typ` | Binds the course code, name and credits, and re-exports the shared preamble. |
| `MATNNN/slides-*.typ` | The decks. |
| [`libs/`](libs) | The slide library, a near-verbatim copy of `book/libs/` from [IBLODEs](https://github.com/siefkenj/IBLODEs). Keep it close to upstream so it can be re-synced; the divergences are listed in [`MAT246/README.md`](MAT246/README.md). |
| [`fonts/`](fonts) | Vendored fonts (see above). |
| [`website/landing-page`](website/landing-page) | The GitHub Pages landing page. |
