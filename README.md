# Meiji-mech_thesis_template_Typst

【非公式】明治大学理工学部機械工学科・大学院理工学研究科機械工学専攻の学位論文 Typst テンプレートです．
同学科・同専攻であれば所属研究室によらずこのテンプレートを使用可能です．
パブリックリポジトリなので他研究室所属の方もご自身の PC に入れることができます．
使用する際に流体力学研究室の許可を取る必要はありませんが，このテンプレートを使用したことで生じた問題に関して大学・学科・流体力学研究室および研究室に所属する個人は一切の責任を負いませんのでご了承ください．

## Typst について

### Typst の環境構築

ターミナル上で以下のように入力する．

Windows の場合：

```
winget install --id Typst.Typst
```

Mac の場合：

```
brew install typst
```

### Typst のアップデート

ターミナル上で以下のように入力する．

```
typst update
```

### Visual Studio Code を使用する場合

エディタとして Visual Studio Code を使用すると編集が楽です．
拡張機能として [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) を入れておくと，`Ctrl` + `K` `V` でリアルタイムのプレビューを見ることができます．

### フォントについて

OS によらず同じ見た目の PDF が得られるように，このテンプレートでは以下のフォントを使用しています．
各自でフォントをインストールする必要はありません．

| 用途 | フォント | 入手元 |
| --- | --- | --- |
| 本文（欧文） | New Computer Modern | Typst に内蔵 |
| 本文（和文） | BIZ UD明朝（BIZ UDMincho） | `fonts/` に同梱 |
| 見出し等（欧文・和文） | BIZ UDPゴシック（BIZ UDPGothic） | `fonts/` に同梱 |

BIZ UD フォントはモリサワのユニバーサルデザインフォントです．
同梱しているフォントファイルは [Google Fonts](https://fonts.google.com/specimen/BIZ+UDMincho) で配布されているもので，[SIL Open Font License 1.1](https://openfontlicense.org/) のもとで再配布しています（ライセンス文は `fonts/` 内の各 `OFL.txt` を参照）．
Windows に標準で入っている BIZ UD フォントは使用許諾が異なるため，`fonts/` 内のファイルを置き換えないでください．

#### フォントを読み込むための設定

同梱フォントを Typst に読み込ませる必要があります．
必要な設定は OS ではなく，コンパイルの方法によって異なります．

| コンパイルの方法 | 必要な設定 |
| --- | --- |
| Visual Studio Code + Tinymist | 不要（`.vscode/settings.json` で設定済み） |
| ターミナルで `typst` コマンドを使う（Windows・Mac 共通） | `--font-path fonts` を付ける |

- Visual Studio Code + Tinymist の場合：
  このリポジトリのフォルダ（`main.typ` があるフォルダ）を VS Code で「フォルダーを開く」で開いてください．
  親フォルダを開いた場合や，ファイル単体で開いた場合は `.vscode/settings.json` が読み込まれません．
- ターミナルの場合：
  リポジトリのフォルダで以下のように入力します．

  ```
  # 学位論文をコンパイル
  typst compile --font-path fonts main.typ

  # 保存するたびに自動でコンパイル
  typst watch --font-path fonts main.typ

  # テンプレートマニュアルをコンパイル
  typst compile --font-path fonts template-manual/template-manual.typ
  ```

  毎回オプションを付けるのが面倒な場合は，環境変数 `TYPST_FONT_PATHS` にこのリポジトリの `fonts` フォルダの絶対パスを設定しておけば `--font-path` を省略できます．

#### フォントが読み込まれているかの確認

以下のコマンドの出力に `BIZ UDMincho` と `BIZ UDPGothic` が含まれていれば正しく読み込まれています．

```
typst fonts --font-path fonts
```

コンパイル時に `unknown font family: biz udmincho` のような警告が出る場合は，フォントが読み込まれていません．
この場合，PDF は別のフォントで作成されてしまうので上記の設定を確認してください．

## リポジトリの構成

```
Meiji-mech_thesis_template_Typst/
├── .gitignore                    # Git の追跡対象から除外するファイルを指定
├── .vscode/
│   └── settings.json             # Tinymist で同梱フォントを読み込むための設定
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
│   ├── conclusion.typ            # 結論
│   ├── discussion.typ            # 考察
│   ├── introduction.typ          # 序論
│   ├── method.typ                # 計算手法・実験方法
│   ├── result.typ                # 結果
│   └── symbol.typ                # 記号表
│
├── figure/                       # 論文で使用する図
│
├── fonts/                        # 同梱フォント（SIL Open Font License 1.1）
│   ├── BIZUDMincho/              # BIZ UD明朝（本文の和文）
│   └── BIZUDPGothic/             # BIZ UDPゴシック（見出し等）
│
└── template-manual/              # テンプレートの使用方法を示したマニュアル
    ├── chapter/                  # マニュアル本文を章ごとに分割した Typst ファイル
    │   ├── acknowledgement.typ   # 謝辞
    │   ├── appendix.typ          # 付録
    │   ├── basic.typ             # 基本的な文章・数式の記述例
    │   ├── bibliography.typ      # 引用および参考文献
    │   ├── figure_table.typ      # 図および表の記述例
    │   ├── symbol.typ            # 記号表の記述例
    │   └── theorem.typ           # 定理環境等の記述例
    ├── figure/                   # マニュアルで使用する図
    ├── mybib_en.bib              # 欧文文献データベース
    ├── mybib_ja.bib              # 和文文献データベース
    ├── settings.typ              # マニュアル用設定ファイル
    ├── template-manual.typ       # マニュアルのメイン Typst ファイル
    └── template-manual.pdf       # コンパイル済みマニュアル
```

## 学位論文テンプレートの使用方法

### 卒論・修論用リポジトリの作成

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

### テンプレートへの修正の反映

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

## 参考文献

論文執筆のほか，Typst の使用方法に関して参考になる文献を紹介します．
また，このリポジトリの `template-manual/` のディレクトリには Typst の使い方に関して簡単な説明があります．
テンプレートマニュアルを含め，説明事項の一部は以下の文献と重複する箇所があります．
ご了承ください．

- [Typst ドキュメント 日本語版](https://typst-jp.github.io/docs/)
- [Typstの使い方](https://kumaroot.readthedocs.io/ja/latest/typst/typst-usage.html)
- [`tsukahara-lab/TUS-ME_thesis_typst_template`](https://github.com/tsukahara-lab/TUS-ME_thesis_typst_template)
- [`tsukahara-lab/TUS-ME_thesis_template`](https://github.com/tsukahara-lab/TUS-ME_thesis_template)
- [`ryo-ARAKI/thesis_template_ou_es`](https://github.com/ryo-ARAKI/thesis_template_ou_es)
- [`akira-okumura/MasterThesisTemplate`](https://github.com/akira-okumura/MasterThesisTemplate)
- [`Yuki-MATSUKAWA/JSME-bst`](https://github.com/Yuki-MATSUKAWA/JSME-bst)

