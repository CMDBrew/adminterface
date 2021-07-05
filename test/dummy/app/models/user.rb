class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :user_addresses, dependent: :destroy

  validates :name, :email, presence: true
end
