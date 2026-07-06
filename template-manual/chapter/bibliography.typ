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
このテンプレートでサポートされているエントリーは #link(<entry:article>)[`@article`], #link(<entry:book>)[`@book`], #link(<entry:booklet>)[`@booklet`], #link(<entry:comment>)[`@comment`], #link(<entry:conference>)[`@conference`], `@inbook`, `@incollection`, `@inproceedings`, `@manual`, `@mastersthesis`, `@misc`, `@online`, `@phdthesis`, `@proceedings`, `@techreport`, `@unpublished` の 16 種類です．
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
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," #box(fill: luma(80%))[_`howpublished`_] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[`howpublished`] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
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
- `@conference` <entry:conference>
  - `@inproceedings` と同様なので省略．Scribe というシステムとの互換性のために残されているらしい #citep(<奥村:技評2020>)．
- `@inbook` <entry:inbook>
  - 必須項目\ `author` / `editor`, `title`, `chapter` / `pages`, `publisher`, `year`
  - オプション項目\ `volume`, `series`, `address`, `edition`, `month`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," #box(fill: luma(80%))[_`publisher`_] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[*`volume`*], #box(fill: luma(80%))[`pages`], (#box(fill: luma(80%))[`note`]), DOI: #box(fill: luma(80%))[`doi`].
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[`publisher`] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[*`volume`*], #box(fill: luma(80%))[`pages`], (#box(fill: luma(80%))[`note`]), DOI: #box(fill: luma(80%))[`doi`].
    ```BibTeX
    @inbook{Davidson:Oxford2015,
        author      = {Peter A. Davidson},
        title       = {Turbulence: An Introduction for Scientists and Engineers, Second Edition},
        publisher   = {Oxford University Press},
        year        = {2015},
        pages       = {61--104}
    }
    ```
  - `@book` に似ていますが，`@book` が書籍丸々一冊なのに対して `@inbook` は書籍中の一部から引用する場合に使用します．そのため，`@book` と異なり `pages` フィールドが使用可能です．また `@book` と同様，`author` と `editor` を選択できます．このテンプレートでは例として日本機械学会の『伝熱工学資料』と朝倉書店の『乱流工学ハンドブック』を `editor` で引用しています．
- `@incollection` <entry:incollection>
  - 必須項目\ `author`, `title`, `booktitle`, `year`
  - オプション項目\ `editor`, `pages`, `organization`, `publisher`, `address`, `month`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," #box(fill: luma(80%))[`booktitle`], #box(fill: luma(80%))[_`publisher`_] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[`pages`], (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[`booktitle`], #box(fill: luma(80%))[_`publisher`_] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[`pages`], (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
    ```BibTeX
    @incollection{Lueptow:Springer2000,
        author      = {Lueptow, Richard M.},
        title       = {Stability and experimental velocity field in {Taylor--Couette} flow with axial and radial flow},
        booktitle   = {Physics of Rotating Fluids},
        publisher   = {Springer-Verlag Berlin Heidelberg New York},
        pages       = {137--155},
        year        = {2000},
        doi         = {10.1007/3-540-45549-3}
    }
    ```
  - `@incollection` は分類が難しいエントリーの一つです．これは書籍の一部からの引用ですが，`@inbook` と異なる点は，引用箇所が独立して表題を持っているようなものを指します．学会等があるテーマについて組んだ特集といったイメージです．上記の #citet(<Lueptow:Springer2000>) の例では，それ単独で "Stability and experimental velocity field in Taylor--Couette flow with axial and radial flow" という題目（`title`）を持っていますが，これは "Physics of Rotating Fluids" という書籍（`booktitle`）の一部です．日本語文献では京都大学数理解析研究所の講究録 #footnote[京都大学数理解析研究所（RIMS）講究録, <#link("https://www.kurims.kyoto-u.ac.jp/ja/kokyuroku.html")>] や文部科学省科学研究補助金における特定の新学術領域研究の研究成果報告書等を `@incollection` に分類しています．それは `@inproceedings` だろとか `@techreport` だろとか言われそうな気もします．
