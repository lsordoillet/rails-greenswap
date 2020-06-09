class Listing < ApplicationRecord
  PLANT_CATEGORY = ["Seeds", "Cuttings", "Plants"]
  LISTING_TYPE = ["Swap", "Giveaway", "Sell"]
  CARE_LEVEL_CATEGORY = ["Easy", "Medium", "Difficult"]

  belongs_to :user
  has_many :chatrooms
  has_many :chatrooms, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  VALID_STREETNAME_REGEX = /\A[-a-z]+\z/
  validates :street_name, presence: true, format: { with: VALID_STREETNAME_REGEX }
  validates :postcode, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
  validates :plant_category, presence: true, inclusion: { in: PLANT_CATEGORY }
  validates :listing_type, presence: true, inclusion: { in: LISTING_TYPE }
  validates :care_level_category, presence: true, inclusion: { in: CARE_LEVEL_CATEGORY }

  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode

  def address
    [postcode, city, street_name].compact.join(', ')
  end
end
