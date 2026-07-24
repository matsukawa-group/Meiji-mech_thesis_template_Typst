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
  placement: bottom, // 基本的には top を指定
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

関連する図（パネル）を複数枚配置するときは `grid` と `subfigure` を使いましょう．
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
    #mytable[
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
    ]
  ]
]
#h(1em)
また，`subfigure` を使うことでそれぞれのパネルにラベルをつけることができます．
参照時には `@fig:four_figures` と入力すると~@fig:four_figures~のように全体の図を参照できますし，`@subfig:four_figures-a` と入力すると~@subfig:four_figures-a~のようにパネルを参照できます．
図~@fig:four_figures(@subfig:four_figures-a)~のように全体の図とパネルを両方参照したいときは `@fig:four_figures(@subfig:four_figures-a)` と入力すれば出力できます．
このとき，`@subfig:four_figures-a` 前後の括弧 `()` を忘れないでください．
括弧をデフォルトで出力するような設定もできますが，図~@fig:four_figures(@subfig:four_figures-a, @subfig:four_figures-b)~のように複数のパネルを参照したいときもあるので，このテンプレートでは括弧は手動で入力する方式にしています．

=== 画像のファイル形式
<ssec:figure-file_format>

画像形式は大きく分類するとラスター画像とベクター画像に分類できます．

- ラスター画像：小さな正方形（ピクセル，画素）を大量に組み合わせて作り上げた画像．ラスター画像を拡大するとピクセルの存在を確認できる．代表的なラスター画像は以下の通り．
  - GIF (Graphics Interchange Format)：拡張子は `.gif` で，256 色以下の画像を扱える可逆圧縮形式ファイル．使用できる色は少ないものの，アニメーションにも対応していることから現在でも使う機会が多い．Typst でも GIF 形式の画像を挿入できるが，生成される PDF にはアニメーションが含まれない．
  - JPEG (Joint Photographic Experts Group)：拡張子は `.jpeg` や `.jpg` で，最大 24 ビット（約 1677 万色）の色に対応している非可逆圧縮形式ファイル．Typst でも使用可能．
  - PNG (Portable Network Graphics)：拡張子は `.png` で，JPEG と同様 24 ビットの色に対応している可逆圧縮形式ファイル．透過処理にも対応している．Typst でも使用可能．
- ベクター画像：円や直線などを数式的に処理することで作り上げた画像．どれだけ拡大しても明瞭なまま．代表的なベクター画像は以下の通り．
  - PS (PostScript)：拡張子は `.ps` で，Adobe が 1984 年に開発したページ記述言語で組まれた画像形式．Typst では使用できない．
  - EPS (Encapsulated PostScript)：拡張子は `.eps` で，PostScript の後継となる画像形式（カプセル化された PostScript）．バウンディングボックスを読み込むことで描画領域を確保する．一昔前の TeX/LaTeX では EPS 形式の画像を使用することが多かったが，現在では PDF 形式の画像を使用することが多い．Typst では使用できない．
  - PDF (Portable Document Format)：拡張子は .pdf で，環境に左右されず，ほぼ同様の見た目で画像や文書を閲覧できる．一般的な用途では最も主流なベクター形式．Typst では 0.14.0 のバージョンから PDF 形式の画像を `#image()` コマンドで挿入できるようになった#footnote[Typst 0.14.0 (October 24, 2025), <#link("https://typst.app/docs/changelog/0.14.0/")>]．
  - SVG (Scalable Vector Graphics)：拡張子は `.svg` で，W3C によって標準化された XML ベースのベクター画像形式．0.14.0 以前の Typst では PDF 形式の画像を挿入できなかったため，ベクター画像としては SVG 形式の画像を挿入することが多かった．

ラスター画像かベクター画像かという観点では，論文中の画像はできるだけベクター画像の方がいいです．
これは上記説明にも書いたように，ベクター画像は内部で数式処理をしているためいくら拡大しても解像度が落ちず明瞭なままだからです．
ただし，これは一般的なグラフや簡単なカラーマップ限定の話です．
複雑なカラーマップをベクター画像にするとファイルサイズが膨大になり，画像を開くだけでも一苦労です．
このような場合には諦めてラスター画像にしましょう．

