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

== `bib` ファイルについて
<sec:bib-file>

ユーザー側で書誌情報の管理をするためのファイルが `bib` ファイルです．
`bib` ファイルに書かれた書誌情報をもとにして，TeX/LaTeX では BibTeX/biblatex の機能を使用して文献リストを自動で作成します．
Typst でも `bib` ファイルを使用して文献リストを自動で作成することができます．
`bib` ファイルの書き方は #link("https://github.com/Yuki-MATSUKAWA/JSME-bst")[`JSME-bst`] 内の #link("https://github.com/Yuki-MATSUKAWA/JSME-bst/blob/main/JSME-template1.pdf")[`JSME-template1.pdf`] で詳細に書いてあるのでそちらをよく読んでください．
ウェブ上にも `bib` ファイルの書き方を解説しているサイトはたくさんあるので，そちらも参考にしてください．
`bib` ファイルに入力する書誌情報は次のような構造になっています．

```bibtex
@エントリー名{参照キー,
    フィールド 1 = {},
    フィールド 2 = {},
    フィールド 3 = {}
}
```

だいたいの雑誌論文のウェブサイトでは BibTeX 形式で書誌情報を出力できる機能があるのでそこから `bib` ファイルをダウンロードします．
もちろん，ダウンロードした `bib` ファイルを自分で書き換えることもできますし，自分で一から `bib` ファイルを作成することも可能です．
