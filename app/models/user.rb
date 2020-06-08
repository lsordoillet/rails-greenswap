class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings

  has_many :chatrooms
  has_many :messages#, through: :chatrooms

  has_one_attached :avatar

  

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :username, presence: true, length: { maximum: 20 },
                                    format: { with: VALID_USERNAME_REGEX },
                                    uniqueness: { case_sensitive: false }
  
  validates :description, length: { maximum: 300,
  too_long: "%{count} characters is the maximum allowed" }
end
