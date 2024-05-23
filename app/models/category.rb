class Category < ApplicationRecord
    validates :category_name, presence: true, uniqueness: true
    validates :status, inclusion: { in: %w(Active Inactive) }
  
    enum status: { Active: 'Active', Inactive: 'Inactive' }
  end
  