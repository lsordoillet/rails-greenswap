# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Destroying listings"
Listing.destroy_all if Rails.env.development?
puts "Destroying users"
User.destroy_all if Rails.env.development?
puts "maybe done (check if there are any errors)"
puts "Creating users"

user1 = User.create!(
  email: "plantlover@garden.com",
  password: "123456"
  )

user2 = User.create!(
  email: "greensoul@jungle.com",
  password: "123456"
  )
puts "maybe done (check if there are any errors)"
puts "Creating listings"

listing1 = Listing.new(
  title: "Cactus plants",
  description: "I am sharing my wonderful cactus garden. There are many different types and around 30 plants. Some are leafy and spiny, treelike, shrubby, and often scrambling. Many species may be treelike or shrubby, 2–7 m high, but occasionally at 10 m.",
  plant_category: "Plants",
  care_level_category: "Easy",
  postcode: "10961",
  city: "Berlin",
  listing_type: "Giveaway",
  active: true,
  quantity: 4,
  )
file1 = URI.open('https://unsplash.com/photos/KuLu5kj2k4o/download?force=true&w=1920')
listing1.photos.attach(io: file1, filename: 'Cactus1.jpg', content_type: 'image/jpg')
file2 = URI.open('https://unsplash.com/photos/EJWrW-nlyyI/download?force=true&w=1920')
listing1.photos.attach(io: file2, filename: 'Cactus2.jpg', content_type: 'image/jpg')
file3 = URI.open('https://unsplash.com/photos/fmJx-xuxHtA/download?force=true&w=1920')
listing1.photos.attach(io: file3, filename: 'Cactus3.jpg', content_type: 'image/jpg')
listing1.user = user1
listing1.save!

listing2 = Listing.new(
  title: "Lovely Philodendron",
  description: "My favorite philodenrdon in the world, it even has a name: Precious. I have known Precious for 20 years and we have changed 3 cities together. Warning! If you rent it once, you will want to keep it forever.",
  plant_category: "Seeds",
  care_level_category: "Medium",
  postcode: "10961",
  city: "Berlin",
  listing_type: "Giveaway",
  active: true,
  quantity: 2,
  )
file4 = URI.open('https://unsplash.com/photos/gMB96cODP-U/download?force=true&w=1920')
listing2.photos.attach(io: file4, filename: 'Philodendron1.jpg', content_type: 'image/jpg')
file5 = URI.open('https://unsplash.com/photos/HtRfBkprwRk/download?force=true&w=1920')
listing2.photos.attach(io: file5, filename: 'Philodendron2.jpg', content_type: 'image/jpg')
file6 = URI.open('https://unsplash.com/photos/eb3HOB8l-x8/download?force=true&w=1920')
listing2.photos.attach(io: file6, filename: 'Philodendron3.jpg', content_type: 'image/jpg')
listing2.user = user1
listing2.save!

listing3 = Listing.new(
  title: "Sanctuary plant",
  description: "Just like the name suggests, this sanctuary plant makes you feel right at home. Optimal Growing Conditions:  Sun Exposure: Full Sun. Soil Type: Normal or Sandy. Soil pH: Neutral or Alkaline or Acid. Soil Moisture: Dry. Care Level: Easy",
  plant_category: "Cuttings",
  care_level_category: "Difficult",
  postcode: "10997",
  city: "Berlin",
  listing_type: "Swap",
  active: true,
  )
ffile1 = URI.open('https://unsplash.com/photos/dIZiA7dkRjc/download?force=true&w=1920')
listing3.photos.attach(io: ffile1, filename: 'monstera1.jpg', content_type: 'image/jpg')
ffile2 = URI.open('https://unsplash.com/photos/B2JUvo192ys/download?force=true&w=1920')
listing3.photos.attach(io: ffile2, filename: 'monstera2.jpg', content_type: 'image/jpg')
listing3.user = user2
listing3.save!

listing4 = Listing.new(
  title: "Happy plants",
  description: "Planted in 6” pot. 4 leaves (1 leaf is broken)  Water & Humidity – This houseplant requires low to medium amounts of water. Let the soil dry out in between watering. If you live in a hot area, water about once every 2 to 3 days; if you live in a rainy area, then water as necessary. Most importantly, the anthurium requires proper drainage",
  plant_category: "Plants",
  care_level_category: "Medium",
  listing_type: "Sell",
  active: true,
  postcode: "10997",
  city: "Berlin",
  price: 10,
  )
ffile4 = URI.open('https://unsplash.com/photos/8mqOw4DBBSg/download?force=true&w=1920')
listing4.photos.attach(io: ffile4, filename: 'happy1.jpg', content_type: 'image/jpg')
ffile5 = URI.open('https://unsplash.com/photos/_mgfuATaQnk/download?force=true&w=1920')
listing4.photos.attach(io: ffile5, filename: 'happy2.jpg', content_type: 'image/jpg')
ffile6 = URI.open('https://unsplash.com/photos/5sF6NrB1MEg/download?force=true&w=1920')
listing4.photos.attach(io: ffile6, filename: 'jungle1.jpg', content_type: 'image/jpg')
ffile7 = URI.open('https://unsplash.com/photos/OOE4xAnBhKo/download?force=true&w=1920')
listing4.photos.attach(io: ffile7, filename: 'jungle2.jpg', content_type: 'image/jpg')
ffile8 = URI.open('https://unsplash.com/photos/MvA86_qwpEI/download?force=true&w=1920')
listing4.photos.attach(io: ffile8, filename: 'jungle3.jpg', content_type: 'image/jpg')
listing4.user = user2
listing4.save!
