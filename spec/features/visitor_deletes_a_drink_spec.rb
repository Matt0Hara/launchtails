require 'rails_helper'

feature 'visitor deletes a drink', %Q{
  As a visitor
  I want to delete a drink
  So that I can remove it from the system
} do
  # Acceptance Criteria:
  # * When I opt to delete a drink, it is removed from the listing
  # * When the deletion is successful, I receive a confirmation message

  scenario 'delete a drink' do
    drink = FactoryGirl.create(:drink)

    visit '/drinks'
    click_link 'Delete'

    expect(page).to have_content('Drink deleted.')
    expect(page).to_not have_content(drink.title)
  end
end

