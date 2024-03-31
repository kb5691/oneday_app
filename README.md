# Oneday

![](https://storage.googleapis.com/zenn-user-upload/58a37b656f28-20230211.jpg)

- アプリ : ~~https://oneday-app.com/~~
  - 料金の都合上、 停止しています。
- Zenn : https://zenn.dev/kaito_o/articles/9071d09e1454ba

## アプリ概要

- 1 人で楽しめるスポットを登録して、評価やおすすめポイントなどを共有することができます。
- 他の人の投稿にコメントやいいねができ、おすすめスポットを通して交流することができます。

![](https://storage.googleapis.com/zenn-user-upload/1fe8464cd02c-20230219.gif)

## 開発背景

私自身が地元を離れて暮らしており、休日に 1 人で過ごすという経験が多くありました。

休日に観光スポットに行ってみたり、ふらっと目的を決めず外出をしてみたりという経験から 1 人でも楽しめるスポットがあることに気づきました。

そのような経験から 1 人でも楽しめるスポットを共有できたり、他の人のおすすめスポットを知ることができるアプリがあればと思い作成しました。

今回のアプリ作成では以下の**ターゲット**をイメージしました。

1. 地元を離れて暮らし始めた人
2. 友人は多くないが出かけるのが好きな人
3. 1 人で出かけるのが好きな人

## 使用技術

| 項目             | 内容                                                                        |
| ---------------- | --------------------------------------------------------------------------- |
| フロントエンド   | HTML/Sass/JavaScript                                                        |
| バックエンド     | Ruby(バージョン 2.7.3)                                                      |
| フレームワーク   | Ruby on Rails(バージョン 6.1.7)                                             |
| インフラ         | AWS                                                                         |
| データベース     | PostgreSQL                                                                  |
| コード管理       | GitHub                                                                      |
| コード解析       | RuboCop                                                                     |
| テストツール     | RSpec                                                                       |
| gem              | device/devise-i18n/rails-i18n/carrierwave/mini_magick/kaminari/ransack など |
| API              | Google Maps API                                                             |
| コードエディター | Visual Studio Code                                                          |
| 作図ツール       | draw.io(画面遷移図、ER 図)                                                  |

## 構成図

### 画面遷移図

![](https://storage.googleapis.com/zenn-user-upload/63fc32fa0056-20230224.png)

### ER 図

![](https://storage.googleapis.com/zenn-user-upload/33933c5ee68c-20230224.png)

### インフラ構成図

![](https://storage.googleapis.com/zenn-user-upload/c9a1af6a61ce-20230503.png)

## 機能一覧

| 項目                 | 内容                                                 |
| -------------------- | ---------------------------------------------------- |
| ログイン関連         | ログイン、ログアウト、ゲストログイン                 |
| ユーザー関連         | 登録、編集、削除                                     |
| おすすめスポット関連 | 登録、編集、削除                                     |
| 検索                 | タイトル、シチュエーション、エリアで部分一致検索     |
| コメント             | 投稿にコメントができる、削除は自分のコメントのみ可能 |
| いいね               | 投稿にいいねができる                                 |
| マイページ           | アカウント編集と削除、投稿一覧と投稿の編集、削除     |

### 検索

タイトル、シチュエーション、エリアでおすすめスポットを検索することができます。
検索は部分一致検索で行います。

![](https://storage.googleapis.com/zenn-user-upload/0624fe92aef2-20230305.gif)

### おすすめスポット詳細

おすすめスポットについてのおすすめポイントや評価、地図を確認することができます。
気になった投稿にはいいねやコメントを投稿することも可能です。

![](https://storage.googleapis.com/zenn-user-upload/ec755c2d5d03-20230305.gif)

### マイページ

アカウント情報の編集やアカウントの削除が行えます。
投稿一覧では投稿の編集、削除が行えます。

![](https://storage.googleapis.com/zenn-user-upload/b5e0c30001b7-20230305.gif)

## 工夫した点

### ゲストログインの導入

トップページにゲストログインボタンを設置し、アカウント登録を行わなくてもアプリを使用できるようにしました。

ゲストアカウントではアカウント削除ができないように設定し、その他の機能は基本的に使用できるようになっています。

### Google Maps API 導入

Google Maps API を導入しおすすめスポットの地図を表示できるように設定しました。

ユーザーはどんな場所におすすめスポットがあるのかイメージができるので、ユーザーはよりよい体験ができるようになっています。

### チーム開発を意識

実務での開発を想定して Git, GitHub を用いたコード管理を行いました。

commit メッセージは他の人が見てもわかるようにコメントを行い、実装する機能に応じて`feature/xxx_xxx`の形式でブランチを切るようにしました。

また、コメントを追加することでどのような実装をしているのかを明確にし、他の人が作業をする場合でもわかりやすいように実施しました。

### RuboCop を使用したコード解析

`commit`前に必ずコード解析を行い、不備があれば修正してリモートブランチに反映していました。

チーム開発ではルールを決めて実装を行うことが必須だと思うので、自分の中でもルール決めを行い開発をしていました。

### いいねの非同期処理

いいねボタンをクリックした際にページ全体をリロードせず、いいねボタンのみ変更することで非同期処理を行っています。

### RSpec を使用したテストコードの実装

正常系だけでなく、異常系のテストも実装することで開発時のコードに問題がないかを担保できるようにしています。

実装内容の洗い出しなどをすることで、ユーザーがどのような操作を行うかやどのような条件を満たす必要があるのかなども整理しながら開発を実施しました。
