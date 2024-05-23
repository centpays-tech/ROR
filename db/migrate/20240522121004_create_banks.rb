class CreateBanks < ActiveRecord::Migration[7.1]
  def change
    create_table :banks do |t|
      t.string :bank_name
      t.string :div_id
      t.string :bank_url
      t.string :status

      t.timestamps
    end
  end
end
