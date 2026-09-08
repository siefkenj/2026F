#import "./common.typ": *
#import "./settings.typ": *
#import "./settings-slides.typ": *
#import "./settings-question.typ": *
#import "./environment-question.typ": question
#import "./environment-module.typ": module
#import "./environments.typ": *
#import "./utils.typ": *

/// For backgrounds that go up to the very edge of the slide, make them overrun the edge by this much
/// to avoid any stripes of background seeping through.
#let FILL_BLEED = 2pt

/// Tracks the last `siefken_num` so that `siefken_num: auto` can continue from it. The number is
/// held as counter levels rather than as a single value, so `2.1` steps to `2.2` and not to `3.1`.
#let _siefken_counter = counter("siefken-slide-number")

/// Split a `siefken_num` into counter levels: `7` becomes `(7,)`, `2.1` becomes `(2, 1)`. Going
/// through the string avoids the rounding a float `+ 0.1` would introduce.
#let _siefken_levels(n) = if type(n) == int { (n,) } else { str(n).split(".").map(int) }

/// Render counter levels back into a number: `(2, 1)` becomes `2.1`.
#let _siefken_number(levels) = levels.map(str).join(".")

/// Step the counter to this slide's number. `auto` advances the last level of whatever number came
/// before; anything else sets the counter outright.
///
/// This is deliberately a plain update rather than a read-then-write: resolving the new value from
/// a `counter.get()` makes each slide's number depend on the previous slide's *layout*, which
/// advances by only one slide per introspection pass and so stops converging after five of them.
#let _siefken_step(n) = if n == auto {
  _siefken_counter.update((..prev) => {
    let levels = prev.pos()
    levels.slice(0, -1) + (levels.last() + 1,)
  })
} else {
  _siefken_counter.update(_siefken_levels(n))
}

/// The number this slide ended up with, as content. Only meaningful after `_siefken_step`.
#let _siefken_display() = context _siefken_number(_siefken_counter.get())

/// The title a slide shows: a numbered slide names itself, otherwise the explicit `title` is used,
/// which may itself be `none`.
#let _slide_title(it) = {
  if it.at("siefken_num", default: none) != none {
    [Siefken #_siefken_display()]
  } else {
    it.at("title", default: none)
  }
}

