class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  belongs_to :chat_group

  mount_uploader :image, ImageUploader
end
