class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, on: :create

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end

  has_one_attached :avater

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :nullify
  has_many :marks, dependent: :destroy
  has_many :comments, dependent: :destroy
end
