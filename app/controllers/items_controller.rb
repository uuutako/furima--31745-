class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit] 
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_purchase, only: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

end

  private

  def item_params
    params.require(:item).permit(:name, :concept, :category_id, :condition_id, :shipping_id, :region_id, :postage_id, :image, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless @item.user == current_user
    redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_purchase
    @purchase = Purchase.all
  end