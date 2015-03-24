# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  'Martini',
  'Shooters',
  'Tropical',
  'Fortified Wines'
].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

if Rails.env.development?
  #featured drinks
  {
    'Pumpkin Martian Martini' => 'Martini',
    'Old Fashioned Astronaut' => 'Shooters',
    'Spacewalk Spritzer' => 'Fortified Wines'
  }.each do |drink_title, category_title|
    drink = Drink.find_or_create_by!(title: drink_title) do |d|
      d.featured = true
    end

    drink.category = Category.find_by(name: category_title)
    drink.save!
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
