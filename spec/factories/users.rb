FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { '1a' +  Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '保毛' }
    first_name { '塗男' }
    last_name_kana { 'ホゲ' }
    first_name_kana { 'ヌルオ' }
    birthday { Faker::Date.birthday }
  end
end
