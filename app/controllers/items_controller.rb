class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      @items = Item.includes(:user)
      render 'items/new', status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :message, :category_id, :item_status_id, :del_price_id, :perfectue_id, :del_day_id, :image).merge(user_id: current_user.id)
  end
end
