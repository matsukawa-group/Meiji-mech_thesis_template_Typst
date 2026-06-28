// 設定ファイル
#import "../settings.typ": *

= 図表の配置
<ch:figure-table>

== 図の配置
<sec:figure>

=== 一枚の図を配置する方法
<ssec:figure-single>

ここでは図を 1 枚だけ配置する方法を紹介します．

#figure(
  placement: bottom,  // 基本的には top を指定
  image("../figure/example-image.pdf", width: 60%),
  caption: [Please write the figure caption here.],
)<fig:one_figure>

```Typst
#figure(
  placement: bottom,  // 基本的には top を指定
  image("../figure/example-image.pdf", width: 60%),
  caption: [Please write the figure caption here.],
)<fig:one_figure>

図~@fig:one_figure~のように図を……
```

図~@fig:one_figure~のように図を配置するときは `#figure()` コマンドで図を自動配置し，`#image()` コマンドで画像を挿入します．
図を配置する位置は次のように `placement` オプションで指定します．

- `top`：ページの上部に配置
- `bottom`：ページの下部に配置
- `auto`：`top` と `bottom` のどちらか近い方に配置
- `none`：その位置に配置

論文等の図はページ上部に配置するので，基本的には `top` を指定しておけばいいでしょう．
ただし，図~@fig:one_figure~のように章の最初のページに図を配置したいときは，章題目よりも上に図があるのは不自然なので，その場合は `bottom` を指定してページ下部に配置するのがいいでしょう．
よく文章中に図を配置している人がいますが，論文で文章中に図を配置するのはあまりよくありません．
図の大きさは `#image()` コマンドの `width` オプションで指定できます．
`width: 60%` とすれば，ページ幅の $#qty[60][%]$ の大きさで図を配置できます．
`width: 60mm` のように絶対的な長さで指定することもできます．

また，図も数式と同様に相互参照が可能です．
図を参照したいときは `@fig:one_figure` のように `@` とラベルを組み合わせて参照します．
ハイパーリンクも埋め込まれているので，該当する図が遠く離れた位置にあってもクリックすればすぐに飛べるようになっています．

=== 複数枚の図を配置する方法
<sssec:figure-multiple>

関連する図（ここではそれぞれの図を「サブ図」と呼称します）を複数枚配置するときは `grid` と `subfigure` を使いましょう．
`subfigure` は #link("https://typst.app/universe/package/hallon")[`hallon`] パッケージのコマンドです．
`grid` コマンドでは列数や列間のスペースを指定できます．
`columns: 2` とすれば 2 列のグリッドを作ることができます．
また，`gutter: 2.5mm` とすれば列間のスペースを $#qty[2.5][mm]$ に設定できます．
図~@fig:two_figures~は関連する図を左右に二枚配置した例です．
// 図~@fig:three_figures~は関連する図を左右に三枚配置した例で，図~@fig:four_figures~は関連する図を $2 times 2$ のグリッドで配置した例です．

#figure(
  placement: top,
  grid(
    columns: 2,
    gutter: 2.5mm,
    subfigure(
      image("../figure/example-image-a.pdf", width: 100%),
      caption: [Left figure caption.],
      label: <subfig:two_figures-a>,
    ),
    subfigure(
      image("../figure/example-image-b.pdf", width: 100%),
      caption: [Right figure caption.],
      label: <subfig:two_figures-b>,
    ),
  ),
  caption: [Two figures placed side by side.],
) <fig:two_figures>
```Typst
#figure(
  placement: top,
	grid(
		columns: 2,
		gutter: 2.5mm,
		subfigure(
			image("../figure/example-image-a.pdf", width: 100%),
			caption: [Left figure caption.],
			label: <subfig:two_figures-a>,
		),
		subfigure(
			image("../figure/example-image-b.pdf", width: 100%),
			caption: [Right figure caption.],
			label: <subfig:two_figures-b>,
		),
	),
	caption: [Two figures placed side by side.],
) <fig:two_figures>
```

#figure(
  placement: top,
  grid(
    columns: 3,
    gutter: 2.5mm,
    subfigure(
      image("../figure/example-image-a.pdf", width: 100%),
      caption: [Left figure caption.],
      label: <subfig:three_figures-a>,
    ),
    subfigure(
      image("../figure/example-image-b.pdf", width: 100%),
      caption: [Center figure caption.],
      label: <subfig:three_figures-b>,
    ),
    subfigure(
      image("../figure/example-image-c.pdf", width: 100%),
      caption: [Right figure caption.],
      label: <subfig:three_figures-c>,
    ),
  ),
  caption: [Three figures placed side by side.],
) <fig:three_figures>


#figure(
  placement: top,
  grid(
    columns: 2,
    gutter: 2.5mm,
    subfigure(
      image("../figure/example-image-a.pdf", width: 100%),
      caption: [Upper-left figure caption.],
      label: <subfig:four_figures-a>,
    ),
    subfigure(
      image("../figure/example-image-b.pdf", width: 100%),
      caption: [Upper-right figure caption.],
      label: <subfig:four_figures-b>,
    ),

    subfigure(
      image("../figure/example-image-c.pdf", width: 100%),
      caption: [Lower-left figure caption.],
      label: <subfig:four_figures-c>,
    ),
    subfigure(
      image("../figure/example-image-d.pdf", width: 100%),
      caption: [Lower-right figure caption.],
      label: <subfig:four_figures-d>,
    ),
  ),
  caption: [Four figures placed in a $2 times 2$ grid.],
) <fig:four_figures>

