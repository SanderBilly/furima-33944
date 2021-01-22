require 'rails_helper'

RSpec.describe OrderPurchaser, type: :model do
  describe '商品の購入' do
    before do
      @order_purchaser = FactoryBot.build(:order_purchaser)
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_purchaser.user_id = @user.id
      @order_purchaser.item_id = @item.id
      sleep(1)
    end

    context '商品を購入できる場合' do
      it '正しく情報を入力すれば商品を購入できる' do
        expect(@order_purchaser).to be_valid
      end
      it 'building_nameが空でも商品を購入できる' do
        @order_purchaser.building_name = nil
        expect(@order_purchaser).to be_valid
      end
      it 'phone_numberが10桁でも商品を購入できる' do
        @order_purchaser.building_name = "1234567890"
        expect(@order_purchaser).to be_valid
      end
    end

    context '商品を購入できない場合'do
      it 'user_idが存在しない場合、商品を購入できない' do
        @order_purchaser.user_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Userを入力してください"
      end
      it 'item_idが存在しない場合、商品を購入できない' do
        @order_purchaser.item_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Itemを入力してください"
      end
      it 'tokenが空だと商品を購入できない' do
        @order_purchaser.token = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "クレジットカード情報を入力してください"
      end
      it 'postal_codeが空だと商品を購入できない' do
        @order_purchaser.postal_code = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "郵便番号を入力してください"
      end
      it 'postal_codeにハイフンが含まれていないと商品を購入できない' do
        @order_purchaser.postal_code = "1234567"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "郵便番号はハイフン(-)を含めて入力してください"
      end
      it 'prefecture_idが空だと商品を購入できない' do
        @order_purchaser.prefecture_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "都道府県を選択してください"
      end
      it 'prefecture_idが0だと商品を購入できない' do
        @order_purchaser.prefecture_id = 0
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "都道府県を選択してください"
      end
      it 'cityが空だと商品を購入できない' do
        @order_purchaser.city = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "市区町村を入力してください"
      end
      it 'cityが半角英語での入力だと商品を購入できない' do
        @order_purchaser.city = "Machimura"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "市区町村は不正な値です"
      end
      it 'house_numberが空だと商品を購入できない' do
        @order_purchaser.house_number = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "番地を入力してください"
      end
      it 'phone_numberが空だと商品を購入できない' do
        @order_purchaser.phone_number = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "電話番号を入力してください"
      end
      it 'phone_numberが全角での入力だと商品を購入できない' do
        @order_purchaser.phone_number = "１２３４５６７８９０１"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "電話番号は10桁か11桁の半角数字のみを入力してください"
      end
      it "phone_numberが半角英数混合での入力だと商品を購入できない" do
        @order_purchaser.phone_number = "12345abcde"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "電話番号は10桁か11桁の半角数字のみを入力してください"
      end
      it "phone_numberが半角英語での入力だと商品を購入できない" do
        @order_purchaser.phone_number = "phonenumber"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "電話番号は10桁か11桁の半角数字のみを入力してください"
      end
      it "phone_numberが9桁だと商品を購入できない" do
        @order_purchaser.phone_number = "123456789"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "電話番号は10桁か11桁の半角数字のみを入力してください"
      end
    end
  end
end
