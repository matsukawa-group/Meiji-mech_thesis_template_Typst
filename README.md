# Meiji-mech_thesis_template_Typst

【非公式】明治大学理工学部機械工学科・大学院理工学研究科機械工学専攻の学位論文 Typst テンプレートです．
同学科・同専攻であれば所属研究室によらずこのテンプレートを使用可能です．
パブリックリポジトリなので他研究室所属の方もご自身の PC に入れることができます．
使用する際に流体力学研究室の許可を取る必要はありませんが，このテンプレートを使用したことで生じた問題に関して大学・学科・流体力学研究室および研究室に所属する個人は一切の責任を負いませんのでご了承ください．

## リポジトリの構成

```
Meiji-mech_thesis_template_Typst/
├── .gitignore                    # Git の追跡対象から除外するファイルを指定
├── LICENSE                       # 本テンプレートのライセンス
├── README.md                     # リポジトリの概要および使用方法
├── main.typ                      # 学位論文のメイン Typst ファイル
├── settings.typ                  # 文書全体の書式および各種設定
├── mybib_en.bib                  # 欧文文献の BibTeX データベース
├── mybib_ja.bib                  # 和文文献の BibTeX データベース
│
├── chapter/                      # 論文本文を章ごとに分割した Typst ファイル
│   ├── acknowledgement.typ       # 謝辞
│   ├── appendix.typ              # 付録
│   ├── basic.typ                 # 基本的な文章・数式の記述例
│   ├── bibliography.typ          # 引用および参考文献
│   ├── figure_table.typ          # 図および表の記述例
│   ├── symbol.typ                # 記号・単位等の記述例
│   └── theorem.typ               # 定理環境等の記述例
│
├── figure/                       # 論文で使用する図
│
└── template-manual/              # テンプレートの使用方法を示したマニュアル
    ├── chapter/                  # マニュアル本文
    ├── figure/                   # マニュアルで使用する図
    ├── mybib_en.bib              # 欧文文献データベース
    ├── mybib_ja.bib              # 和文文献データベース
    ├── settings.typ              # マニュアル用設定ファイル
    ├── template-manual.typ       # マニュアルのメイン Typst ファイル
    └── template-manual.pdf       # コンパイル済みマニュアル
```

## 卒論・修論用リポジトリの作成

ここでは学位論文用リポジトリの作成方法を説明します．

1. Organization ではなく個人の GitHub アカウントに空のリポジトリを作成．ここでは仮に `master_thesis` というリポジトリ名にする．リポジトリ作成時に `README.md` や `.gitignore` は作成しない．
2. Private になっていることを確認したら Create repository を押す．
3. このテンプレートのリポジトリをローカルにクローンする．

例えば松川（`Yuki-MATSUKAWA`）が修士論文を執筆する場合：

```
# ローカルにテンプレートをクローン
git clone https://github.com/matsukawa-group/Meiji-mech_thesis_template_Typst master_thesis
cd master_thesis

# リモート URL を自身のものに変更
git remote set-url origin https://github.com/Yuki-MATSUKAWA/master_thesis

# URL の変更が反映されているか確認
git remote -v

# 自身のリモートリポジトリにテンプレートの中身を反映
git push origin HEAD
```

これでテンプレートの中身が自身の学位論文リポジトリに反映されたので自由に編集して大丈夫です．

## テンプレートへの修正の反映

この学位論文テンプレートが更新された場合は，以下のコマンドを実行して自身のリポジトリに反映してください．

```
# この学位論文テンプレートのリポジトリを登録
git remote add upstream https://github.com/matsukawa-group/Meiji-mech_thesis_template_Typst.git

# テンプレートの最新状態を取得
git fetch upstream

# 自分が main ブランチにいることを確認し，テンプレートの最新状態をマージ
git switch main && git merge upstream/main

# 自身のリモートリポジトリを更新
git push origin HEAD
```

