FactoryBot.define do
  factory :comment do
    text {Faker::Food.description}

    association :user
    association :item
  end
end
