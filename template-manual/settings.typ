//////////////////////////////////////////////////////////////////
////
////                Meiji-mech_thesis_template_Typst
////                         settings.typ
////
//////////////////////////////////////////////////////////////////

// 日本語のダミーテキスト
#import "@preview/roremu:0.1.0": roremu

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
  doc
}

#let bachelor-cover(
  title: [],
  subtitle: none,
  author: [],
  supervisor: [],
  department: [],
  date: none,
) = [
  #align(center)[
    #v(25mm)

    #text(28pt, weight: "bold")[卒業論文]

    #v(25mm)

    #text(22pt, weight: "bold")[#title]

    #if subtitle != none [
      #v(5mm)
      #text(14pt)[#subtitle]
    ]

    #v(40mm)

    #table(
      columns: (35mm, 60mm),
      align: left,
      stroke: none,

      [所属], [#department],
      [氏名], [#author],
      [指導教員], [#supervisor],
    )

    #v(30mm)

    #date.display("[year]年[month]月")
  ]
]

#let master-cover(
  title: [],
  subtitle: none,
  author: [],
  supervisor: [],
  department: [],
  date: none,
) = [
  #align(center)[
    #v(15mm)

    #text(
      34pt,
      weight: "bold",
      font: "Segoe UI",
    )[修士学位請求論文]

    #v(3mm)

    #line(length: 90mm)

    #v(25mm)

    #text(24pt, weight: "bold")[#title]

    #if subtitle != none [
      #v(6mm)
      #text(15pt)[#subtitle]
    ]

    #v(50mm)

    #grid(
      columns: (35mm, 80mm),
      gutter: 5mm,

      [請求者氏名], [#author],
      [指導教員名], [#supervisor],
      [所属], [#department],
    )

    #v(35mm)

    #date.display("[month repr:long] [year]")
  ]
]

#let thesis-cover(
  kind: "bachelor", // bachelor, master
  title: [],
  subtitle: none,
  author: [],
  supervisor: [],
  department: [],
  date: datetime.today(),
) = {
  set page(
    margin: (top: 25mm, bottom: 25mm, x: 25mm),
    numbering: none,
  )

  if kind == "bachelor" {
    bachelor-cover(
      title: title,
      subtitle: subtitle,
      author: author,
      supervisor: supervisor,
      department: department,
      date: date,
    )
  } else if kind == "master" {
    master-cover(
      title: title,
      subtitle: subtitle,
      author: author,
      supervisor: supervisor,
      department: department,
      date: date,
    )
  }
}
