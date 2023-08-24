class User < ApplicationRecord
  validates :nickname, :email , :date_of_birth,:family_name, :first_name, :family_name_kana, :first_name_kana, presence: true

  validate :family_name_format
  def family_name_format
    unless family_name.match?(/\A[\p{katakana}\u{30FC}\p{hiragana}\p{han}ー－]+\z/)
      errors.add :family_name, "is invalid. Input full-width characters"
    end
  end
  
  validate :first_name_format
  def first_name_format
    unless first_name.match?(/\A[\p{katakana}\u{30FC}\p{hiragana}\p{han}ー－]+\z/)
      errors.add :first_name, "is invalid. Input full-width characters"
    end
  end

  validate :family_name_katakana_format
  def family_name_katakana_format
    unless family_name_kana.match?(/\A[\p{katakana}\u{30FC}]+\z/)
      errors.add :family_name_kana, "is invalid. Input full-width katakana characters"
    end
  end
  
  validate :first_name_katakana_format
  def first_name_katakana_format
    unless first_name_kana.match?(/\A[\p{katakana}\u{30FC}]+\z/)
      errors.add :first_name_kana, "is invalid. Input full-width katakana characters"
    end
  end

  validate :password_complexity
    def password_complexity
      if password.present? && !password.match(/^(?=.*[a-zA-Z])(?=.*[0-9])/)
        errors.add :password, "is invalid. Include both letters and numbers"
      end
    end

  has_many :items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