#figure(
  placement: top,
  grid(
    rows: 2,
    gutter: 2.5mm,
    grid(
      columns: 3,
      gutter: 1.5mm,
      subfigure(
        image("../figure/colormap1.pdf", height: 18%),
        caption: [],
        label: <subfig:plasma>,
      ),
      subfigure(
        image("../figure/colormap2.pdf", height: 18%),
        caption: [],
        label: <subfig:bwr>,
      ),
      subfigure(
        image("../figure/colormap2.png", height: 18%),
        caption: [],
        label: <subfig:bwr_png>,
      ),
    ),
    align(center)[
      #subfigure(
        image("../figure/graph.pdf", width: 60%),
        caption: [],
        label: <subfig:graph>,
      )],
  ),
  caption: [Examples of colormaps designed with consideration for color vision diversity. Panels (@subfig:plasma) and (@subfig:bwr) compare colormaps suitable for visualizing quantities that are symmetric about zero, such as fluctuation fields, and quantities that vary monotonically without symmetry about zero, respectively. Panel (@subfig:bwr_png) shows the raster (PNG) version of the same colormap as panel (@subfig:bwr) for comparison with the vector (PDF) version. Panel (@subfig:graph) presents an example line graph using the colormap "plasma".],
) <fig:figure-file_format>

また，論文に使用する画像を作成する際には，カラーマップの選択にも注意が必要です．
近年では，多様な色覚特性を有する読者にも情報が正しく伝わるよう，色覚多様性に配慮した図の作成が求められています．
そのため，色の違いだけに依存した表現は避け，色覚特性によらず物理量の変化や大小関係を理解しやすいカラーマップを選択することが重要です．

実際にいくつかの画像を比較してみましょう．
まずは画像形式に着目して図~@fig:figure-file_format~を見てみます．
パネル (@subfig:plasma,@subfig:bwr,@subfig:graph) は PDF ファイル，(@subfig:bwr_png) PNG ファイルです．
パネル (@subfig:plasma,@subfig:bwr,@subfig:graph) はどれもベクター画像なのでいくら拡大しても明瞭なままですね．
一方のパネル (@subfig:bwr_png) を拡大するとラスター画像なので小さな正方形で構成されていることが確認できます．これがベクター画像とラスター画像の違いです．
また，この `template-manual.pdf` を開きながら `Ctrl` + `A` をしてください．
パネル (@subfig:bwr_png) の文字が選択できないことが確認できます．
これは PNG 形式の画像なので文字情報を持っていないためです．
PDF 形式であっても文字抽出ができない場合もあります．
皆さんが論文を書く際は文字抽出が可能なベクター形式を使用するのが理想です．

次に色の選択に着目して再び図~@fig:figure-file_format~を見てみます．
図~@fig:figure-file_format~は色覚多様性に配慮したカラーマップ・グラフの例を示しています．
パネル (@subfig:plasma,@subfig:graph) は plasma と呼ばれるカラーマップを使用しており，明度が線形に変化するため，色覚特性に関わらず物理量の大小関係を理解しやすいカラーマップです#footnote[Choosing Colormaps in Matplotlib <#link("https://matplotlib.org/stable/users/explain/colors/colormaps.html")>]．
特に，パネル (@subfig:graph) のように $[0, 6]$ の区間で単調に変化するカラーマップを示したいときには plasma カラーマップが適しています．
流体力学の分野では，速度や温度の大きさなどを示すときに，このような単調に変化するカラーマップを使用することが多いです．
一方，パネル (@subfig:bwr,@subfig:bwr_png) は青 → 白 → 赤のカラーマップを使用しており，図の例のように $0$ を中心とした区間で対称的に変化する物理量を示すのに適しています．
流体力学の分野では，乱流の速度変動などの物理量は $0$（平均流速）を中心に対称的に変化することが多いので，このようなカラーマップを使用することが多いです．



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
