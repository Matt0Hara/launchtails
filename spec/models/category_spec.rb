require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many :drinks }

  it { should have_valid(:name).when('Name', 'Name 2') }
  it { should_not have_valid(:name).when(nil, '') }

  context 'uniqueness' do
    it 'requires a unique name' do
      category = FactoryGirl.create(:category)
      dupe_category = FactoryGirl.build(:category, name: category.name)
      expect(dupe_category).to_not be_valid
      expect(dupe_category.errors[:name]).to_not be_empty
    end
  end
end
