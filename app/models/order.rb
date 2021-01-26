class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item
  has_one :purchaser
end
