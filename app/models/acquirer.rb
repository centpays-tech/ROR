class Acquirer < ApplicationRecord
    validates :acquirer_name, presence: true, uniqueness: true
    validates :acquirer_email, presence: true, uniqueness: true
    validates :website_url, presence: true
    validates :city, presence: true
    
  end
  