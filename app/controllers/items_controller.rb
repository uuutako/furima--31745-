class ItemsController < ApplicationController

  def index 
    @item = Item.order("created_at DESC")
    @items = Item.all
    @items = @item.includes(:user)
  end

  
  def new
    @item = Item.new
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
end

 private
  def item_params
    params.require(:item).permit(:name, :concept, :category_id, :condition_id, :shipping_id, :region_id, :postage_id, :image, :price).merge(user_id: current_user.id)
  end

