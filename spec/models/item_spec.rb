require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品ができる場合' do
      it "必要な情報を適切に入力すれば商品を出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it "imageが空だと商品を出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "出品画像を入力してください"
      end
      it "nameが空だと商品を出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it "descriptionが空だと商品を出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end

      it "カテゴリーを選択していないと商品を出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it "商品の状態を選択していないと商品を出品できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it "配送料の負担を選択していないと商品を出品できない" do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end
      it "発送元の地域を選択していないと商品を出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it "発送までの日数を選択していないと商品を出品できない" do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end

      it "priceが空だと商品を出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください"
      end
      it "priceが全角での入力だと商品を出品できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は半角数字で入力してください"
      end
      it "priceが半角英数混合での入力だと商品を出品できない" do
        @item.price = "500k"
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は半角数字で入力してください"
      end
      it "priceが半角英語での入力だと商品を出品できない" do
        @item.price = "five"
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は半角数字で入力してください"
      end
      it "priceが300未満だと商品を出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は300以上の値にしてください"
      end
      it "priceが10,000,000以上だと商品を出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は9999999以下の値にしてください"
      end
    end
  end
end
