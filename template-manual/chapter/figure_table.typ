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
  placement: top,
  image("../figure/example-image.pdf", width: 65%),
  caption: [Please write the figure caption here.],
)<fig:one_figure>

```Typst
#figure(
  placement: top,
  image("../figure/example-image.pdf", width: 65%),
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

論文等の図は基本的にページ上部に配置するので，このテンプレートでは `top` を指定しています．
ただし，最初のページに図を配置したいときは氏名やタイトルよりも上に図があるのは不自然なので，その場合は `bottom` を指定してページ下部に配置するのがいいでしょう．
図の大きさは `#image()` コマンドの `width` オプションで指定できます．
`width: 60%` とすれば，ページ幅の60%の大きさで図を配置できます．
`width: 60mm` のように絶対的な長さで指定することもできます．

また，図も数式と同様に相互参照が可能です．
図を参照したいときは `@fig:one_figure` のように `@` とラベルを組み合わせて参照します．
ハイパーリンクも埋め込まれているので，該当する図が遠く離れた位置にあってもクリックすればすぐに飛べるようになっています．
