== README

#データベース設計

###テーブル

####users
|column|type|option|
|:--:|:--:|:--:|
|name|string|null: false, index: true|
|e-mail|string|null: false, unique: true|
|password|string|null: false|

####groups
|column|type|option|
|:--:|:--:|:--:|
|name|string|null: false, index: true|

####messages
|column|type|option|
|:--:|:--:|:--:|
|body|text||
|image|string||
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

####group_users
|column|type|option|
|:--:|:--:|:--:|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

###アソシエーション
users
has_many :group_users
has_many :groups, though: :group_users

groups
has_many :group_users
has_many :users, though :group_users

messages
belongs_to :group_user
has_many :users, though: :group_users
has_many :groups, though: :group_users
