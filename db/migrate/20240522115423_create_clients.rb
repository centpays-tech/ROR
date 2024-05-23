class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :username
      t.string :email
      t.integer :phone_number
      t.integer :postal_code
      t.string :country
      t.string :state
      t.string :city
      t.string :street_address
      t.string :street_address2
      t.string :industries_id
      t.string :director_first_name
      t.string :director_last_name
      t.string :skype_id
      t.string :business_type
      t.string :business_category
      t.string :business_subcategory
      t.string :business_registered_on
      t.string :merchant_pay_in
      t.string :merchant_pay_out
      t.decimal :settlement_charge
      t.string :turnover
      t.decimal :expected_chargeback_percentage
      t.string :website_url
      t.string :merchant_id
      t.string :status
      t.string :last_settled_date
      t.string :currency
      t.integer :client_id

      t.timestamps
    end
  end
end
