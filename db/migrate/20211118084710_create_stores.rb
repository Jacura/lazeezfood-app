class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :recipe_name
      t.text :recipe_description
      t.float :recipe_calories
      t.float :recipe_price

      t.timestamps
    end
  end
end
