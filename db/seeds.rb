# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  #featured drinks
  [
    'Pumpkin Martian Martini',
    'Old Fashioned Astronaut',
    'Spacewalk Spritzer'
  ].each do |drink_title|
    Drink.find_or_create_by!(title: drink_title) do |drink|
      drink.featured = true
    end
  end

  #nonfeatured drinks
  [
    'Solar Mimosa',
    'Red Planet Whiskey Sour',
    'Olympus Mons Manhattan'
  ].each do |drink_title|
    Drink.find_or_create_by!(title: drink_title)
  end
end
