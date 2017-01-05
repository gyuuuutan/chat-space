== README

#データベース設計

###テーブル

####users
|column|type|constraint|
|:--:|:--:|:--:|
|name|string|null: false, index: true|
|e-mail|string|null: false, unique: true|
|password|string|null: false|

####groups
|column|type|constraint|
|:--:|:--:|:--:|
|name|string|null: false, index: true|

####messages
|column|type|constraint|
|:--:|:--:|:--:|
|body|text|null: false|
|image|string||
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

####users_groups
|column|type|constraint|
|:--:|:--:|:--:|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

###リレーション
users
has_many :users_groups

groups
has_many :users_groups

messages
belongs_to :users_groups

users_groups
belongs_to :users
belongs_to :groups
has_many :messages




<!--
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

 -->
Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