- `@inproceedings` <entry:inproceedings>
  - 必須項目\ `author`, `title`, `booktitle`, `year`
  - オプション項目\ `editor`, `pages`, `organization`, `publisher`, `address`, `month`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," #box(fill: luma(80%))[_`booktitle`_] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[`pages`], (#box(fill: luma(80%))[`note`]), DOI: #box(fill: luma(80%))[`doi`].
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[_`booktitle`_] (#box(fill: luma(80%))[`year`]), #box(fill: luma(80%))[`pages`], (#box(fill: luma(80%))[`note`]), DOI: #box(fill: luma(80%))[`doi`].
    ```BibTeX
    @inproceedings{Matsukawa:ICFD2022,
        author      = {Matsukawa, Yuki and Tsukahara, Takahiro},
        title       = {Laminarization in Subcritical {Taylor--Couette--Poiseuille} Flow with Increasing Pressure Gradient},
        booktitle   = {Proceedings of 19th International Conference on Flow Dynamics},
        year        = {2022},
        pages       = {OS15-10}
    }
    ```
  - `@conference` と同様です．学会等の講演論文集の一部を引用するときに `@inproceedings` を使用します．`@article` や `@inbook` と並んで使用頻度の高いエントリーだと思います．`booktitle` フィールドには日本語なら `booktitle = {`#box(fill: luma(80%))[`学会名`]`講演論文集}`，英語なら `booktitle = {Proceedings of `#box(fill: luma(80%))[`学会名`]`}` と入力しましょう．`@proceedings` は講演論文集全体を引用しているのに対して，`@inproceedings` は講演論文集の中の一講演を引用しています．上の例では `pages` に講演番号を入れています．
- `@manual` <entry:manual>
  - 必須項目\ `title`
  - オプション項目\ `author`, `organization`, `address`, `edition`, `month`, `year`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]" (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」 (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
    ```BibTeX
    @manual{Tecplot2023,
        author  = "{Tecplot, Inc.}",
        title   = {Tecplot 360 Getting Started Manual},
        year    = {2023},
        url     = {https://tecplot.azureedge.net/products/360/current/360_getting_started.pdf}
    }
    ```
  - マニュアルや技術文書は `@manual` に分類しましょう．ただし，`author` フィールドが必須項目ではないので，このテンプレートでは企業名を `author` に入れています．
- `@mastersthesis` <entry:mastersthesis>
  - 必須項目\ `author`, `title`, `school`, `year`
  - オプション項目\ `address`, `month`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," _Master's Thesis_, #box(fill: luma(80%))[_`school`_] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[`school`]修士論文 (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
    ```BibTeX
    @mastersthesis{松川:修論2023,
        author  = {松川, 裕樹},
        yomi    = {Matsukawa, Yuki},
        title   = {直接数値解析を用いた高円筒比Taylor--Couette--Poiseuille流の流動状態遷移過程の分類},
        school  = {東京理科大学大学院理工学研究科機械工学専攻},
        year    = {2023}
    }
    ```
  - 修士論文は \ttmastersthesis に分類します．`@masterthesis` ではなく `@master`#text(fill: red)[`s`]`thesis`です．#text(fill: red)[`s`] を忘れないでください．また，`year` は修了「年度」ではなく修了「年」を西暦で書いてください．例えば，日本の大学を 2023 年 3 月に修了した人は 2022 年度修了生ですが `year = {2023}` です．
