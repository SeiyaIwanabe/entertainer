## アプリケーション概要

ダンスのスキルを持つ関東圏のダンサーの**マッチングプラットフォームサービス**です。  
自分のスキルを活かせる環境を求めている人と広告やイベントを企画する方たちをマッチングさせます。  
僕自身、大学でダンスを始めましたが、自分たちの活躍の場がほしいと悩んでいる人が大勢いました。  
この課題を解決できないかと考え、アプリケーション制作に取り組みました。

<img width="1440" alt="スクリーンショット 2021-02-01 18 13 46" src="https://user-images.githubusercontent.com/67876040/106438508-ee058a80-64b9-11eb-85fa-3eae95b25e99.png">

#### ドメイン

http://entertainer-sample.work/

#### ゲストログイン

ヘッダー左のハンバーガーメニューを開いていただくとゲストログインのリンクがあります。  
そちらからゲストユーザーとしてログイン可能です。

## 機能一覧

- ユーザー新規登録/プロフィール編集
- ユーザーログイン・ログアウト機能/ゲストログイン機能
- イベント作成機能(イベント名,開催時間,開催地(都道府県),開催地(詳細),タグ付け,イベント詳細説明)/編集・削除機能
- イベントへのコメント機能
- イベント保存機能(ストック機能)
- ユーザーフォロー機能
- カレンダー機能(作成されたイベントがカレンダーに反映)
- ページネーション機能
- レスポンシブデザイン（480px 以下の場合に適用）

## 使用言語・技術一覧

**フロントサイド**

- HTML/Haml
- CSS/Scss
- Javascript/jQuery
- bootstrap4

**バックエンド**

- Ruby 2.6.5
- Ruby on rails 6.0.0

**使用した gem**

- haml-rails
- devise
- font-awesome-sass
- carrierwave
- rmagick
- kaminari
- ransack
- acts-as-taggable-on
- simple_calendar

**テスト**

- Rspec

**Linter/Fomatter**

- Prettier
- RuboCop

**データベース**

- ローカル環境 → MySQL 5.6.47
- 本番環境 → MariaDB

**アプリケーションサーバー**

- Unicorn

**Web サーバー**

- Nginx

**インフラ・開発環境**

- AWS(VPC,EC2,RDS,IAM,Route53,S3)
- Capistrano
- Docker（ローカル環境）

**その他使用ツール**

- テキストエディタ： Visual Studio Code
- タスク管理： Trello
- 作図： Lucidchart
- Web 制作ツール：Responsively
- 機械翻訳： DeepL

## インフラ構成図

![名称未設定ファイル](https://user-images.githubusercontent.com/67876040/107331525-6097eb00-6af6-11eb-807f-a9ee10a7ca47.png)

## ER 図

<img width="995" alt="スクリーンショット 2021-02-01 19 03 40" src="https://user-images.githubusercontent.com/67876040/106443763-3e7fe680-64c0-11eb-9ea4-ea9ec6e12500.png">

## 工夫した点

実装で工夫した点は大きく 2 つあります。

1. **タブの実装により、なるべく１つのページで情報をまとめる**
2. **イベントを探しやすいようにタグの使い方を工夫**

### 1. タブの実装により、なるべく１つのページで情報をまとめる

イベント詳細ページ、ユーザー管理画面にはユーザーやイベントに関する情報が混在しています。  
それらの情報にアクセスするためにページ遷移が起きるのは UI/UX の観点から良くないと思いました。  
<br>
そこでタブを実装することによって、複数の情報を 1 ページにまとめました。  
結果的にページ遷移することなく情報にアクセスできるようにしました。

![ezgif com-gif-maker (5)](https://user-images.githubusercontent.com/67876040/106564061-0c2dc200-6570-11eb-97a4-bb146a8c8740.gif)

### 2. イベントを探しやすいようにタグの使い方を工夫

トップページに予めタグを表示させることでイベント情報にアクセスしやすくしました。  
自分の求める条件に合致するイベントを探しやすくすることでユーザビリティを向上させるよう工夫しました。

![ezgif com-gif-maker (4)](https://user-images.githubusercontent.com/67876040/106563279-e81db100-656e-11eb-89ae-78e1d0a701ed.gif)
