# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# db/seeds.rb

# db/seeds.rb

require 'faker' # Ensure you've added gem 'faker' to your Gemfile and run bundle install

100.times do |i|
  days_back = rand(1..365)  # Random number of days up to a year back
  created_at = Time.zone.now - days_back.days

  Patient.create(
    name: Faker::Name.name,  # Each patient gets a completely unique name
    age: rand(18..100),  # More realistic random age between 18 and 100
    address: Faker::Address.street_address + ", " + Faker::Address.city + ", " + Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,  # Generates a realistic phone number
    email: Faker::Internet.unique.email,  # Ensures that each email is unique
    created_at: created_at,
    updated_at: created_at
  )
end
