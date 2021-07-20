# README

## Work

| Column     | Type  | Options  |
|------------|-------|----------|
|title       |string |null:false|
|image       |string |          |
|description |text   |          |
|youtube     |string |          |
|created_year|integer|          |
|artist_id   |integer|null:fales|
|type_id     |integer|null:false|

### Association
- belongs_to_active_hash :type
- belongs_to_active_hash :creater

## Administrators

| Column            | Type  | Options  |
|-------------------|-------|----------|
|email              |string |null:false|
|encrypted_password |string |null:false|

