# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  {
    name: "funny"
  },
  {
    name: "cartoon"
  }
].each do  |category|
  Category.create(category)
end



[
  {
  title: "Family Guy Season 1",
  description: "This is season one",
  small_cover_url: "family_guy.jpg",
  large_cover_url: "family_guy.jpg",
  category_id: 1
  },
{
  title: "Futurama",
  description: "This is season one",
  small_cover_url: "futurama.jpg",
  large_cover_url: "futurama.jpg",
  category_id: 2

  },
{
  title: "Monk",
  description: "This is season one",
  small_cover_url: "monk.jpg",
  large_cover_url: "monk_large.jpg",
  category_id: 1

  },
{
  title: "South Park",
  description: "This is season one",
  small_cover_url: "south_park.jpg",
  large_cover_url: "south_park.jpg",
  category_id: 2
  },
    {
  title: "Family Guy Season 1",
  description: "This is season one",
  small_cover_url: "family_guy.jpg",
  large_cover_url: "family_guy.jpg",
  category_id: 1
  },
{
  title: "Futurama",
  description: "This is season one",
  small_cover_url: "futurama.jpg",
  large_cover_url: "futurama.jpg",
  category_id: 2

  },
{
  title: "Monk",
  description: "This is season one",
  small_cover_url: "monk.jpg",
  large_cover_url: "monk_large.jpg",
  category_id: 1

  },
{
  title: "South Park",
  description: "This is season one",
  small_cover_url: "south_park.jpg",
  large_cover_url: "south_park.jpg",
  category_id: 2
  },
    {
  title: "Family Guy Season 1",
  description: "This is season one",
  small_cover_url: "family_guy.jpg",
  large_cover_url: "family_guy.jpg",
  category_id: 1
  },
{
  title: "Futurama",
  description: "This is season one",
  small_cover_url: "futurama.jpg",
  large_cover_url: "futurama.jpg",
  category_id: 2

  },
{
  title: "Monk",
  description: "This is season one",
  small_cover_url: "monk.jpg",
  large_cover_url: "monk_large.jpg",
  category_id: 1

  },
{
  title: "South Park",
  description: "This is season one",
  small_cover_url: "south_park.jpg",
  large_cover_url: "south_park.jpg",
  category_id: 2
  },
    {
  title: "Family Guy Season 1",
  description: "This is season one",
  small_cover_url: "family_guy.jpg",
  large_cover_url: "family_guy.jpg",
  category_id: 1
  },
{
  title: "Futurama",
  description: "This is season one",
  small_cover_url: "futurama.jpg",
  large_cover_url: "futurama.jpg",
  category_id: 2

  },
{
  title: "Monk",
  description: "This is season one",
  small_cover_url: "monk.jpg",
  large_cover_url: "monk_large.jpg",
  category_id: 1

  },
{
  title: "South Park",
  description: "This is season one",
  small_cover_url: "south_park.jpg",
  large_cover_url: "south_park.jpg",
  category_id: 2
  },
    {
  title: "Family Guy Season 1",
  description: "This is season one",
  small_cover_url: "family_guy.jpg",
  large_cover_url: "family_guy.jpg",
  category_id: 1
  },
{
  title: "Futurama",
  description: "This is season one",
  small_cover_url: "futurama.jpg",
  large_cover_url: "futurama.jpg",
  category_id: 2

  },
{
  title: "Monk",
  description: "This is season one",
  small_cover_url: "monk.jpg",
  large_cover_url: "monk_large.jpg",
  category_id: 1

  },
{
  title: "South Park",
  description: "This is season one",
  small_cover_url: "south_park.jpg",
  large_cover_url: "south_park.jpg",
  category_id: 2
  }
].each do |movie|
  Video.create(movie)
end

user2 = User.create(full_name: "User 2", password: "password", email: "user2@example.com")
user3 = User.create(full_name: "User 3", password: "password", email: "user3@example.com")
user4 = User.create(full_name: "User 4", password: "password", email: "user4@example.com")
user5 = User.create(full_name: "User 5", password: "password", email: "user5@example.com")
user6 = User.create(full_name: "User 6", password: "password", email: "user6@example.com")
 