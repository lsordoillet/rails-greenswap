class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  # def avg_rating
  #   ratings = []
  #   reviews.each do |review|
  #     @listing.user.reviews
  #     ratings.push(review.rating)

  #   avg = sum(ratings) / len(ratings)
  # end
end
