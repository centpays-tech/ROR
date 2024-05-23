class CreateCreatecurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :createcurrencies do |t|
      t.string :currency_name
      t.string :currency_code
      t.string :status

      t.timestamps
    end
  end
end
