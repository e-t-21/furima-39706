# テーブル設計

## users テーブル

| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- | 
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               | 
| family_name        | string | null: false               | 
| first_name         | string | null: false               | 
| family_name_kana   | string | null: false               | 
| first_name_kana    | string | null: false               | 
| date_of_birth      | date   | null: false               | 

### Association

- has_many :items

## items テーブル

| Column        | Type    | Options                   | 
| ------------- | ------- | ------------------------- | 
| item_name     | string  | null: false               | 
| price         | integer | null: false               | 
| del_price     | boolean | null: false               | 
| item_comment  | text    | null: false               | 
| category_info | integer | null: false               |
| item_status   | boolean | null: false               | 
| sell_area     | boolean | null: false               | 

### Association

- belongs_to :user
- has_one :order

## addresses テーブル

| Column            | Type    | Options                   | 
| ----------------- | ------- | ------------------------- | 
| post_code         | integer | null: false               | 
| perfectue         | string  | null: false               | 
| city_town_village | string  | null: false               | 
| street_address    | string  | null: false               | 
| building_name     | string  |                           | 
| phone             | string  | null: false               | 

### Association

- has_one :order

## orders テーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| item    | references | null: false, foreign_key: true | 
| address | references | null: false, foreign_key: true | 

### Association

- belongs_to :item
- belongs_to :address