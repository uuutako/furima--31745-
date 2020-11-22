class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index] 
  before_action :set_item, only:[:index, :create, :move_to_root_path]
  before_action :move_to_root_path, only:[:index]
 

  def index 
    @purchase_address = PurchaseAddress.new 
  end
 
  def new
    @purchase_address = PurchaseAddress.new 
  end
 
  def create
    @purchase_address = PurchaseAddress.new(purchase_params) 
     if @purchase_address.valid?
        pay_item 
        @purchase_address.save 
        redirect_to root_path
     else
        render :index
     end
  end
 
  private
  def purchase_params
   params.require(:purchase_address).permit(:phone_number, :postal_code, :region_id, 
    :city, :house_number, :building_name, :purchase_id)
     .merge(user_id: current_user.id, item_id: params[:item_id],
      token: params[:token])
  end

  def move_to_root_path
    if @item.user.id == current_user.id || @item.purchase.present?
    redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id]) 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price], 
        card: purchase_params[:token],  
        currency: 'jpy'     
      )
  end


end
