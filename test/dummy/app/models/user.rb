class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :confirmable, :lockable, :omniauthable, omniauth_providers: %i[fake_provider]

  has_many :orders, dependent: :destroy
  has_many :user_addresses, dependent: :destroy

  accepts_nested_attributes_for :user_addresses, reject_if: :all_blank, allow_destroy: true

  validates :name, :email, presence: true
end
