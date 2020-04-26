class CreateLargeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :large_categories do |t|
      t.text :large_category_name

      t.timestamps
    end
  end
end
