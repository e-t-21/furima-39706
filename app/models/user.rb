class User < ApplicationRecord
  validates :nickname, :encrypted_password, :family_name, :first_name, :family_name_kana, :first_name_kana, :date_of_birth, presence: true
  has_many :items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
