class Drink < ActiveRecord::Base
  ALCOHOL_LEVELS = [
    "Low",
    "Medium",
    "High"
  ]

  belongs_to :category

  validates :title,
    presence: true,
    uniqueness: true,
    length: { minimum: 5 }

  validates :alcohol_level,
    inclusion: { in: ALCOHOL_LEVELS, allow_blank: true }

  class << self
    def featured
      where(featured: true)
    end
  end
end
