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
- has_many :orders

## items テーブル

| Column         | Type       | Options                        | 
| -------------- | ---------- | ------------------------------ | 
| item_name      | string     | null: false                    | 
| price          | integer    | null: false                    | 
| message        | text       | null: false                    | 
| category_id    | integer    | null: false                    |
| item_status_id | integer    | null: false                    | 
| del_price_id   | integer    | null: false                    |
| perfectue_id   | integer    | null: false                    |  
| del_day_id     | integer    | null: false                    |  
| user           | references | null: false, foreign_key: true |  

### Association

- has_one :order
- belongs_to :user

## addresses テーブル

| Column            | Type       | Options                        | 
| ----------------- | ---------- | ------------------------------ | 
| post_code         | string     | null: false                    | 
| perfectue         | string     | null: false                    | 
| city_town_village | string     | null: false                    | 
| street_address    | string     | null: false                    | 
| building_name     | string     |                                | 
| phone             | string     | null: false                    | 
| order             | references | null: false, foreign_key: true | 

### Association

- belongs_to :order

## orders テーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| user    | references | null: false, foreign_key: true | 
| item    | references | null: false, foreign_key: true | 

### Association

- has_one :address
- belongs_to :user
- belongs_to :item
