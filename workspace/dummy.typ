#import "@preview/physica:0.9.5": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.5" as fletcher: edge, node

#set text(font: "Segoe UI")

#set page(width: auto, height: auto, margin: 0pt)



#cetz.canvas(length: 1pt, {
  import cetz.draw: *

  // 外枠と背景
  rect(
    (0, 0),
    (320, 240),
    fill: rgb("#c0c0c0"),
    stroke: black + 1pt,
  )

  // 対角線
  line((0, 0), (320, 240), stroke: rgb("#808080") + 0.8pt)
  line((0, 240), (320, 0), stroke: rgb("#808080") + 0.8pt)

  // 中央線
  line((160, 0), (160, 240), stroke: rgb("#808080") + 0.8pt)
  line((0, 120), (320, 120), stroke: rgb("#808080") + 0.8pt)

  // 中央の文字
  content(
    (160, 120),
    text(size: 50pt)[Image],
    anchor: "center",
  )
})
