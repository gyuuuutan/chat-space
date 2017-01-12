class ChatGroup < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  belongs_to :message
end
