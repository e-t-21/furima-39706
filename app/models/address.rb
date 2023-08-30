class Address < ApplicationRecord

  belongs_to :order

  # validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  # validates :perfectue_id, numericality: { other_than: 1, message: "can't be blank" }
  # validates :city_town_village, :street_address, :phone, presence: true

  # def phone_format
  #   return if phone.match?(^/\A\d{10,11}\z/$) || phone.include?('-'))

  #   errors.add :phone, 'is invalid. Input only number'
  # end
end
