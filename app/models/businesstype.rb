class Businesstype < ApplicationRecord
    STATUS_OPTIONS = ["Active", "Inactive"].freeze
  
    validates :businesstype_name, presence: true
    validates :status, inclusion: { in: STATUS_OPTIONS }
  end
  