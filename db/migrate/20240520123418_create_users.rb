class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :mobile_no
      t.string :country
      t.string :role
      t.string :password_digest
      t.string :company_name

      t.timestamps
    end
  end
end
