class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find_by(id: @item.user_id)
  end

  def edit
    @item = Item.find(params[:id])
    return if current_user == @item.user

    redirect_to root_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :message, :category_id, :item_status_id, :del_price_id, :perfectue_id,
                                 :del_day_id, :image).merge(user_id: current_user.id)
  end
end
