require 'rails_helper'

describe 'Admin updates drink', %Q{
  As an admin
  I want to update drinks
  So that I can moderate bad language
} do
  # Acceptance Criteria
  #
  # * If I update a drink without making the drink invalid,
  #   the system should reflect any changes I made to the drink
  # * If I render the drink invalid, the system should tell me so,
  #   and give me an opportunity to correct my mistake

  let(:drink) { FactoryGirl.create(:drink) }

  scenario 'update with valid information' do
    new_drink_title = 'A new, improved title'

    visit '/admin/drinks/' + drink.to_param + '/edit'
    fill_in 'Title', with: new_drink_title
    fill_in 'Description', with: 'A new, improved description'

    click_button 'Update Drink'

    expect(page).to have_content('Drink updated.')
    expect(page).to have_content(new_drink_title)
  end

  scenario 'update with invalid information' do
    visit '/admin/drinks' + drink.to_param + '/edit'
    fill_in 'Title', with: ''

    click_button 'Update Drink'
    expect(page).to have_content("can't be blank")
  end
end
