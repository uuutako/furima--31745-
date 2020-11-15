require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
   before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全てのデータが存在すれば登録できる" do
        expect(@user).to be_valid
     end
    end
    context '新規登録がうまくいかないとき' do
      it "nick_nameが空だと登録できない" do
         @user.nick_name  = nil
         @user.valid?
         expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it "重複したニックネームが存在する場合登録ができない" do
        @user.save
        another_user =FactoryBot.build(:user, nick_name: @user.nick_name)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Nick name has already been taken")
     end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end  
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user =FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれていない場合登録できない" do
        @user.email = "test.1mail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字以下であれば登録できない" do
        @user.password ="12345"
        @user.encrypted_password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在しても,password_confirmationが空では登録できない" do
        @user.password ="abc34567"
        @user.encrypted_password =  nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "ab23456"
        @user.password = "abc34567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英字のみの場合登録できない" do
        @user.password = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが半角数字のみの場合登録できない" do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name =  "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが全角カタカナ以外だと登録できない' do
        @user.first_name_kana ="aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'last_name_kanaが全角カタカナ以外だと登録できない' do
        @user.last_name_kana = "ｼﾞﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
end