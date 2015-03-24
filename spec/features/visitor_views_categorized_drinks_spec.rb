require 'rails_helper'

feature 'visitor views categorized drinks', %Q{
  As a visitor
  I want to view drinks for a given category
  So that I can make a drink that fits within that category
} do
  # Acceptance Criteria
  #
  # * I can navigate to a drink listing for a given category
  # * On the category listing, I should only see drinks that fall within that
  #   category
  # * For nonexistant categories, a drink listing should not exist
  #
  let(:category) { FactoryGirl.create(:category) }

  scenario 'drink in category is found on the category listing' do
    drink = FactoryGirl.create(:drink, category: category)

    visit '/categories/' + category.to_param + '/drinks'
    expect(page).to have_content(drink.title)
  end

  scenario 'drink not in category is not found on the category listing' do
    drink = FactoryGirl.create(:drink)

    visit '/categories/' + category.to_param + '/drinks'
    expect(page).to_not have_content(drink.title)
  end
end