#showybox(
  frame: bluebox,
  title: [図のラベルの参照方法],
)[
  #align(center)[
    // #mytable[
      #table(
        columns: (120mm, 30mm),
        inset: 6pt,
        table.header([コマンド], [出力]),
        [`@fig:four_figures`], [@fig:four_figures],
        [`@subfig:four_figures-a`], [@subfig:four_figures-a],
        [`@fig:four_figures@subfig:four_figures-a`], [@fig:four_figures@subfig:four_figures-a],
        [`@fig:four_figures(@subfig:four_figures-a)`], [@fig:four_figures(@subfig:four_figures-a)],
        [`(@subfig:four_figures-a, @subfig:four_figures-b)`], [(@subfig:four_figures-a, @subfig:four_figures-b)],
        [`(@subfig:four_figures-a–@subfig:four_figures-c)`], [(@subfig:four_figures-a–@subfig:four_figures-c)],
        table.hline(),
      )
    // ]
  ]
]
#h(1em)
また，`subfigure` を使うことでそれぞれのサブ図にラベルをつけることができます．
参照時には `@fig:four_figures` と入力すると~@fig:four_figures~のように全体の図を参照できますし，`@subfig:four_figures-a` と入力すると~@subfig:four_figures-a~のようにサブ図を参照できます．
図~@fig:four_figures(@subfig:four_figures-a)~のように全体の図とサブ図を両方参照したいときは `@fig:four_figures(@subfig:four_figures-a)` と入力すれば出力できます．
このとき，`@subfig:four_figures-a` 前後の括弧 `()` を忘れないでください．
括弧をデフォルトで出力するような設定もできますが，図~@fig:four_figures(@subfig:four_figures-a, @subfig:four_figures-b)~のように複数のサブ図を参照したいときもあるので，このテンプレートでは括弧は手動で入力する方式にしています．

== 表の配置
<sec:table>

次に表の作り方・配置の仕方について説明します．
正直，Typst での表作成は少々面倒です．
特に表のセルの数が多くなると行をいくつも増やさなければいけないのでかなり労力がかかります．
表作成時は `table` コマンドを使用しますが，図の場合と挙動が似ているので `#figure()` 環境内で `table` コマンドを使用して表を配置します．
表~@tb:example_table~は表の作成例です．
ヘッダー（学会名・会員種別・年会費）は中央揃え，それ以外の内容は左列から順に左揃え・中央揃え・右揃えにしています．
揃え位置の指定は `align` オプションで行います．

次に表のセル結合について説明します．
行方向のセル結合は `table.cell(colspan: 3, align: center)[実在する学会]` のように `colspan` オプションを使用して行います．
`colspan: 3` とすれば 3 列分のセルを結合できます．
列方向のセル結合は `table.cell(rowspan: 4, align: left + horizon)[日本架空学会]` のように `rowspan` オプションを使用して行います．
`rowspan: 4` とすれば 4 行分のセルを結合できます．

#figure(
  placement: top,
  table(
    columns: (auto, auto, auto),
    align: (left, center, right),

    stroke: (x, y) => (
      if y == 0 {
        (top: 1.2pt + black, bottom: 1.2pt + black)
      } else {
        (bottom: 0.5pt + black)
      }
    ),

    table.header(
      table.cell(align: center)[学会名],
      table.cell(align: center)[会員種別],
      table.cell(align: center)[年会費],
    ),

    table.cell(colspan: 3, align: center)[実在する学会],

    [日本機械学会], [学生員], [$4,800$ 円],
    [日本流体力学会], [学生会員], [$5,000$ 円],
    [日本伝熱学会], [学生会員], [$4,000$ 円],

    table.cell(colspan: 3, align: center)[実在しない学会],

    table.cell(rowspan: 4, align: left + horizon)[日本架空学会], [小学生会員], [$-8,000$ 円],
    [中高生会員], [$-5,000$ 円],
    [大学生会員], [$-2,000$ 円],
    [名誉学生会員], [$6.02 times 10^23$ 円],
  ),
  caption: [Please write the table caption here.],
) <tb:example_table>

```Typst
#figure(
  placement: top,
  table(
    columns: (auto, auto, auto),
    align: (left, center, right),

    stroke: (x, y) => (
      if y == 0 {
        (top: 1.2pt + black, bottom: 1.2pt + black)
      } else {
        (bottom: 0.5pt + black)
      }
    ),

    table.header(
      table.cell(align: center)[学会名],
      table.cell(align: center)[会員種別],
      table.cell(align: center)[年会費],
    ),

    table.cell(colspan: 3, align: center)[実在する学会],

    [日本機械学会], [学生員], [$4,800$ 円],
    [日本流体力学会], [学生会員], [$5,000$ 円],
    [日本伝熱学会], [学生会員], [$4,000$ 円],

    table.cell(colspan: 3, align: center)[実在しない学会],

    table.cell(rowspan: 4, align: left + horizon)[日本架空学会], [小学生会員], [$-8,000$ 円],
    [中高生会員], [$-5,000$ 円],
    [大学生会員], [$-2,000$ 円],
    [名誉学生会員], [$6.02 times 10^23$ 円],
  ),
  caption: [Please write the table caption here.],
) <tb:example_table>
```
