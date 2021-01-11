FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = "111aaa"
    password {password}
    password_confirmation {password}
    first_name { "山田" }
    last_name { "陸太郎" }
    first_name_kana { "ヤマダ" }
    last_name_kana { "リクタロウ" }
    birthday {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end
