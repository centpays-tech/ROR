# app/models/bank.rb
class Bank < ApplicationRecord
    enum status: { active: "Active", inactive: "Inactive" }
    validates :bank_name, :div_id, :bank_url, presence: true
  end
  