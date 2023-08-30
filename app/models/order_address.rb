class OrderAddress
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :user_id, :item_id, :post_code, :perfectue_id, :city_town_village, :street_address, :building_name, :phone, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :order_id

    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :perfectue_id, numericality: { other_than: 1, message: "can't be blank" }
  end
  validates :city_town_village, :street_address, :phone, presence: true

  def phone_format
    return if phone.match?(/\A\d{10,11}\z/)


    errors.add :phone, 'is invalid. Input only number'
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(post_code: post_code, perfectue_id: perfectue_id, city_town_village: city_town_village, street_address: street_address, building_name: building_name, phone: phone, order_id: order.id)
  end

  validates :token, presence: true

  private

  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :post_code, :perfectue_id, :city_town_village, :street_address, :building_name, :phone, :order_id).merge(user_id: current_user.id)
  end

end