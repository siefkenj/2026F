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

The `--font-path` flag matters: the decks use Fira Sans, which is vendored in
[`fonts/`](fonts) rather than assumed to be installed.
