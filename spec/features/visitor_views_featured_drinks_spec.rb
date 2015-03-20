require 'rails_helper'

feature 'view featured drinks', %Q{
  As a visitor
  I want to view featured drinks
  So that I can see the best drinks
} do
  # Acceptance Criteria
  # * When I visit the featured drinks listing,
  #   I only see drinks that are designated as "featured"

  scenario 'visitor views featured drinks' do
    drink = FactoryGirl.create(:drink, :featured)

    visit '/featured-drinks'
    expect(page).to have_content(drink.title)
  end

  scenario 'visitor does not see nonfeatured drinks' do
    drink = FactoryGirl.create(:drink)
    visit '/featured-drinks'
    expect(page).to_not have_content(drink.title)
  end

  scenario 'visitor sees featured drinks at the root' do
    featured_drink = FactoryGirl.create(:drink, :featured)
    nonfeatured_drink = FactoryGirl.create(:drink)

    visit '/'
    expect(page).to have_content(featured_drink.title)
    expect(page).to_not have_content(nonfeatured_drink.title)
  end
end
