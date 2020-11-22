class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index] 
  before_action :move_to_root_path, only:[:index]


  def index 
    @item = Item.find(params[:item_id]) 
    @purchase_address = PurchaseAddress.new 
  end
 
  def new
    @purchase_address = PurchaseAddress.new 
  end
 
  def create
    @item = Item.find(params[:item_id]) 
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
    @item = Item.find(params[:item_id]) 
    if @item.user.id == current_user.id || @item.purchase.present?
    redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end


end
