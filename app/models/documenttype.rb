class Documenttype < ApplicationRecord
    validates :document_type, presence: true
    validates :status, inclusion: { in: %w[Active Inactive] }
  end
  