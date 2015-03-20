class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :featured, null: false, default: false

      t.timestamps null: false
      t.index :title, unique: true
    end
  end
end
