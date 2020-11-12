# テーブル設計 表の中身,

## users テーブル

| Column               | Type      | Options        |
| -------------------- | --------- | -------------- |
| nick_name            | string    | unique: true   |
| email                | string    | unique: true   |
| password             | string    | unique: true   |
| first_name           | string    | null: false    |
| last_name            | string    | null: false    |
| first_name (kana)    | string    | null: false    |
| last_name (kana)     | string    | null: false    |
| birthday             | date      | null: false    |

### Association

- has_many    :items
- has_many    :comments
  belongs to  :addresses
  has_many    :purchases


## items テーブル

| Column               | Type        | Options           |
| -------------------- | ----------- | ----------------- |
| price                | integer     | null: false       |
| concept              | text        | null: false       |
| category             | integer     | null: false       |
| condition            | integer     | null: false       |
| postage              | integer     | null: false       |
| region               | integer     | null: false       |
| shipping             | integer     | null: false       |
| user                 | references  | foreign_key: true |  

### Association

- belongs_to    :users
- has_many      :comments
  belongs_to    :addresses
  has_one       :purchases




### purchases テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
  has_one    : addresses


### Addresses テーブル

| Column               | Type        | Options           |
| -------------------- | ---------   | ----------------- |
| user                 | references  | foreign_key: true |
| postal code          | integer     | null: false       |
| prefecture           | string      | null: false       |
| municipality         | string      | null: false       |
| house_number         | string      | null: false       |
| building_name        | string      | null: false       |
| phone_number         | integer     | null: false       |

### Association
- belongs_to : user
- belongs_to : purchases



### comments テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| comments    | text       | null: false       |
| item        | references | foreign_key: true |

### Association
- belongs_to : users
- belongs_to : items



