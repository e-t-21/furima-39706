class User < ApplicationRecord
  validates :nickname, :date_of_birth, :family_name, :first_name, :family_name_kana, :first_name_kana, presence: true

  validate :family_name_format
  def family_name_format
    return if family_name.match?(/\A[\p{katakana}\u{30FC}\p{hiragana}\p{han}ー－]+\z/)

    errors.add :family_name, 'is invalid. Input full-width characters'
  end

  validate :first_name_format
  def first_name_format
    return if first_name.match?(/\A[\p{katakana}\u{30FC}\p{hiragana}\p{han}ー－]+\z/)

    errors.add :first_name, 'is invalid. Input full-width characters'
  end

  validate :family_name_katakana_format
  def family_name_katakana_format
    return if family_name_kana.match?(/\A[\p{katakana}\u{30FC}]+\z/)

    errors.add :family_name_kana, 'is invalid. Input full-width katakana characters'
  end

  validate :first_name_katakana_format
  def first_name_katakana_format
    return if first_name_kana.match?(/\A[\p{katakana}\u{30FC}]+\z/)

    errors.add :first_name_kana, 'is invalid. Input full-width katakana characters'
  end

  validate :password_complexity
  def password_complexity
    return unless password.present? && (!password.match(/^(?=.*[a-zA-Z])(?=.*[0-9])/) || password.include?("-"))

    errors.add :password, 'is invalid. Include both letters and numbers'
  end

  #has_many :items
  #has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
