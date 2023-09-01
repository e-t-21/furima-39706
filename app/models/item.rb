class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :del_price
  belongs_to :perfectue
  belongs_to :del_day

  validates :item_name, presence: true
  validates :message, presence: true
  validates :image, presence: { unless: :was_attached?, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :del_price_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :perfectue_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :del_day_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :check_price_range

  private

  def was_attached?
    image.attached?
  end

  def check_price_range
    return unless price.present? && (price < 300 || price > 9_999_999)

    errors.add(:price, 'is out of setting range')
  end
end
