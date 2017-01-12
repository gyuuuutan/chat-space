class Message < ApplicationRecord
  belongs_to :group_user
  has_many :users, through: :group_users
  has_many :chat_groups, through: :group_users
end
