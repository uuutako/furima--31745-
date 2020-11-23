FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { password }
    first_name { '加藤' }
    last_name  { '次郎' }
    first_name_kana { 'カトウ' }
    last_name_kana { 'ジロウ' }
    birthday { '1990-01-01' }

  end
end
