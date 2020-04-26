class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.text :company_name
      t.string :company_image_id
      t.integer :small_category_id

      t.timestamps
    end
  end
end
