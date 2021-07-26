class UserAddress < ApplicationRecord
  belongs_to :user

  validates :fullname, :address_line1, :city, :state, :zip_code, :country, presence: true
end
