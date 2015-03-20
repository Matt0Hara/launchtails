require 'rails_helper'

RSpec.describe Drink, type: :model do
  it { should have_valid(:title).when('White Russian', 'Bourbon Neat') }
  it { should_not have_valid(:title).when('shrt', '', nil) }

  context 'uniqueness' do
    let!(:drink) { FactoryGirl.create(:drink) }

    it 'requires a unique name' do
      dupe_drink = Drink.new
      dupe_drink.attributes = drink.attributes
      expect(dupe_drink).to_not be_valid
      expect(dupe_drink.errors[:title]).to_not be_empty
    end
  end

  context 'featured' do
    it 'includes a featured drink' do
      drink = FactoryGirl.create(:drink, :featured)
      expect(Drink.featured).to include(drink)
    end

    it 'discludes a nonfeatured drink' do
      drink = FactoryGirl.create(:drink)
      expect(Drink.featured).to_not include(drink)
    end
  end
end
