class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:index, :show]
  before_action :set_item_all_order, only: [:index, :show]

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
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: @item.user_id)
  end

  def edit
    if current_user != @item.user
      redirect_to root_path
    elsif Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy if current_user == @item.user
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :message, :category_id, :item_status_id, :del_price_id, :perfectue_id,
                                 :del_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_order
    @orders = Order.all
  end

  def set_item_all_order
    @items = Item.all.order('created_at DESC')
  end
end
