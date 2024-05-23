class BusinessSubcategory < ApplicationRecord
  STATUS_OPTIONS = ["Active", "Inactive"].freeze

  validates :subcategory_name, presence: true
  validates :category_name, presence: true
  validates :status, inclusion: { in: STATUS_OPTIONS }
end
