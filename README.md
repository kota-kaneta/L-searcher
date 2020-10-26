# アプリケーション名：L-searcher

# アプリケーション概要
フォローしているユーザーの登録したスケジュールをタイムラインで確認できます。
### 主な機能
・ユーザー登録機能
・スケジュール登録機能
・ユーザー検索機能（ユーザーID）
・フォロー機能
・タイムライン表示機能
・DM（ダイレクトメッセージ）機能
・通知機能







# テーブル設計

## users テーブル 

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| name                  | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| search_number         | integer | null: false |

### Association

- has_one :schedule
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
- has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

## schedules テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| from_time_sun    | integer |             |
| from_time_mon    | integer |             |
| from_time_tue    | integer |             |
| from_time_wed    | integer |             |
| from_time_thu    | integer |             |
| from_time_fri    | integer |             |
| from_time_sat    | integer |             |
| to_time_sun      | integer |             |
| to_time_mon      | integer |             |
| to_time_tue      | integer |             |
| to_time_wed      | integer |             |
| to_time_thu      | integer |             |
| to_time_fri      | integer |             |
| to_time_sat      | integer |             |
| location         | string  |             |

### Association

- belongs_to :user

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string |             |

### Association

- has_many :entries, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :notifications, dependent: :destroy

## entries テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- has_many :notifications, dependent: :destroy

## follows テーブル

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| followable | reference | polymorphic: true, null: false |
| blocked    | boolean   | default: false, null: false    |

## notifications テーブル

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| visitor    | integer   | null: false                    |
| visited    | integer   | null: false                    |
| message    | integer   | null: false                    |
| room       | integer   | null: false                    |
| action     | string    | default: '', null: false       |
| checked    | boolean   | default: false, null: false    |

### Association

- belongs_to :message, optional: true
- belongs_to :room, optional: true
- belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
- belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
