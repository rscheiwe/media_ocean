# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
end

# 10.times do
#   Movie.create(
#     title: Faker::Seinfeld.quote,
#     release_date: Faker::Date.backward(2000),
#     genres: "10, 11, 12",
#     poster_path: "http://fillmurray.com/g/300/300",
#     overview: Faker::Movie.quote,
#     apinum:
#   )
# end
