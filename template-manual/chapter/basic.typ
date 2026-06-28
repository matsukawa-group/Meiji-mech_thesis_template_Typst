// 設定ファイル
#import "../settings.typ": *

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

= Typst 文書の基本的な書き方
<ch:basic>

ここでは Typst 文書の基本的な書き方について説明します．

== コメント文・段落の変え方・強調の仕方
<sec:paragraph>

// ← これはコメント文にするコマンドです．
// #rorem(xxx) これはダミーテキストです．
#roremu(154)  // ↓ 空白行を入れると改段落されます．

#text(fill: red)[*段落を変えたいときは空白行を入れます．*]  // 強調のために色と太さを変えました．
#roremu(154)

```Typst
// ← これはコメント文にするコマンドです．
// #rorem(xxx) これはダミーテキストです．
#roremu(154)  // ↓ 空白行を入れると改段落されます．

#text(fill: red)[*段落を変えたいときは空白行を入れます．*]  // 強調のために色と太さを変えました．
#roremu(154)
```

== 相互参照
<sec:reference>

Typst の強みの一つは相互参照が簡単にできることです．
Typst では `<xxx>` のように `<` と `>` で囲まれた部分をラベルとして定義することができます．
例えば，この節は見出しのところで
```Typst
== 相互参照
<sec:reference>
```
としているので，この見出しを参照したいときは
```Typst
第~@sec:reference~節
```
とすれば「第~@sec:reference~節」のように出力できます．
このような相互参照は見出しだけでなく，数式や図表などあらゆる要素に対して行うことができます．
`<` と `>` の間の文字列は自由に設定できるので，ジャンルごとにわかりやすいラベルをつけるといいでしょう#footnote[例：章の場合は `<ch:xxx>` 節の場合は `<sec:xxx>`，小節の場合は `<ssec:xxx>`，式の場合は `<eq:xxx>`，図の場合は `<fig:xxx>`，表の場合は `<tb:xxx>` など，自分のわかりやすいラベルをつけるといいでしょう．ちなみにここに表示しているような脚注は `#footnote[脚注内の文字列]` で出力します．]．
また，コード中に挿入している `~`（チルダ）を使用することで，この箇所での改行を防ぐことができます．

== 強制改ページ
<sec:pagebreak>

紙面の都合で強制的に改ページしたいときは `#pagebreak()` コマンドを使用します．
例えば，この段落の後で `#pagebreak()` とすれば，この段落の後で改ページされます．

#pagebreak()

== 箇条書き
<sec:list>

箇条書きには番号なしのものと番号付きのものがあります．

=== 番号なしの箇条書き
<ssec:itemize>

番号なしの箇条書きの例として，明治大学のキャンパスと学部を挙げます．
箇条書きは入れ子にすることもできます．

#v(1em)

#columns(
  2,
  gutter: 2em,
)[
  - 和泉，駿河台キャンパス
    - 法学部
    - 商学部
    - 政治経済学部
    - 文学部
    - 経営学部
    - 情報コミュニケーション学部
  - 生田キャンパス
    - 理工学部
      - 機械工学科
      - 機械情報工学科
    - 農学部
  - 中野キャンパス
    - 国際日本学部
    - 総合数理学部
  #colbreak()
  ```Typst
  - 和泉，駿河台キャンパス
    - 法学部
    - 商学部
    - 政治経済学部
    - 文学部
    - 経営学部
    - 情報コミュニケーション学部
  - 生田キャンパス
    - 理工学部
      - 機械工学科
      - 機械情報工学科
    - 農学部
  - 中野キャンパス
    - 国際日本学部
    - 総合数理学部
  ```
]

=== 番号付きの箇条書き
<ssec:enumerate>

番号付きの箇条書きの例として，日本の苗字ランキングの上位を挙げます．
番号付きの箇条書きも入れ子にすることができます．

#v(1em)

