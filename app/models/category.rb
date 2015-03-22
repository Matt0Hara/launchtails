class Category < ActiveRecord::Base
  has_many :drinks,
    dependent: :nullify

  validates :name,
    presence: true,
    uniqueness: true
end
