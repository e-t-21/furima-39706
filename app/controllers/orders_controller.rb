class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if Order.exists?(item_id: @item.id) || current_user == @item.user
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order = Order.new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: 422
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :perfectue_id, :city_town_village, :street_address, :building_name, :phone, :order_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end