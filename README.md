# テーブル設計

## users テーブル 

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| name                  | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| search_number         | integer | null: false |

### Association

- has_many :schedules
- has_many :room_users
- has_many :messages
- has_many :rooms, through :room_users

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
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

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
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