#columns(
  2,
  gutter: 2em,
)[
  1. 佐藤
  2. 鈴木
  3. 高橋
    1. 高橋
    2. 髙橋
  4. 田中
  5. 伊藤
  #colbreak()
  ```Typst
  1. 佐藤
  2. 鈴木
  3. 高橋
    1. 高橋
    2. 髙橋
  4. 田中
  5. 伊藤
  ```
]

== 数式
<sec:math>

次に，Typst における数式の書き方について説明します．

=== 基本的な数式の書き方
<ssec:math-basic>

Typst で文章中に数式を組み込むインライン数式の場合は，`$` と `$` で表示したい数式を囲って `$E = m c^2$` とすると，$E = m c^2$ のように出力できます．このとき，`$E = mc^2$` のように `m` と `c` の間にスペースを入れず `mc` とすると，`mc` という一つのコマンドとして認識されてしまうため，注意しましょう．
また，インライン数式で表示する場合は `$` と数式の間に空白を入れてはいけません．

最も基本的な別行立ての数式は

$
  pdv(u_r, t) + (vr(u) dot nabla) u_r = - 1/rho pdv(p, r) + nu (nabla^2 u_r - u_r/r^2 - 2/r^2 pdv(u_theta, theta)) #<eq:NSr>
$

```Typst
$
  pdv(u_r, t) + (vr(u) dot nabla) u_r = - 1/rho pdv(p, r) + nu (nabla^2 u_r - u_r/r^2 - 2/r^2 pdv(u_theta, theta)) #<eq:NSr>
$
```
または
```Typst
$ pdv(u_r, t) + (vr(u) dot nabla) u_r = - 1/rho pdv(p, r) + nu (nabla^2 u_r - u_r/r^2 - 2/r^2 pdv(u_theta, theta)) #<eq:NSr> $
```

のように `$` と数式の間に空白を設けることで出力できます．
式~@eq:NSr~の数式は Typst でサポートされている最も標準的なコマンドと #link("https://typst.app/universe/package/physica/")[`physica`] パッケージで記述しています．
上付き添え字はキャレット `^`，下付き添え字はアンダースコア `_` を用いて表現します．
したがって，$u_theta^2$ は `u_theta^2` と書きます．
ここで注意点として，添え字が $u_theta^2$ のように一文字であれば問題ないのですが，$R_(i j)$ のように二文字以上の場合は `R_(i j)` のように括弧 `()` で囲んでください．
$rho$ や $theta$ のようなギリシャ文字も出力できるほか，$nabla$ や $sin$，$log$ のような数学で使う関数の類もコマンドが存在します（例：`nabla`，`sin`，`log`）．
$sin$ や $log$ は通常アップライト体（直立体，Roman 体）で書きます．
$s i n x$ などと書くことのないよう気をつけましょう．
分数はスラッシュ `/` を用いて `1/rho` と表現します．
ただし，インライン数式の $1 slash rho$ のようにスラッシュで分数表記したいときは `1 slash rho` としてください．
ベクトルの表記としては矢印を用いて $va(u)$ と表記する方法，イタリックボールド体で $vb(u)$ と表記する方法などがあります．
これらは `physica` パッケージでサポートされているコマンドを使用し，それぞれ `va(u)`，`vb(u)` とすることで出力できます．
式~@eq:NSr~の左辺第二項では直立ボールド体の $vr(u)$ を採用していますが，これを簡単に出すコマンドは無いため，このテンプレートで自作したコマンドを使用し `vr(u)` とすることで出力できます．
他のテンプレートでは `vr(u)` と書いても出力できないので注意してください．

=== `physica` パッケージの数式コマンド
<sssec:math-physica>

#link("https://typst.app/universe/package/physica/")[`physica`] パッケージでサポートされている数式コマンドの一部を以下に示します．

