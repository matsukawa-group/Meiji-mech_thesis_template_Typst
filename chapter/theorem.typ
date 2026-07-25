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

== かっこいい枠
<sec:frame>

定理環境としても使えるかっこいい枠を #link("https://typst.app/universe/package/showybox/")[`showybox`] パッケージで作成できます．
このレポートテンプレートでは枠の色に青・赤・緑・グレーの 4 色を用意しました．
論文執筆の途中で先生や先輩に添削をお願いする際は，これから書き足す予定の内容や添削者に対する相談・メモなどを `showybox` に書いておくのもいいでしょう．

#showybox(
  frame: graybox,
  title: [グレーのカラーボックス],
  footer: [フッター部分],
)[
  これはグレーのカラーボックスの内容です．
][
  これもグレーのカラーボックスの内容です．
]
```Typst
#showybox(
  frame: graybox,
  title: [グレーのカラーボックス],
  footer: [フッター部分]
)[
  これはグレーのカラーボックスの内容です．
][
  これもグレーのカラーボックスの内容です．
]
```


