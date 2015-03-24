class AdditionalDrinkData < ActiveRecord::Migration
  def change
    add_column :drinks, :category_id, :integer
    add_column :drinks, :alcohol_level, :string
  end
end