- `@misc`
  - 必須項目\ なし
  - オプション項目\ `author`, `title`, `howpublished`, `archivePrefix`, `eprint`, `month`, `year`, `note`, `key`, `doi`, `url`
  - 出力例（通常，英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," #box(fill: luma(80%))[_`howpublished`_] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
  - 出力例（通常，日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[`howpublished`] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
  - 出力例（arXiv の場合）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), arXiv: #box(fill: luma(80%))[`eprint`].
  - `bib` ファイル作成例（通常）
    ```BibTeX
    @misc{湯村:卒論2006,
        author          = {湯村, 翼},
        yomi            = {Yumura, Tsubasa},
        title           = {レイリーテイラー不安定による赤道電離圏プラズマバブルの発生},
        howpublished    = {北海道大学理学部地球科学科卒業論文},
        year            = {2006},
        url             = {https://researchmap.jp/yumu/published_papers/1902404}
    }
    ```
  - `bib` ファイル作成例（arXiv の場合）
    ```BibTeX
    @misc{Araki:arXiv2023,
        author          = {Araki, Ryo and Bos, Wouter J. T. and Goto, Susumu},
        title           = {Space-local {Navier--Stokes} turbulence}, 
        year            = {2023},
        eprint          = {2308.07255},
        archivePrefix   = {arXiv},
        primaryClass    = {physics.flu-dyn}
    }
    ```
  - その他該当種別が無いものは `@misc` とします．学部の卒業論文は `@misc` でいいと思います．ただし，`@mastersthesis` や `@phdthesis` と異なり，`school` のフィールドを使用できないので `howpublished` で代用します．したがって，`@mastersthesis` や `@phdthesis` では `school` に所属名だけ（例：`school = {東京理科大学大学院理工学研究科機械工学専攻}`）書けばよかったものが `@misc` で卒論を出力する際には `howpublished = {北海道大学理学部地球科学科卒業論文}` のように「`卒業論文`」の文字まで書く必要があります．該当するエントリーがよくわからなかったらとりあえず `@misc` に入れておくという人は多いと思います．また，arXiv #footnote[arXiv（「アーカイブ」と読みます）, <#link("https://arxiv.org/")>]と呼ばれるプレプリントサーバーから引用した文献は `@misc` に分類します．arXiv 上の Export BibTeX Citation と書いてあるところから文献情報を見ると `@misc` に分類されていることがわかると思います．この文献情報では上記のように `eprint = {2308.07255}`, `archivePrefix = {arXiv}` などと書かれていることが多いです．このテンプレートでは `eprint` の情報を利用して #quote-block[Araki, R., Bos, W. J. T. and Goto, S., "Space-local Navier--Stokes turbulence," (2023), arXiv: #link("https://doi.org/10.48550/arXiv.2308.07255")[`2308.07255`].]   のように自動で書いてくれます．`eprint` の情報から URL を自動生成するので，#link("https://doi.org/10.48550/arXiv.2308.07255")[`2308.07255`] と書かれている（青字の）箇所をクリックしたら arXiv の該当ページにジャンプできます．
