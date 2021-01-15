require 'rails_helper'

RSpec.describe OrderPurchaser, type: :model do
  describe '商品の購入' do
    before do
      @order_purchaser = FactoryBot.build(:order_purchaser)
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
        expect(@order_purchaser.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが存在しない場合、商品を購入できない' do
        @order_purchaser.item_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空だと商品を購入できない' do
        @order_purchaser.token = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空だと商品を購入できない' do
        @order_purchaser.postal_code = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeにハイフンが含まれていないと商品を購入できない' do
        @order_purchaser.postal_code = "1234567"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'prefecture_idが空だと商品を購入できない' do
        @order_purchaser.prefecture_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが0だと商品を購入できない' do
        @order_purchaser.prefecture_id = 0
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空だと商品を購入できない' do
        @order_purchaser.city = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "City can't be blank"
      end
      it 'cityが半角英語での入力だと商品を購入できない' do
        @order_purchaser.city = "Machimura"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "City is invalid. Input full-width characters."
      end
      it 'house_numberが空だと商品を購入できない' do
        @order_purchaser.house_number = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空だと商品を購入できない' do
        @order_purchaser.phone_number = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが全角での入力だと商品を購入できない' do
        @order_purchaser.phone_number = "１２３４５６７８９０１"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Phone number is invalid. Include within 10 to 11 half-width numbers."
      end
      it "phone_numberが半角英数混合での入力だと商品を購入できない" do
        @order_purchaser.phone_number = "12345abcde"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Phone number is invalid. Include within 10 to 11 half-width numbers."
      end
      it "phone_numberが半角英語での入力だと商品を購入できない" do
        @order_purchaser.phone_number = "phonenumber"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Phone number is invalid. Include within 10 to 11 half-width numbers."
      end
      it "phone_numberが9桁だと商品を購入できない" do
        @order_purchaser.phone_number = "123456789"
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include "Phone number is invalid. Include within 10 to 11 half-width numbers."
      end
    end
  end
end
