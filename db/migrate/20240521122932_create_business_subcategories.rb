class CreateBusinessSubcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :business_subcategories do |t|
      t.string :subcategory_name
      # t.references :category, null: false, foreign_key: true
      t.string :status, default: "Active"
      t.string :category_name
      t.timestamps
    end
  end
end
