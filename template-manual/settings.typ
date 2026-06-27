//////////////////////////////////////////////////////////////////
////
////                Meiji-mech_thesis_template_Typst
////                         settings.typ
////
//////////////////////////////////////////////////////////////////

// 日本語のダミーテキスト
#import "@preview/roremu:0.1.0": roremu
// 定理環境の設定
#import "@preview/theorion:0.6.0": *
// （好みに応じて変更可）
// #import cosmos.simple: *
// #import cosmos.fancy: *
#import cosmos.rainbow: *
// #import cosmos.clouds: *

#let setup(doc) = {
  // CJK 文字を組むときのスペース
  import "@preview/cjk-spacer:0.2.1": cjk-spacer
  show: cjk-spacer

  // 本文のフォント
  set text(lang: "en", font: ("New Computer Modern", "BIZ UDMincho"))

  set par(
    justify: true, // 両端揃え
    leading: 0.65em, // 行送り
    spacing: 0.65em, // 段落間の間隔
    first-line-indent: (amount: 1em, all: false),
  )

  // 見出しのスタイル
  set heading(
    numbering: (..nums) => {
      let ns = nums.pos()
      if ns.len() == 1 {
        [第 #ns.first() 章]
      } else {
        numbering("1.1", ..ns)
      }
    },
    supplement: none
  )
  show heading: it => {
    if it.level == 1 {
      pagebreak()
      v(1.8em)
      let has-number = it.numbering != none
      block(width: 100%, above: 2em, below: 2em)[
        #if has-number {
          let ns = counter(heading).at(it.location())
          text(size: 24pt, font: "Segoe UI")[
            第 #ns.first() 章
          ]
          v(1.0em) + h(-1em)
        }
        #text(size: 24pt, font: "Segoe UI")[
          #it.body
        ]
      ]
    } else if it.numbering != none {
      let ns = counter(heading).at(it.location())
      text(font: "Segoe UI")[
        #v(0.2em)#linebreak()#numbering("1.1", ..ns)#h(1em)#it.body
      ]
    } else {
      text(font: "Segoe UI")[#it.body]
    }
    par(text(size: 0pt, "")) // 見出しの後に字下げするために空の段落を設定
  }

  // ページ番号
  // 本文上の見た目と PDF 内部のページラベルを揃えるため
  // set page(numbering: "--- 1 ---")
  // のようには設定しない．
  set page(numbering: "1")
  set page(
    footer: context align(center)[
      --- #counter(page).display() ---
    ],
  )

  // 番号なしの箇条書きの設定
  set list(
    indent: 1em,
  )
  show list: set block(
    spacing: 1em,
  )
  // 番号付きの箇条書きの設定
  set enum(
    indent: 1em,
  )
  show enum: set block(
    spacing: 1em,
  )

  // リンク
  show link: set text(fill: blue)
  show ref: set text(fill: blue)
  show footnote: set text(fill: blue)

  // コードブロック
  import "@preview/codly:1.3.0": *
  import "@preview/codly-languages:0.1.1": *
  show: codly-init.with()

  doc
}

// =================================================================
// 表紙に関する設定
// =================================================================

// 卒業論文の表紙
#let bachelor-cover(
  title: [],
  subtitle: none,
  author: [],
  supervisor: [],
  department: [],
  FY: [],
  ID: [],
  class: [],
  date: none,
) = [
  #align(center)[
    #v(25mm)

    #text(22pt)[#title]

    #v(25mm)

    #text(18pt)[指導教員]

    #text(18pt)[#supervisor]

    #v(18mm)

    #text(18pt)[明治大学理工学部]

    #text(18pt)[#department]

    #v(18mm)

    #text(18pt)[#FY 年度]

    #v(18mm)

    #text(18pt)[学籍番号 #h(1em) #ID]

    #text(18pt)[#class]

    #text(18pt)[#author]
  ]
]

// 修士論文の表紙
#let master-cover(
  title: [],
  subtitle: none,
  author: [],
  supervisor: [],
  department: [],
  FY: [],
  date: none,
) = [
  #align(center)[
    #v(15mm)

    #text(18pt)[明治大学大学院　理工学研究科]

    #text(18pt)[#FY 年度]

    #text(18pt)[修士学位請求論文]

    #v(18mm)

    #box(width: 80%, stroke: 1pt, inset: 12pt)[#text(18pt)[#align(left)[論文題目：]#title]]

    #v(18mm)

    #box(width: 80%, stroke: 1pt, inset: 12pt)[#text(18pt)[#align(left)[指導教員名：#supervisor]]]

    #v(18mm)

    #box(width: 80%, stroke: 1pt, inset: 12pt)[#text(18pt)[#department#v(18pt)#align(left)[請求者氏名：#author]]]

  ]
]

// 表紙の設定
#let thesis-cover(
  kind: "bachelor", // bachelor, master
  title: [],
  subtitle: none,
  author: [],
  supervisor: [],
  department: [],
  FY: [],
  ID: [],
  class: [],
  date: datetime.today(),
) = {
  set page(
    margin: (top: 25mm, bottom: 25mm, x: 25mm),
    numbering: "i",
    footer: none,
  )
  // 表紙のフォント
  set text(lang: "en", font: ("New Computer Modern", "BIZ UDMincho"))

  if kind == "bachelor" {
    bachelor-cover(
      title: title,
      subtitle: subtitle,
      author: author,
      supervisor: supervisor,
      department: department,
      FY: FY,
      ID: ID,
      class: class,
      date: date,
    )
  } else if kind == "master" {
    master-cover(
      title: title,
      subtitle: subtitle,
      author: author,
      supervisor: supervisor,
      department: department,
      FY: FY,
      date: date,
    )
  }
}

// =================================================================


//========== showybox の設定 ============
#import "@preview/showybox:2.0.4": showybox as original-showybox
#let showybox(
  title: none,
  ..args,
  body,
) = {
  let title-arg = if title == none {
    (:)
  } else {
    (title: text(font: "Segoe UI")[#title])
  }

  original-showybox(
    ..args,
    ..title-arg,
  )[
    #body
  ]
}

#let bluebox = (
  title-color: rgb("#007bff"),
  border-color: rgb("#007bff"),
  body-color: rgb("#f0f8ff"),
  footer-color: rgb("#f0f8ff"),
)

#let redbox = (
  title-color: rgb("#fc3e3e"),
  border-color: rgb("#fc3e3e"),
  body-color: rgb("#fff0f0"),
  footer-color: rgb("#fff0f0"),
)

#let greenbox = (
  title-color: rgb("#00cc4b"),
  border-color: rgb("#00cc4b"),
  body-color: rgb("#f0fff0"),
  footer-color: rgb("#f0fff0"),
)

#let graybox = (
  title-color: rgb("#666666"),
  border-color: rgb("#666666"),
  body-color: rgb("#F5F5F5"),
  footer-color: rgb("#F5F5F5"),
)
//=======================================



