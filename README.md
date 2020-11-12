# テーブル設計 表の中身,

## users テーブル

| Column               | Type      | Options        |
| -------------------- | --------- | -------------- |
| nick_name            | string    | unique: true   |
| email                | string    | unique: true   |
| email                | string    | unique: true   |
| password             | string    | nunique: true  |
| first_name           | string    | null: false    |
| last_name            | text      | null: false    |
| first_name (kana)    | string    | null: false    |
| last_name (kana)     | string    | null: false    |
| birth_year           | date      | null: false    |
| birth_month          | date      | null: false    |
| birth_day            | date      | null: false    |

### Association

- has_many :items
- has_many :comments
  belongs to :addresses
  has_one :purceses


## items テーブル

| Column               | Type        | Options           |
| -------------------- | ----------- | ----------------- |
| name                 | string      | null: false       |
| image                |             | null: false       |
| price                | integer     | null: false       |
| concept              | text        | null: false       |
| category             | string      | null: false       |
| condition            | string      | null: false       |
| postage              | integer     | null: false       |
| region               | string      |                   |
| shipping             | date        | null: false       |
| user                 | references  | foreign_key: true |  

### Association

- has_many :users
- has_many :comments
  belongs_to :addresses
  has_many :purceses




### purceses テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |
| address     | references | foreign_key: true |

### Association
- belongs_to : users
- belongs_to : items
  belongs_to : addresses


### Addresses テーブル

| Column               | Type        | Options           |
| -------------------- | ---------   | ----------------- |
| user                 | references  | foreign_key: true |
| postal code          | integer     | null: false       |
| prefectur            | string      | null: false       |
| municipality         | string      | null: false       |
| house_number         | string      | null: false       |
| building_name        | string      | null: false       |
| phone_number         | integer     | null: false       |


### comments テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| comments    | text       | null: false       |
| item        | references | foreign_key: true |

### Association
- belongs_to : users
- belongs_to : items



