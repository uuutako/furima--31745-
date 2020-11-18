class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit] 
  #ログインしてない人はログイン画面に飛ばされる

  before_action :move_to_index, only: [:edit]
  #アイテムのユーザーIDとログインしているユーザーが異なる場合トップページに戻る
  #特定のアクションのときだけbefore_actionを使いたい場合はonly

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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

