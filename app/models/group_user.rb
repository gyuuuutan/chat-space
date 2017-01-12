class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :chat_group
  has_many :messages
end