#showybox(
  frame: bluebox,
  title: [`physica` パッケージの数式コマンド],
)[
  #align(center)[
    #mytable[
      #table(
        columns: (90mm, 50mm),
        inset: 6pt,
        table.header([コマンド], [出力]),
        [`va(u)`, `vb(u)`, `vu(u)`], $va(u), vb(u), vu(u)$,
        [`dd(x)`, `dd(x, y)`, `dd(x, 2)`, `dd(x, [n])`], $dd(x), dd(x, y), dd(x, 2), dd(x, [n])$,
        [`dv(, x)`, `dv(f, x)`, `dv(f, x, n)`], $display(dv(, x)"," dv(f, x)"," dv(f, x, n))$,
        [`pdv(, x)`, `pdv(f, x)`, `pdv(f, x, y)`, `pdv(f, x, [n])`],
        $display(pdv(, x)"," pdv(f, x)"," pdv(f, x, y)"," pdv(f, x, [n]))$,
        [`dv(, x, d: upright(D))`, `dv(f, x, d: upright(D))`, `dv(f, x, n, d: upright(D))`],
        $display(dv(, x, d: upright(D))"," dv(f, x, d: upright(D))"," dv(f, x, n, d: upright(D)))$,
        table.hline(),
      )
    ]
  ]
]

=== 複数行に亘る数式の書き方
<ssec:math-multiline>

複数の数式を並べる場合は
$
  a^2 & = b^2 + c^2 - 2 b c cos A #<eq:cosA> \
  b^2 & = a^2 + c^2 - 2 c a cos B #<eq:cosB> \
  c^2 & = a^2 + b^2 - 2 a b cos C #<eq:cosC>
$
```Typst
$
  a^2 & = b^2 + c^2 - 2 b c cos A #<eq:cosA>\
  b^2 & = a^2 + c^2 - 2 c a cos B #<eq:cosB>\
  c^2 & = a^2 + b^2 - 2 a b cos C #<eq:cosC>
$
```
のように `&` の位置で数式を揃えることができます．
式~@eq:cosA–@eq:cosC~は $=$ の前に `&` を置いているため，$=$ の位置で数式が揃っています．
数式を改行するときは行末にバックスラッシュ `\` を入れます．
また，このやり方を応用すれば
$
  sin 2 alpha & = sin (alpha + alpha) #<equate:revoke> \
              & = sin alpha cos alpha + cos alpha sin alpha #<equate:revoke> \
              & = 2 sin alpha cos alpha #<eq:double-angle>
$
```Typst
$
  sin 2 alpha & = sin (alpha + alpha) #<equate:revoke> \
              & = sin alpha cos alpha + cos alpha sin alpha #<equate:revoke> \
              & = 2 sin alpha cos alpha #<eq:double-angle>
$
```
のように途中式も入れられます．
式番号を振らなくていい行は `#<equate:revoke>` コマンドを使用しています．

$
  epsilon lr((pdv(tilde(phi.alt)_1, t, 2) + g pdv(tilde(phi.alt)_1, z)) |)_(z = 0) & + epsilon^2 lr(\[pdv(tilde(phi.alt)_2, t, 2) + g pdv(tilde(phi.alt)_2, z) + tilde(eta)_1 pdv(, z) (pdv(tilde(phi.alt)_1, t, 2) + g pdv(tilde(phi.alt)_1, z))) #<equate:revoke> \
  & + pdv(, t) lr(lr({(pdv(tilde(phi.alt)_1, x)) + (pdv(tilde(phi.alt)_1, z))^2}])|)_(z = 0) = 0 #<eq:wave>
$
```Typst
$
  epsilon lr((pdv(tilde(phi.alt)_1, t, 2) + g pdv(tilde(phi.alt)_1, z)) |)_(z = 0) & + epsilon^2 lr(\[pdv(tilde(phi.alt)_2, t, 2) + g pdv(tilde(phi.alt)_2, z) + tilde(eta)_1 pdv(, z) (pdv(tilde(phi.alt)_1, t, 2) + g pdv(tilde(phi.alt)_1, z))) #<equate:revoke> \
  & + pdv(, t) lr(lr({(pdv(tilde(phi.alt)_1, x)) + (pdv(tilde(phi.alt)_1, z))^2}])|)_(z = 0) = 0 #<eq:wave>
$
```

