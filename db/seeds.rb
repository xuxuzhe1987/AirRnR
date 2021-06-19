# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Book.destroy_all

10.times do
  user = User.create!(
    name: Faker::Name.unique.name,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    we_chat: Faker::Alphanumeric.alphanumeric(number: 10),
    password: "123456"
    )
10.times do
  book = Book.create!(
    user: user,
    title: Faker::Book.title,
    author: Faker::Book.author,
    description: Faker::TvShows::TheFreshPrinceOfBelAir.quote,
    availability: true
    )
  end
end
