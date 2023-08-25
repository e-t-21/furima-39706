class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :item_status
  belongs_to :del_price
  belongs_to :perfectue

  validates :item_name, :price, :message, :category_id, :item_status_id, :del_price_id, :perfectue_id, :del_day_id, presence: true

  validates :catecory_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :del_price_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :perfectue_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :del_day_id, numericality: { other_than: 1 , message: "can't be blank"}

end
