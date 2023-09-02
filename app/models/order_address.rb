class OrderAddress
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :user_id, :item_id, :post_code, :perfectue_id, :city_town_village, :street_address, :building_name, :phone,
                :order_id

  with_options presence: true do
    validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :perfectue_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :user_id
    validates :item_id
  end
  validates :city_town_village, :street_address, presence: true
  validates :phone, presence: { message: "number can't be blank" }
  validates :phone, length: { minimum: 10, message: 'number is too short' }
  validates :phone, format: { with: /\A\d+\z/, message: 'number is invalid. Input only number' }

  def save
    order = Order.create(user_id:, item_id:)
    address = Address.create(post_code:, perfectue_id:, city_town_village:,
                             street_address:, building_name:, phone:, order_id: order.id)
  end

  validates :token, presence: true

  private

  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :post_code, :perfectue_id, :city_town_village, :street_address,
                                          :building_name, :phone, :order_id).merge(user_id: current_user.id)
  end
end