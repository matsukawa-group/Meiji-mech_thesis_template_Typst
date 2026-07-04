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

後で第~@sec:bib-cite~節でも述べますが，文献を本文中で引用する際は `@Matsukawa:PoF2022` や `#citet(<Matsukawa:PoF2022>)` のように参照キーを使います．
このときの `Matsukawa:PoF2022` が参照キーです．
参照キーの書き方に特に規則は無く，半角カンマ以外の半角記号も使用可能です．
ただ，自分の中でマイルールを設けておくと引用する際に楽です．
私の場合は原則として #box(fill: luma(80%))[著者]:#box(fill: luma(80%))[誌名]#box(fill: luma(80%))[年] としています．
また，エントリー名とフィールド名は大文字と小文字を区別しませんが，参照キーは区別するので気をつけてください．

エントリーは雑誌論文や学位論文といった，その文献の該当する種別を表します．
このテンプレートでサポートされているエントリーは `article`, `book`, `booklet`, `comment`, `conference`, `inbook`, `incollection`, `inproceedings`, `manual`, `mastersthesis`, `misc`, `online`, `phdthesis`, `proceedings`, `techreport`, `unpublished` の 16 種類です．
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

