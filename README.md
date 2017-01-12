== README

#データベース設計

###テーブル

####users
|column|type|option|
|:--:|:--:|:--:|
|name|string|null: false, index: true|
|e-mail|string|null: false, unique: true|
|password|string|null: false|

####chat_groups
|column|type|option|
|:--:|:--:|:--:|
|name|string|null: false|

####messages
|column|type|option|
|:--:|:--:|:--:|
|body|text||
|image|string||
|chat_group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

####group_users
|column|type|option|
|:--:|:--:|:--:|
|user_id|integer|null: false, foreign_key: true|
|chat_group_id|integer|null: false, foreign_key: true|

###アソシエーション
users
has_many :group_users
has_many :chat_groups, through: :group_users
belongs_to :message

chat_groups
has_many :group_users
has_many :users, through: :group_users
belongs_to :message

messages
belongs_to :group_user
has_many :users, through: :group_users
has_many :chat_groups, through: :group_users

group_users
belongs_to :user
belongs_to :chat_group
has_many :messages
