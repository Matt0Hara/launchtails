class Drink < ActiveRecord::Base
  validates :title,
    presence: true,
    uniqueness: true,
    length: { minimum: 5 }

  class << self
    def featured
      where(featured: true)
    end
  end
end
