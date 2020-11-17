require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
     @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do 
      it "全てのデータが正しく存在すれば保存できる" do
        expect(@item).to be_valid
     end
    end

    context '商品出品がうまくいかないとき' do
      it "nameが空だと保存できない" do
        @item.name  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが40文字以上だと保存できない" do
        @item.name = "あ" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "conceptが空だと保存できない" do
        @item.concept  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end
      it "conceptが1000文字以上だと保存できない" do
        @item.concept ='あ' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept is too long (maximum is 1000 characters)")
      end
      it "category_idが空だと保存できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空だと保存できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "postage_idが空だと保存できない" do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it "region_idが空だと保存できない" do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it "shipping_idが空だと保存できない" do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it "販売金額が ¥300以下だと保存できない" do
        @item.price =200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "販売金額が ¥10,000,000以上だと保存できない" do
        @item.price =10000001
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it "販売金額が半角数字以外だと保存できない" do
        @item.price= "１２三し⑤"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "imageが空だと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "category_idが[1]だと保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idが[1]だと保存できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "postage_idが[1]だと保存できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end
      it "region_idが[1]だと保存できない" do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end
      it "shipping_idが[1]だと保存できない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
    end
  end
end
end