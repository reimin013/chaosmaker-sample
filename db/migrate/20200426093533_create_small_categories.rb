class CreateSmallCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :small_categories do |t|
      t.text :small_category_name
      t.integer :large_category_id

      t.timestamps
    end
  end
end
