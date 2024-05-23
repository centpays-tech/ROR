class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :mobile_no, presence: true
  validates :country, presence: true
  validates :role, presence: true
  validates :company_name, presence: true
  validates :password, confirmation: true

end