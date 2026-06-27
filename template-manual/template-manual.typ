//////////////////////////////////////////////////////////////////
////
////                Meiji-mech_thesis_template_Typst
////                      template-manual.typ
////
//////////////////////////////////////////////////////////////////

// 設定ファイル
#import "settings.typ": *

#thesis-cover(
  // 卒業論文なら "bachelor" を，修士論文なら "master" を指定
  kind: "bachelor",
  // 学位論文題目を間違えずに入力
  title: [乱流遷移に関する研究],
  // 指導教員の氏名
  // 役職名（教授・准教授・専任講師）を書く場合は間違えないように注意
  supervisor: [姓姓　名名　教授],
  // 学科名・専攻名を入力
  // 卒業論文：機械工学科
  // 修士論文：機械工学専攻
  department: [機械工学科],
  // 卒業論文の提出「年度」
  FY: [2026],
  // 卒業論文の場合は学籍番号を入力
  // 修士論文の場合は不要なのでコメントアウト
  ID: [12345678],
  // 卒業論文の場合は著者の学年・組・番号を入力
  // 修士論文の場合は不要なのでコメントアウト
  class: [n年n組nn番],
  // 学位論文執筆者氏名
  author: [姓姓　名名],
)

#show: setup

#set page(numbering: "i")
// 目次が不要な場合は以下の行をコメントアウトしてください．
#outline(
  title: "目次",
  indent: auto,
)
#outline(
  title: "図目次",
  indent: auto,
  target: figure.where(kind: image)
)
#outline(
  title: "表目次",
  indent: auto,
  target: figure.where(kind: table)
)

#set page(numbering: "1")
#counter(page).update(1)

= これは見出し
<ch:heading>

```Typst
= これは見出し
<ch:heading>
```

== これは小見出し
<sec:subheading>

```Typst
== これは小見出し
<sec:subheading>
```

=== これはさらに小さい見出し
<ssec:subsubheading>

```Typst
=== これはさらに小さい見出し
<ssec:subsubheading>
```

// Typst 文書の基本的な書き方
#include "chapter/basic.typ"

// 定理環境・かっこいい枠
#include "chapter/theorem.typ"

#roremu(2000)
