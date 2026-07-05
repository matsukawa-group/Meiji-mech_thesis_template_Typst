// 設定ファイル
#import "../settings.typ": *

= 参考文献リストの作成と出力
<ch:bibliography>

参考文献の引用方法は Harvard 方式と Vancouver 方式に大別できます．

- Harvard 方式
  - 本文中での引用はいわゆる author-year 方式．「著者名」と「発行年」を記載する．
  - 本文中での引用は苗字だけでの記載が多い．引用例：
    - 著者 1 名：Reynolds (1883)
    - 著者 2 名：Schmid and Henningson (2001)
    - 著者 3 名以上：Berghout et al. (2020)
  - et al. はラテン語で「その他」を意味する et alii の略．Italic 体で _et al._ と書くことも多い．
  - 論文末尾の文献リストは著者名のアルファベット順でソート．
- Vancouver 方式
  - 本文中での引用は番号．
  - 本文中での引用例：～が明らかになっている [1, 2]．
  - 論文末尾の文献リストは本文での登場順でソート．

このレポートテンプレートでは #link("https://typst.app/universe/package/enja-bib/")[`enja-bib`] パッケージを利用して，BibTeX 形式の文献データベースから参考文献を出力しているため，日本語文献と英語文献で異なるスタイルを適用できるようにしています．

== 本文中での引用方法
<sec:bib-cite>

文献を文章中で引用する際の主なコマンドは以下の通りです．

