class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
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
      @item = Item.find(params[:item_id])#ひとまとめにすること
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: 422
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :perfectue_id, :city_town_village, :street_address, :building_name, :phone, :order_id).merge(user_id: current_user.id)
    #params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])の記述を参考にする↑item_id
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],#@itemを使う
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
