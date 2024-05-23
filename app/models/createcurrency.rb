
class Createcurrency < ApplicationRecord
    enum status: { active: "Active", inactive: "Inactive" }
    validates :currency_name, :currency_code, presence: true
  end
  