式~@eq:wave~は式の途中で改行を挟む場合の処理方法を示しています．
注目すべき箇所は大括弧 $[ quad ]$ の途中で改行を挟んでいる点，代入記法として $|_(z = 0)$ を使用している点の二箇所です．
このような場合には #link("https://typst.app/docs/reference/math/lr/")[`lr` コマンド] と `\` によるエスケープでうまいこと表現します．
また，`phi` は $phi$ と出力されますが，`phi.alt` とすることで $phi.alt$ と出力されるようになります．

場合分けのある数式は `cases` が便利です．式~@eq:kronecker-delta~は Kronecker のデルタです．
$
  delta_(i j) = cases(
    1"," quad i = j,
    0"," quad i != j
  )#<eq:kronecker-delta>
$
```Typst
$
  delta_(i j) = cases(
    1"," quad i = j,
    0"," quad i != j
  )#<eq:kronecker-delta>
$
```

=== 単位の書き方
<ssec:math-unit>

数式中の物理量は Italic 体で表記しますが，単位は直立体で表記するのが一般的です．
また，数値と単位の間には空白を設けるのが一般的な書き方です#footnote[例外的に空白を設けなくてもいい単位として，角度を表す $degree$ があります．$45 degree$ のように数値と単位を詰めて書くことが許容されています．ただし，温度を表す $#unit[celsius]$ は空白が必要です（$#qty[45][celsius]$）．ちなみに $degree$ を出力する `degree` コマンド自体は `fancy-units` パッケージのものではありません．]．
これらの要求を満たして簡単に単位を書けるのが #link("https://typst.app/universe/package/fancy-units")[`fancy-units`] パッケージです#footnote[単位の出力に関しては #link("https://typst.app/universe/package/fancy-units")[`fancy-units`] パッケージ以外にも #link("https://typst.app/universe/package/unify/")[`unify`] パッケージがあります．しかし，熱伝達率の単位 $#unit[W / ((m^2 K))]$ のような単位をこの見た目で出力するには `unify` パッケージよりも `fancy-units` パッケージの方が簡単だったので，このレポートテンプレートでは `fancy-units` パッケージを採用しています．単位に関するパッケージはこれからのアップデート次第で，このレポートテンプレートで採用するパッケージも変更する可能性があります．]．
単位のみの出力は `#unit[]` コマンド，数値と単位を併せての出力は `#qty[][]` コマンドを使用します．
`#qty[][]` コマンドを使用すると，数値と単位の間に適切な長さの空白を自動で入れてくれます．

#showybox(
  frame: bluebox,
  title: [`fancy-units` パッケージの単位コマンド],
)[
  #align(center)[
    #mytable[
      #table(
        columns: (90mm, 50mm),
        inset: 6pt,
        table.header([コマンド], [出力]),
        [`#unit[W / ((m^2 K))]`], $#unit[W / ((m^2 K))]$,
        [`#unit(per-mode: "power")[W / (m^2 K)]`], $#unit(per-mode: "power")[W / (m^2 K)]$,
        [`#unit(per-mode: "fraction")[W / (m^2 K)]`], $#unit(per-mode: "fraction")[W / (m^2 K)]$,
        [`#qty[45][W / ((m^2 K))]`], $#qty[45][W / ((m^2 K))]$,
        [`#qty[45][u:m]`], $#qty[45][u:m]$,
        [`45 degree`], $45 degree$,
        [`#qty[45][celsius]`], $#qty[45][celsius]$,
        [`#qty[45][mL]`], $#qty[45][mL]$,
        table.hline(),
      )
    ]
  ]
]

最後に示したミリリットル $#unit[mL]$ には気をつけてください．リットル $#unit[L]$ を昔は ℓ と表記したこともありましたが，「単位は直立体」という原則に合わないのでやめましょう．
また，小文字の $#unit[l]$ だと数字の $1$ と紛らわしいので，人名由来の単位ではありませんがリットルは大文字 $#unit[L]$ で書くようにしましょう．

