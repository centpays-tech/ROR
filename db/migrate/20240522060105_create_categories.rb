class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category_name, unique: true, null: false
      t.string :short_name
      t.string :status, default: 'Active', null: false

      t.timestamps
    end

    add_index :categories, :category_name, unique: true
  end
end
