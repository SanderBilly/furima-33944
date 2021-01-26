class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 0, message: "を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :price, presence: true
  validates :price, numericality: { only_integer: true, message: "は半角数字で入力してください" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  
  belongs_to :user
  has_one :order
  has_many :marks, dependent: :destroy
  has_many :comments, dependent: :destroy
end