- `@online` <entry:online>
  - 使用可能項目\ `author`, `title`, `howpublished`, `month`, `year`, `url`, `doi`, `access`, `note`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>, (accessed on: #box(fill: luma(80%))[`access`]).
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>, (accessed on: #box(fill: luma(80%))[`access`]).
    ```BibTeX
    @online{Kawamura_Ret64,
        author  = "{Kawamura Laboratory}",
        title   = {{DNS} Database of Wall Turbulence and Heat Transfer: Text database of {Poiseuille} flow for $"Re"_tau = 64$},
        year    = {},
        url     = {https://www.rs.tus.ac.jp/~t2lab/db/index.html},
        access  = {10 October, 2023}
    }
    ```
  - `@online` はウェブページ等のオンライン資料を引用する際に使用します．本来，ウェブページ等の引用はあまり推奨されるものではありませんが，データベースを研究室のウェブページ等で公開していることがある #footnote[乱流の分野におけるデータベースとしては，東京理科大学河村研究室（現在は塚原研究室が管理）<#link("https://www.rs.tus.ac.jp/~t2lab/db/index.html")> や東京大学笠木研究室（現在は複数の大学によって管理）<#link("https://thtlab.jp")> などが挙げられます．]ので使う機会がゼロとは言えないでしょう．ウェブページの場合は，情報が更新される可能性があるので，参照日を明記することが重要です．このテンプレートでは `access` フィールドを使って参照日を記載するようにしています．
- `@phdthesis` <entry:phdthesis>
  - 必須項目\ `author`, `title`, `school`, `year`
  - オプション項目\ `address`, `month`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," _Ph.D. Dissertation_, #box(fill: luma(80%))[_`school`_] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[`school`]博士論文 (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
    ```BibTeX
    @phdthesis{塚原:博論2007,
        author  = {塚原, 隆裕},
        yomi    = {Tsukahara, Takahiro},
        title   = {大規模直接数値シミュレーションによる低レイノルズ数平行平板間乱流の研究},
        school  = {東京理科大学大学院理工学研究科機械工学専攻},
        year    = {2007},
        url     = {https://iss.ndl.go.jp/books/R100000002-I000009177724-00}
    }
    ```
  - `@phdthesis` は博士論文が該当します．エントリー名に `@phdthesis` と入っていますが，英語文献の場合は dissertation と出力するように設定しています．基本的な使い方は `@mastersthesis` と同じです.
- `@proceedings`
  - 必須項目\ `title`, `year`
  - オプション項目\ `editor`, `organization`, `publisher`, `address`, `month`, `note`, `key`, `doi`, `url`
  - 出力例\ #box(fill: luma(80%))[`editor`], (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
    ```BibTeX
    @proceedings{THMT2023,
        editor  = "{THMT}",
        title   = "{Proceedings of 10th International Symposium on Turbulence, Heat and Mass Transfer}",
        yomi    = {THMT},
        year    = {2023}
    }
    ```
  - 学会の講演論文集全体を引用する際には `@proceedings` を使用します．`@conference` や `@inproceedings` は講演論文集の中の一講演を引用しているのに対して，`@proceedings` は講演論文集全体を引用しています．
- `@techreport`
  - 必須項目\ `author`, `title`, `institution`, `year`
  - オプション項目\ `type`, `number`, `address`, `month`, `note`, `key`, `doi`, `url`
  - 出力例（英語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`] and #box(fill: luma(80%))[`author 3`], "#box(fill: luma(80%))[`title`]," #box(fill: luma(80%))[_`institution`_] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
  - 出力例（日本語文献）\ #box(fill: luma(80%))[`author 1`], #box(fill: luma(80%))[`author 2`], #box(fill: luma(80%))[`author 3`],「#box(fill: luma(80%))[`title`]」, #box(fill: luma(80%))[_`institution`_] (#box(fill: luma(80%))[`year`]), (#box(fill: luma(80%))[`note`]), URL: <#box(fill: luma(80%))[`url`]>.
    ```BibTeX
    @techreport{Neuhart:NASAreport2004,
        author      = {Neuhart, Dan H. and McGinley, Catherine B.},
        title       = {Free-Stream Turbulence Intensity in the {Langley} 14- by 22-Foot Subsonic Tunnel},
        institution = {NASA Technical Publication},
        year        = {2004},
        url         = {https://ntrs.nasa.gov/citations/20040120956},
        note        = {TP-2004-213247}
    }
    ```
  - 研究機関等から発行された技術報告書は `@techreport` に分類します．技術報告書を発行している研究機関はさまざまありますが，例えば NASA #footnote[アメリカ航空宇宙局（NASA） Technical Reports Server, <#link("https://ntrs.nasa.gov/")>]や国立天文台 #footnote[大学共同利用機関法人 自然科学研究機構 国立天文台，国立天文台欧文報告, <#link("https://www.nao.ac.jp/about-naoj/reports/publications-naoj.html")>]，鉄道総研 #footnote[公益財団法人 鉄道総合技術研究所（鉄道総研），鉄道総研報告, <#link("https://www.rtri.or.jp/publish/rtrirep/")>]などが挙げられます．また，企業によっては技術報告書を公開しているところもあります．







