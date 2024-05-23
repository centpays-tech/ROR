class Client < ApplicationRecord
    validates :company_name, :username, :email, :phone_number, :postal_code, :country, :state, :city, :street_address, :street_address2, :industries_id, :director_first_name, :director_last_name, :skype_id, :business_type, :business_category, :business_subcategory, :business_registered_on, :merchant_pay_in, :merchant_pay_out, :settlement_charge, :turnover, :expected_chargeback_percentage, :website_url, :merchant_id, presence: true
    validates :status, inclusion: { in: ["Active", "Inactive"] }
    validates :currency, presence: true
    validates :last_settled_date, presence: false
    
  end
  