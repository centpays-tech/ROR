class CreateBusinesstypes < ActiveRecord::Migration[6.0]
  def change
    create_table :businesstypes do |t|
      t.string :businesstype_name
      t.string :status, default: "Active"

      t.timestamps
    end
  end
end
