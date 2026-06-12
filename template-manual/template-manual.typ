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
  author: [姓姓　名名],
  supervisor: [姓姓　名名　教授],
  department: [明治大学理工学部　機械工学科],
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
