// 設定ファイル
#import "../settings.typ": *

= 定理環境・かっこいい枠
<ch:theorem>

== 定理環境
<sec:theorem>

数学や物理の定理や法則を示すための定理環境を #link("https://typst.app/universe/package/theorion/")[`theorion`] パッケージで用意しています．
設定ファイル `settings.typ` 冒頭で
```Typst
// 定理環境の設定
#import "@preview/theorion:0.6.0": *
// （好みに応じて変更可）
// #import cosmos.simple: *
// #import cosmos.fancy: *
#import cosmos.rainbow: *
// #import cosmos.clouds: *
```
のように，ここでは `cosmos.rainbow` を適用していますが，自分の好みの定理環境を選んで使用してください．

#theorem[Bernoulli's Theorem][
  $
    1/2 rho v^2 + rho g z + p = "const."
  $
]

また，`theorion` パッケージでは通常の定理環境以外にも，定義（definition）や補題（lemma）などの環境も用意されているので，必要に応じて使用してください．
引用文を表示するためのブロックも `theorion` パッケージで用意されています．

#quote-block[
  引用文を表示するためのブロック．
]

