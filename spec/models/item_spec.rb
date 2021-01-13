require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    it "必要な情報を適切に入力すれば商品を出品できる" do
      expect(@item).to be_valid
    end

    it "imageが空だと商品を出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it "nameが空だと商品を出品できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it "descriptionが空だと商品を出品できない" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end

    it "カテゴリーを選択していないと商品を出品できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it "商品の状態を選択していないと商品を出品できない" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it "配送料の負担を選択していないと商品を出品できない" do
      @item.shipping_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
    end
    it "配送元の地域を選択していないと商品を出品できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it "発送までの日数を選択していないと商品を出品できない" do
      @item.shipping_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping day can't be blank"
    end

    it "priceが空だと商品を出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it "priceが半角数字での入力でなければ商品を出品できない" do
      @item.price = "五百円"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid. Input half-width numbers."
    end
    it "priceが300未満だと商品を出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is out of setting range"
    end
    it "priceが10,000,000以上だと商品を出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is out of setting range"
    end
  end
end
