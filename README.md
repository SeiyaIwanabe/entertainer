# 概要

ダンスや歌、楽器演奏、演技などのスキルを持つ人と企業を結ぶマッチングプラットフォームサービスです。  
プロではないが自分のスキルを活かせる環境を求めている人と広告やイベントを企画している企業をマッチングさせます。  
僕自身、大学でダンスを始めましたが、自分たちの活躍の場がほしいと悩んでいる人が大勢いました。  
この課題を解決できないかと考え、アプリケーション制作に取り組みました。

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# Entertainer

制作期間: 2020 年 11 月 25 日-12 月 20 日  
本番環境: -----------------------

Basic 認証

- NAME: -----------------
- PASS: -----------------

イベント主催者用アカウント

- EMAIL: --------------
- PASS: --------------

イベント参加者用アカウント

- EMAIL: --------------
- PASS: --------------

## アプリ説明

### サインアップ/ログイン

![Animated GIF-downsized](https://user-images.githubusercontent.com/67876040/91416508-6ec8b680-e88a-11ea-8e60-240a65024e2b.gif)  
新規登録はウィザード形式で、ユーザー情報、住所（お届け先）の順に登録いたします。  
ログインは email と password の２つの情報が必要になります。

### イベントの主催

![Animated GIF-downsized (1)](https://user-images.githubusercontent.com/67876040/91433267-02f04900-e89e-11ea-83a2-c9bfa8d4d680.gif)  
ヘッダーからイベント作成します。

### クレジットカードの登録・削除

![Animated GIF-downsized (4)](https://user-images.githubusercontent.com/67876040/91529417-3a193580-e944-11ea-91c9-700b8e5b6936.gif)  
クレジットカードの登録は上記の値を入力していただくと登録できます。  
カード情報がある時はカードの詳細情報を閲覧できます。

### イベントへの参加

![Animated GIF-downsized (2)](https://user-images.githubusercontent.com/67876040/91433583-75612900-e89e-11ea-8a30-72c135d5a02c.gif)

### ログアウト実行のお願い

![Animated GIF-downsized (3)](https://user-images.githubusercontent.com/67876040/91433799-c7a24a00-e89e-11ea-90ff-df5a06d32d1f.gif)  
最後に、必ずログアウトいただきますようお願い申し上げます。ログアウトはヘッダーもしくはマイページのサイドバーにございます。

## ER 図

![スクリーンショット 2020-08-27 16 47 25](https://user-images.githubusercontent.com/67876040/91431484-6462e880-e89b-11ea-96d8-ee21b10585fd.png)

## users テーブル

| Column       | Type   | Options                                |
| ------------ | ------ | -------------------------------------- |
| nickname     | string | null: false                            |
| email        | string | null: false, unique: true, index: true |
| icon         | string |                                        |
| introduction | text   |                                        |
| genre        | string |                                        |

### Association

- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :deals, dependent: :destroy
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"

- has_one :profile, dependent: :destroy

## events テーブル

| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| event_name   | string   | null: false |
| reward       | integer  | null: false |
| datetime     | datetime | null: false |
| place        | string   | null: false |
| detail       | text     | null: false |
| recruiter_id | integer  | null: false |
| applicant_id | integer  | integer     | null:false |

### Association

- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :tagMap
- has_one :event_images, dependent: :destroy
- belongs_to :recruiter, class_name: "User"
- belongs_to :applicant, class_name: "User"

## event_images テーブル

| Column   | Type   | Options                       |
| -------- | ------ | ----------------------------- |
| event_id | string | references, foreign_key: true |
| image    | string | null: false                   |

### Association

- belongs_to :event

## tagmap テーブル

| Column   | Type   | Options                                    |
| -------- | ------ | ------------------------------------------ |
| event_id | string | references, null: false, foreign_key: true |
| tag_id   | string | references, null: false, foreign_key: true |

### Association

- belongs_to :event
- belongs_to :tag

## tag テーブル

| Column   | Type   | Options      |
| -------- | ------ | ------------ |
| tag_name | string | null: false, |

### Association

- has_many :tagmap

## comments テーブル(中間テーブル)

| Column     | Type      | Options                                    |
| ---------- | --------- | ------------------------------------------ |
| user_id    | string    | references, null: false, foreign_key: true |
| event_id   | string    | references, null: false, foreign_key: true |
| comment    | text      | null: false                                |
| created_at | timestamp | null: false                                |

### Association

- belongs_to :user
- belongs_to :event

## favorites テーブル

| Column   | Type   | Options                                    |
| -------- | ------ | ------------------------------------------ |
| user_id  | string | references, null: false, foreign_key: true |
| event_id | string | references, null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :event

## deals テーブル

| Column  | Type   | Options                                    |
| ------- | ------ | ------------------------------------------ |
| user_id | string | references, null: false, foreign_key: true |
| room_id | string | references, null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## rooms テーブル

| Column | Type | Options |
| ------ | ---- | ------- |


### Association

- has_many :deals
- has_many :messages

## messages テーブル

| Column  | Type   | Options                                    |
| ------- | ------ | ------------------------------------------ |
| message | text   | null: false                                |
| user_id | string | references, null: false, foreign_key: true |
| room_id | string | references, null: false, foreign_key: true |
