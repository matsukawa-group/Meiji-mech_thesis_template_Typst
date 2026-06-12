//////////////////////////////////////////////////////////////////
////
////                Meiji-mech_thesis_template_Typst
////                      template-manual.typ
////
//////////////////////////////////////////////////////////////////

// 設定ファイル
#import "settings.typ": *

#thesis-cover(
  kind: "bachelor",
  title: [乱流遷移に関する研究],
  supervisor: [姓姓　名名　教授],
  department: [機械工学科],
  FY: [2026],
  ID: [12345678],
  class: [n年n組nn番],
  author: [姓姓　名名],
)

#show: setup

// 目次が不要な場合は以下の行をコメントアウトしてください．
#outline(
  title: "目次",
  indent: auto,
)

#pagebreak()

= これは見出し
<sec:heading>

```Typst
= これは見出し
<sec:heading>
```

== これは小見出し
<ssec:subheading>

```Typst
== これは小見出し
<ssec:subheading>
```

=== これはさらに小さい見出し
<sssec:subsubheading>

```Typst
=== これはさらに小さい見出し
<sssec:subsubheading>
```


#roremu(2000)
