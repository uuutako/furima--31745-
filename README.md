# テーブル設計 表の中身,

## users テーブル

| Column               | Type      | Options        |
| -------------------- | --------- | -------------- |
| nick_name            | string    | unique: true   |
| email                | string    | unique: true   |
| encrypted_password   | string    | unique: true   |
| first_name           | string    | null: false    |
| last_name            | string    | null: false    |
| first_name_kana      | string    | null: false    |
| last_name_kana       | string    | null: false    |
| birthday             | date      | null: false    |

### Association

- has_many    :items
- has_many    :comments
  has_many    :purchases


## items テーブル

| Column               | Type        | Options           |
| -------------------- | ----------- | ----------------- |
| name                 | string      | null: false       |
| price                | integer     | null: false       |
| concept              | text        | null: false       |
| category_id          | integer     | null: false       |
| condition_id         | integer     | null: false       |
| postage_id           | integer     | null: false       |
| region_id            | integer     | null: false       |
| shipping_id          | integer     | null: false       |
| user                 | references  | foreign_key: true |  


### Association

- belongs_to    :user
- has_many      :comments
  has_one       :purchase

### purchases テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
  has_one    : address


### Addresses テーブル

| Column               | Type        | Options           |
| -------------------- | ---------   | ----------------- |
| purchase             | references  | foreign_key: true |
| postal_code          | string      | null: false       |
| region_id            | integer     | null: false       |
| city                 | string      | null: false       |
| house_number         | string      | null: false       |
| building_name        | string      |                   |
| phone_number         | string      | null: false       |

### Association
- belongs_to : purchase



