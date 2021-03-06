class OrderPurchaser
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン(-)を含めて入力してください" }
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: "は10桁か11桁の半角数字のみを入力してください" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchaser.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end