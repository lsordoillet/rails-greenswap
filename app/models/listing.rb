class Listing < ApplicationRecord
  PLANT_CATEGORY = ["Seeds", "Cuttings", "Plants"]
  LISTING_TYPE = ["Swap", "Giveaway", "Sell"]
  CARE_LEVEL_CATEGORY = ["Easy", "Medium", "Difficult"]

  belongs_to :user
  validates :title, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :active, presence: true
  validates :quantity, presence: true
  validates :plant_category, presence: true, inclusion: { in: PLANT_CATEGORY }
  validates :listing_type, presence: true, inclusion: { in: LISTING_TYPE }
  validates :care_level_category, presence: true, inclusion: { in: CARE_LEVEL_CATEGORY }

  has_many_attached :photos
end
