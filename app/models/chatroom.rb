class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_many :messages, dependent: :destroy
end