/// Create a slide. If `slide_settings.active` is `false`, the content of the slide will be
/// directly passed through and no border/etc. will be shown.
///
/// Arguments:
/// - `title`: The title of the slide, or `none` for an untitled slide. Defaults to `none`.
/// - `body`: The content of the slide. Required, and normally passed as a trailing content block.
/// - `autosize`: Whether the slide should automatically resize its content to fit. Defaults to `true`.
/// - `two_columns`: Whether to lay the slide out in two columns. `none` (the default) decides from
///   the content, using one column when it fits and two when it does not; `true` and `false` pin the
///   layout to two columns or one.
/// - `siefken_num`: A number identifying the slide. When set, the slide is titled `Siefken X` and
///   its top-level enumeration is numbered `X.y` rather than `1.`; deeper levels are unaffected.
///   Takes precedence over `title`. `auto` continues from the previous numbered slide, stepping the
///   last level of its number, so `2.1` is followed by `2.2` and `7` by `8`. Defaults to `none`.
/// - `force_scale`: A length used as the base text size for the slide instead of `1em`. This can be
///   used to force the content to fit on a single slide if `autosize` is not sufficient. Defaults to
///   `none`.
#let slide = e.element.declare(
  "slide",
  prefix: PREFIX,
  doc: "Create a slide.",
  display: it => e.get(get => {
    let global_config = get(global_settings)
    let slide_config = get(slide_settings)
    let question_counter = e.counter(question)
    let module_counter = e.counter(module)

    // If the slide environment is not active, pass through the content un-modified.
    if not slide_config.active {
      return it.body
    }

    let top_margin_color = slide_config.top_bg_color
    let bottom_margin_color = if slide_config.bottom_bg_color == auto {
      top_margin_color
    } else {
      slide_config.bottom_bg_color
    }
    let heading_text_color = if oklch(top_margin_color).components().at(0) < 60% {
      color.white
    } else {
      top_margin_color.darken(70%)
    }
    let footer_text_color = if oklch(bottom_margin_color).components().at(0) > 50% {
      bottom_margin_color.darken(30%)
    } else {
      bottom_margin_color.darken(70%)
    }


    // Number this slide before the `set page` below, which is what breaks onto the slide's own
    // page. A page header reads counters as they stand at the start of its page, so an update made
    // after the break would leave the header a slide behind.
    if it.siefken_num != none {
      _siefken_step(it.siefken_num)
    }
    let slide_title = _slide_title(it)

    let text_size = if it.force_scale != none { it.force_scale } else { 1em }
    let (
      left: left_margin,
      right: right_margin,
      top: top_margin,
      bottom: bottom_margin,
    ) = _compute_margins()
    // let body_height = page.height - top_margin - bottom_margin

    set page(
      header-ascent: 0pt,
      header: {
        show: pad.with(left: -left_margin - FILL_BLEED, right: -right_margin - FILL_BLEED)
        show: block.with(
          breakable: false,
          fill: top_margin_color,
          width: 100%,
          height: 100% + FILL_BLEED,
          inset: (y: 2pt, left: left_margin + FILL_BLEED, right: right_margin + FILL_BLEED),
        )
        set text(fill: heading_text_color, weight: "bold")
        show: sans
        if slide_title == none {
          [Exercise #question_counter.display()]
          // If the module counter is > 0, show the current module
          if module_counter.get().at(0, default: 0) > 0 {
            h(1fr)
            text(weight: "thin", size: .8em, baseline: -2pt)[Module #module_counter.display()]
          }
        } else {
          slide_title
        }
      },
      footer-descent: 0pt,
      footer: {
        show: pad.with(left: -left_margin - FILL_BLEED, right: -right_margin - FILL_BLEED)
        show: block.with(
          breakable: false,
          fill: bottom_margin_color,
          width: 100%,
          height: 100% + FILL_BLEED,
          inset: (y: 2pt, left: left_margin + FILL_BLEED, right: right_margin + FILL_BLEED),
        )
        set text(size: .83em, fill: footer_text_color)
        place(top + center, [#context counter(page).display()])
        set align(right)
        slide_config.copyright
      },
    )
    //
    // Lay out the content
    //

    show footnote.entry: it => {
      it
      v(3pt)
    }
    show: it => {
      // XXX: this is a hack to get footnotes working. The only footnote we currently have is in exercise 54.
      // In theory the footnote and the content of the slide can overlap.
      show: place
      show: block.with(
        breakable: false,
        width: 100%,
        height: 100%,
        inset: (y: 3pt),
      )
      it
    }
    // [#body_height, #page.height]
    // A numbered slide numbers its top-level parts `X.y`. Levels below it keep
    // whatever numbering is in effect, so read that rule rather than restate it.
    let content = if it.siefken_num == none { it.body } else {
      context {
        let siefken_number = _siefken_number(_siefken_counter.get())
        let outer = enum.numbering
        set enum(numbering: (..n) => {
          if n.pos().len() == 1 {
            siefken_number + "." + str(n.pos().first())
          } else if type(outer) == function {
            outer(..n)
          } else {
            numbering(outer, ..n.pos())
          }
        })
        it.body
      }
    }
    if it.autosize == false {
      content
    } else {
      layout(size => {
        // Attempt a series of layout options to try and get the content to fit on a single slide
        let adjusted_content = block(
          breakable: false,
          width: size.width,
          {
            set text(size: text_size)
            content
          },
        )
        let content_dim = measure(adjusted_content)
        // `none` picks the layout from how tall the content is; `true`/`false` pin it.
        let use_two_columns = if it.two_columns == none {
          content_dim.height >= 1.0 * size.height
        } else {
          it.two_columns
        }
        if not use_two_columns {
          let percent_over = content_dim.height / size.height
          if percent_over <= 1 {
            block(
              breakable: false,
              adjusted_content,
            )
          } else {
            // Pinned to one column but too tall for it. Shrink the text the way the
            // two-column branch does rather than letting it run off the slide.
            let text_size = if it.force_scale != none { it.force_scale } else {
              calc.max(1 / percent_over, 0.85) * 1em
            }
            block(
              breakable: false,
              {
                set text(size: text_size)
                content
              },
            )
          }
        } else {
          let content = {
            set text(size: text_size)
            content
          }
          // We're now in two columns, but `measure` will assume infinite height. Use
          // the heuristic that columns will cut the height in half.
          content_dim = measure(block(breakable: false, width: size.width / 2, content))
          // Calculate the percentage overflow we have for a two-column layout
          let percent_over = content_dim.height / 2.05 / size.height
          if percent_over < 1 {
            block(
              breakable: false,
              columns(
                2,
                gutter: 8pt,
                content,
              ),
            )
          } else {
            let text_size = if it.force_scale != none { it.force_scale } else {
              calc.max(1 / percent_over, 0.85) * 1em
            }
            block(
              breakable: false,
              {
                set text(size: text_size)
                columns(
                  2,
                  gutter: 8pt,
                  content,
                )
              },
            )
          }
        }
      })
    }
  }),
  reference: (
    custom: it => {
      let label = it.at("label", default: none)
      if label == none {
        return
      }
      // A numbered slide only knows its number in document order, so read it back at the label.
      if it.at("siefken_num", default: none) != none {
        link(label, context [Siefken #_siefken_number(_siefken_counter.at(label))])
      } else {
        link(label, it.title)
      }
    },
  ),
  fields: (
    e.field("title", e.types.option(content), doc: "The title of the slide."),
    e.field("body", content, required: true, doc: "The body of the slide."),
    e.field(
      "autosize",
      bool,
      doc: "Whether the slide should automatically resize to fit its content.",
      default: true,
    ),
    e.field(
      "two_columns",
      e.types.option(bool),
      doc: "Whether to lay the slide out in two columns. `none` decides from the content; `true` and `false` pin the layout to two columns or one.",
      default: none,
    ),
    e.field(
      "siefken_num",
      e.types.option(e.types.union(int, float, auto)),
      doc: "A number identifying the slide. When set, the slide is titled `Siefken X` and its top-level enumeration is numbered `X.y`. `auto` continues from the previous numbered slide.",
      default: none,
    ),
    e.field(
      "force_scale",
      e.types.option(length),
      doc: "If set, the slide will be scaled by this factor. This can be used to force the content to fit on a single slide if `autosize` is not sufficient.",
      default: none,
    ),
  ),
)

/// Template for making a slides. This should be used as
/// ```typst
/// #show: slides_template
/// ```
#let slides_template(it) = {
  show: e.prepare(question)
  show: e.set_(slide_settings, active: true)
  show: e.set_(global_settings, display_mode: "slides")
  show: e.set_(question_settings, include_start_marker: false)
  show link: _show_link
  set par(justify: true)
  set page(
    width: 17.7cm,
    height: 10cm,
    margin: (
      x: 4pt,
      top: 1.15em,
      bottom: 3cm,
    ),
  )
  it
}