#showybox(
  frame: bluebox,
  title: [文献を引用するためのコマンド],
)[
  #align(center)[
    #mytable2[
      #table(
        columns: (20mm, 130mm),
        inset: 6pt,
        // table.header([コマンド], [出力]),
        [コマンド], [`@Reynolds:PhilTransRoySoc1883`],
        [出力], [@Reynolds:PhilTransRoySoc1883],
        [コマンド], [`#citen(<Reynolds:PhilTransRoySoc1883>)`],
        [出力], [#citen(<Reynolds:PhilTransRoySoc1883>)],
        [コマンド], [`#citet(<Reynolds:PhilTransRoySoc1883>)`],
        [出力], [#citet(<Reynolds:PhilTransRoySoc1883>)],
        [コマンド], [`#citep(<Reynolds:PhilTransRoySoc1883>)`],
        [出力], [#citep(<Reynolds:PhilTransRoySoc1883>)],
        [コマンド], [`@Reynolds:PhilTransRoySoc1883,@Matsukawa:PoF2022`],
        [出力], [@Reynolds:PhilTransRoySoc1883,@Matsukawa:PoF2022],
        [コマンド], [`#citen(<Reynolds:PhilTransRoySoc1883>,<Matsukawa:PoF2022>)`],
        [出力], [#citen(<Reynolds:PhilTransRoySoc1883>,<Matsukawa:PoF2022>)],
        [コマンド], [`#citet(<Reynolds:PhilTransRoySoc1883>,<Matsukawa:PoF2022>)`],
        [出力], [#citet(<Reynolds:PhilTransRoySoc1883>,<Matsukawa:PoF2022>)],
        [コマンド], [`#citep(<Reynolds:PhilTransRoySoc1883>,<Matsukawa:PoF2022>)`],
        [出力], [#citep(<Reynolds:PhilTransRoySoc1883>,<Matsukawa:PoF2022>)],
        table.hline(),
      )
    ]
  ]
]


== 書誌情報ファイル（`bib` ファイル）の作り方
<sec:bib-file>

ここでは書誌情報ファイル（`bib` ファイル）の作り方，使い方を説明します．
ユーザー側で書誌情報の管理をするためのファイルが `bib` ファイルです．
`bib` ファイルに書かれた書誌情報をもとにして，TeX/LaTeX では BibTeX/biblatex の機能を使用して文献リストを自動で作成します．
Typst でも `bib` ファイルを使用して文献リストを自動で作成することができます．
このテンプレートマニュアルの末尾の参考文献リストは，`template-manual.pdf` と同じディレクトリにある `mybib_en.bib` と `mybib_ja.bib` という 2 つの `bib` ファイルを読み込んで作成しています．
`bib` ファイルに入力する書誌情報は次のような構造になっています．

```BibTeX
@エントリー名{参照キー,
    フィールド 1 = {},
    フィールド 2 = {},
    フィールド 3 = {}
}
```

だいたいの雑誌論文のウェブサイトでは BibTeX 形式で書誌情報を出力できる機能があるのでそこから `bib` ファイルをダウンロードします．
もちろん，ダウンロードした `bib` ファイルを自分で書き換えることもできますし，自分で一から `bib` ファイルを作成することも可能です．

第~@sec:bib-cite~節でも述べましたが，文献を本文中で引用する際は `@Matsukawa:PoF2022` や `#citet(<Matsukawa:PoF2022>)` のように参照キーを使います．
このときの `Matsukawa:PoF2022` が参照キーです．
参照キーの書き方に特に規則は無く，半角カンマ以外の半角記号も使用可能です．
ただ，自分の中でマイルールを設けておくと引用する際に楽です．
私の場合は原則として #box(fill: luma(80%))[著者]:#box(fill: luma(80%))[誌名]#box(fill: luma(80%))[年] としています．
また，エントリー名とフィールド名は大文字と小文字を区別しませんが，参照キーは区別するので気をつけてください．

エントリーは雑誌論文や学位論文といった，その文献の該当する種別を表します．
このテンプレートでサポートされているエントリーは #link(<entry:article>)[`@article`], #link(<entry:book>)[`@book`], #link(<entry:booklet>)[`@booklet`], #link(<entry:comment>)[`@comment`], `@conference`, `@inbook`, `@incollection`, `@inproceedings`, `@manual`, `@mastersthesis`, `@misc`, `@online`, `@phdthesis`, `@proceedings`, `@techreport`, `@unpublished` の 16 種類です．
それぞれのエントリーで必須となるフィールドが異なり，文献一覧への出力の方法も異なるので面倒くさがらずに分類しましょう．
ただ，全ての文献を正確に分類することは難しく，判断が人により異なることもあります．
このテンプレートにおける分類の仕方も見る人によっては違和感を覚えるものがあるかもしれません．

フィールドはその文献の著者情報や誌名情報を入力するデータ項目です．
このテンプレートでは `access`, `address`, `archivePrefix`, `author`, `booktitle`, `chapter`, `doi`, `edition`, `editor`, `eprint`, `howpublished`, `institution`, `journal`, `key`, `langid`, `language`, `month`, `note`, `number`, `organization`, `pages`, `publisher`, `school`, `series`, `title`, `type`, `url`, `volume`, `year`, `yomi` がサポートされています．
フィールドの値は
```BibTeX
    author = {Matsukawa, Yuki and Tsukahara, Takahiro}
    author = "Matsukawa, Yuki and Tsukahara, Takahiro"
```
のように `{ }` または `" "` で囲います．
フィールドの詳細は以下の通りです（エントリーの分類同様，人によって意見が異なる場合があります）．
また，不要なフィールドがあっても無視されるだけなので邪魔であれば消しても構いません．

=== 各フィールドの詳細
<ssec:bib-field>

- `access`\ Webページを閲覧した日付（参照日）を記入します．`@online` でのみ有効です．
// 書き方の詳細は第~\ref{ssec:online}節（\ttonline）を参照．
- `address`\ 出版社（`publisher`）の住所．このテンプレートでは出力しません．
- `archivePrefix`\ arXiv 上の文献を引用する際に自動で出力されます．このテンプレートでは `archivePrefix` があると arXiv の文献として判断します．
- `author`\ 文献の著者情報を入力します．日本語文献でも英語文献でも
  ```BibTeX
  author = {Family, Given and Family, Given and Family, Given}
  author = {Given Family and Given Family and Given Family}
  ```
  の形式で書いてください．
  例えば #citet(<Tsukahara:TSFP2005>) と #citet(<堀本:可視化情報2020>) の場合だと
  ```BibTeX
  author = {Tsukahara, Takahiro and Seki, Yohji and Kawamura, Hiroshi and Tochio, Daisuke}
  author = {堀本, 康文 and 川口, 靖夫 and 塚原, 隆裕}
  ```
  のようになります．`Family, Given` で書く場合は日本語文献でも半角カンマと半角スペースで姓と名を区切ります．また，著者が複数いる場合は `and` で著者を区切ります．日本語文献の場合は後述の `yomi` フィールドで読み方を指定してください．
- `booktitle`\ 書籍の名前ですが，`@conference`, `@incollection`, `@inproceedings` で使われることからわかるように，引用する文献が書籍のうちの一部である場合の書籍そのものの題名を書きます．例えば，#citet(<Lueptow:Springer2000>) はそれ単独で Stability and experimental velocity field in Taylor--Couette flow with axial and radial flow という題目（`title`）を持っていますが，これは Physics of Rotating Fluids という書籍（`booktitle`）の一部です．
- `chapter`\ 書籍の一部の章を引用するときに使用します．このテンプレートでは出力しません．
- `doi`\ 文献のデジタルオブジェクト識別子（Digital Object Identifier, DOI）を入力します．学術論文だけでなく Springer 等の書籍などにも DOI が割り当てられています．このテンプレートでは `doi` フィールドの値を読み込んで文献情報の末尾に出力するようにしています．また，このテンプレートでは `doi` の方が `url` よりも優先されるので，`doi` と `url` の両方に値が入っていた場合は `doi` の内容を優先して表示します．
- `edition`\ （第3版などの）版を入力します．#citet(<奥村:技評2020>) のように `title = {［改訂第8版］LaTeX2e 美文書作成入門}` と `title` の中に書いてしまってもいいと思います．
- `editor`\ 編者名を入力します．書き方は著者名（`author`）と同じですが，出力時に「編」や「ed.」と付くようにしています．
- `eprint`\ 論文の eprint を入力します．arXivから BibTeX 形式で書誌情報を出力するとデフォルトで入ってくるフィールドです．
        // \jsmefile では \ttarchivePrefix フィールドがあった場合に \tteprint の情報からarXivの該当論文へのハイパーリンクを生成します（詳細は第~\ref{ssec:misc}節 \ttmisc を参照）．
- `howpublished`\ 特殊な出版形態をとる場合の説明を入力します．
        // また，第~\ref{ssec:misc}節では学部の卒業論文を \ttmisc に分類する際に \tthowpublished に「xx大学xx学部xx学科卒業論文」と書くことにしています．
- `institution`\ 技術報告書（`@techreport`）でのみ使用されるフィールドです．報告書が出された機関名を入力します．
- `journal`\ 学術雑誌論文が出された誌名を入力します．`@article` でのみ有効なフィールドです．
- `key`\ 著者名に相当するものが無い場合，ソートに利用します．
- `langid`, `language`\ その文献が書かれている言語を指定するフィールドです．
- `month`\ 出版された月を入力します．このテンプレートでは出力しません．
- `note`\ 注記．学会の講演番号などをここに書いてください．
- `number`\ 雑誌等の号数を入力します．
- `organization`\ 会議の主催者・団体やマニュアルを出している機関を入力します．
- `pages`\ ページ番号を入力します．
- `publisher`\ 出版社の名前を入力します．
- `school`\ 学校名を入力します．`@mastersthesis` と `@phdthesis` でのみ有効なフィールドです．学部の卒業論文の場合は `@misc` に分類し，`school` フィールドの代わりに `howpublished` を使用してください．
- `series`\ 書籍のシリーズを入力します．`@book` と `@inbook` でのみ有効なフィールドです．
- `title`\ 文献のタイトルを入力します．このテンプレートでは標準設定として，英語文献の場合はタイトル冒頭以外のアルファベットを全て小文字に変換して出力します（sentence case）．ただし，固有名詞や二次元を表す 2D などのようにタイトルの途中で大文字を使用する場合は
  ```BibTeX
  title = {Subcritical transition of {Taylor--Couette--Poiseuille} flow at high radius ratio}
  title = {A mathematical consideration of vortex thinning in {2D} turbulence}
  ```
  のように `{ }` で囲めば該当箇所はそのままの形で出力してくれます #citep(<Matsukawa:PoF2022>,<Yoneda:arXiv2016>)．
- `type`\ `@techreport` でのみ有効なフィールドです．
- `url`\ 文献やウェブページの URL を入力します．`doi` フィールドと `url` フィールドの両方に値が入っていた場合は `doi` の内容を優先して表示します．
- `volume`\ 雑誌等の巻数（第 3 巻，Vol.~3 など）を入力します．このテンプレートでは *bold* 体で出力します．
- `year`\ 発行年を入力します．学位論文の場合は修了「年」を記入します
        // （第~\ref{ssec:mastersthesis}節 \ttmastersthesis を参照）．
- `yomi`\ 著者（`author`）の読みを入力します．`yomi` の内容から判断してアルファベット順に文献をソートしてくれます．
  ```BibTeX
  yomi = {Matsukawa, Yuki and Tsukahara, Takahiro}
  ```
  のようにローマ字で読みを書くと，英語文献と日本語文献を混ぜてアルファベット順でソートしてくれます．

=== 各エントリーの詳細
<ssec:bib-entry>

- `@article` <entry:article>
  - 必須項目\ `author`, `title`, `journal`, `year`
  - オプション項目\ `volume`, `number`, `pages`, `month`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," #box(fill: luma(80%))[_`journal`_] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[*`volume`*] (#box(fill: luma(80%))[`number`]), #box(fill: luma(80%))[`pages`], (#box(fill: luma(80%))[`note`]), DOI: #box(fill: luma(80%))[`doi`].
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[`journal`] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[*`volume`*] (#box(fill: luma(80%))[`number`]), #box(fill: luma(80%))[`pages`], (#box(fill: luma(80%))[`note`]), DOI: #box(fill: luma(80%))[`doi`].
    ```BibTeX
    @article{Matsukawa:PoF2022,
        author  = {Matsukawa, Yuki and Tsukahara, Takahiro},
        title   = {Subcritical transition of {Taylor--Couette--Poiseuille} flow at high radius ratio},
        journal = {Physics of Fluids},
        volume  = {34},
        number  = {7},
        year    = {2022},
        doi     = {10.1063/5.0096676},
        url     = {https://doi.org/10.1063/5.0096676},
        note    = {074109}
    }
    ```
  - `@article` は雑誌に掲載された論文です．流体力学分野では英文雑誌だと _Journal of Fluid Mechanics_ #footnote[_Journal of Fluid Mechanics_, <#link("https://www.cambridge.org/core/journals/journal-of-fluid-mechanics")>] や _Physics of Fluids_ #footnote[_Physics of Fluids_, <#link("https://pubs.aip.org/aip/pof")>] などが挙げられます．国内雑誌だと日本機械学会誌 #footnote[日本機械学会誌, <#link("https://www.jsme.or.jp/publication/kaisi/")>]や日本流体力学会誌『ながれ』#footnote[日本流体力学会誌『ながれ』, <#link("https://www.nagare.or.jp/publication/nagare.html")>]などが該当します．
- `@book` <entry:book>
  - 必須項目\ `author` / `editor`, `title`, `publisher`, `year`
  - オプション項目\ `volume`, `number`, `series`, `address`, `edition`, `month`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," #box(fill: luma(80%))[_`publisher`_] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[*`volume`*] (#box(fill: luma(80%))[`number`]), (#box(fill: luma(80%))[`note`]), DOI: #box(fill: luma(80%))[`doi`].
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[`publisher`] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[*`volume`*] (#box(fill: luma(80%))[`number`]), (#box(fill: luma(80%))[`note`]), DOI: #box(fill: luma(80%))[`doi`].
    ```BibTeX
    @book{Schmid:Springer2001,
        author      = {Peter J. Schmid and Dan S. Henningson},
        title       = {Stability and Transition in Shear Flows},
        publisher   = {Springer New York},
        year        = {2001},
        doi         = {10.1007/978-1-4613-0185-1}
    }
    ```
  - 出版社が刊行した書籍を引用する際は `@book` を使います．似たエントリーとして `@inbook` がありますが，特定のページを参照したのではなく，書籍全体を参照した場合は `@book` を使いましょう．このテンプレートでは _Springer_ #footnote[Springer, <#link("https://www.springer.com/jp")>]や朝倉書店#footnote[朝倉書店, <#link("https://www.asakura.co.jp/")>]，丸善出版#footnote[丸善出版, <#link("https://www.maruzen-publishing.co.jp/")>]等の出版社から出た書籍を `@book` に分類しています．`publisher` フィールドにはこれらの出版社名を入れましょう．また，`@book` では `author` か `editor` か選べるようになっています．特定の著者ではなく学会等の編者を記載する場合には `editor` を使用してください．日本機械学会が編集している『JSMEテキストシリーズ』や『伝熱工学資料』などを引用する際は `editor` を使いましょう．
- `@booklet` <entry:booklet>
  - 必須項目\ `title`
  - オプション項目\ `author`, `howpublished`, `address`, `month`, `year`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," #box(fill: luma(80%))[_`howpublished`_] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: #box(fill: luma(80%))[`url`].
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[`howpublished`] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: #box(fill: luma(80%))[`url`].
    ```BibTeX
    @booklet{Wang:MEnews2014,
        author          = {Wang, Lin},
        title           = {Exchange student from {Northwestern Polytechnical University (China)}},
        howpublished    = {ME Newsletter, Department of Mechanical Engineering, Tokyo University of Science},
        year            = {2014},
        url             = {https://www.rs.tus.ac.jp/me/pdf/newsletter/ME_NL_No15.pdf}
    }
    ```
  - `@booklet` は使う機会が少ないため分類が難しいエントリーですが，出版社が明記されていないような（薄い）冊子媒体が該当します．このテンプレートでは例として東京理科大学理工学部機械工学科（現・創域理工学部機械航空宇宙工学科）が毎年出している ME ニュースレター#footnote[MEニュースレター, <#link("https://www.rs.tus.ac.jp/me/newsletter.html")>]という広報の冊子を引用しました．
- `@comment` <entry:comment>
  - 必須項目\ なし
  - オプション項目\ なし
  - 出力\ 出力されない
    ```BibTeX
    @comment{
    %%%%%%%%%%%%%%%%%%%
    %%%%% 英語文献 %%%%%
    %%%%%%%%%%%%%%%%%%%
    }
    ```
  - `bib` ファイル内でコメントを書く場合に用います．









