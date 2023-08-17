# テーブル設計

## users テーブル

| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- | 
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true | 
| password           | string | null: false               | 
| encrypted_password | string | null: false               | 
| family_name        | string | null: false               | 
| first_name         | string | null: false               | 
| family_name_kana   | string | null: false               | 
| first_name_kana    | string | null: false               | 
| date_of_birth      | string | null: false               | 

### Association

- has_many :sell_item_ids
- has_many :buy_area_ids

## sell_item テーブル

| Column        | Type    | Options                   | 
| ------------- | ------- | ------------------------- | 
| sell_item_id  | integer | null: false, unique: true | 
| item_name     | string  | null: false               | 
| item_image    | text    | null: false               | 
| price         | integer |                           | 
| del_price     | boolean | null: false               | 
| item_comment  | text    | null: false               | 
| category_info | boolean | null: false               | 
| item_status   | boolean | null: false               | 
| sell_area     | boolean | null: false               | 

### Association

## buy_area テーブル

| Column            | Type    | Options                   | 
| ----------------- | ------- | ------------------------- | 
| buy_area_id       | integer | null: false, unique: true | 
| post_code         | integer | null: false               | 
| perfectue         | string  | null: false               | 
| city_town_village | string  | null: false               | 
| street_address    | string  | null: false               | 
| buling_name       | string  | null: false               | 
| phone             | integer | null: false               | 

### Association

## buy_item テーブル

| Column       | Type       | Options                        | 
| ------------ | ---------- | ------------------------------ | 
| sell_item_id | references | null: false, foreign_key: true | 
| buy_area_id  | references | null: false, foreign_key: true | 

### Association
