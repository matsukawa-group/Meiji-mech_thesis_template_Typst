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
