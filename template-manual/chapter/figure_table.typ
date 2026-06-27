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

