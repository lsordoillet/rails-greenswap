class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
