require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :drink do
    sequence(:title) { |n| "Drink #{n}" }
    description "Tasty"

    trait :featured do
      featured true
    end
  end

  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end
end
