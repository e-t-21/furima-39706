class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :message, :category_id, :item_status_id, :del_price_id, :perfectue_id, :del_day_id, :image).merge(user_id: current_user.id)
  end
end
