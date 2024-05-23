
class Documentcategory < ApplicationRecord
    enum status: { active: "Active", inactive: "Inactive" }
  
    # belongs_to :documenttype, class_name: "Documenttype", foreign_key: "document_type"
  
    validates :document_name, presence: true
    validates :document_number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
  