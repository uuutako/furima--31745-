require 'rails_helper'

RSpec.describe ::PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      sleep(2)
      @purchase_address = FactoryBot.build(:purchase_address, user_id:@user.id, item_id: @item.id)  
    end

  describe '購入情報の登録' do
    context '住所が保存されるとき' do
      it '全てのデータが存在すれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空でも保存できる' do
      @purchase_address.building_name = ""
      expect(@purchase_address).to be_valid
      end
    end
    context '住所が保存できないとき ' do
      it 'postal_codeが空だと保存できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフンがないと保存できない' do
        @purchase_address.postal_code = 1234567
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeはハイフンあっても７桁以外だと保存できない' do
        @purchase_address.postal_code = 1234-5678
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'region_idが空だと保存できない ' do
        @purchase_address.region_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できない ' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できない ' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない ' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁より多いと保存できない' do
        @purchase_address.phone_number = '123456789101'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
    context '購入記録が保存できるとき' do
      it '全てのデータが存在すれば保存できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '購入記録が保存できないとき' do
      it 'userが紐づいていないとき' do
        @purchase_address.user_id= nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないとき' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it "region_idが1だと保存できない" do
        @purchase_address.region_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Region can't be blank")
      end
      it "電話番号は数字のみでないと（ハイフンが含まれていると）保存できない" do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
end
