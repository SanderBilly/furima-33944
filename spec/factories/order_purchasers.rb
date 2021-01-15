FactoryBot.define do
  factory :order_purchaser do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {"123-4567"}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    city          {"町村市"}
    house_number  {"地区1-1-1"}
    building_name {"建物ビル"}
    phone_number  {"12345678901"}
  end
end