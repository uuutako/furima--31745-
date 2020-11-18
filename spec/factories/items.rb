FactoryBot.define do
  factory :item do
    name { Faker::Name.last_name }
    price { 1000 }
    concept { 'あいうえお' }
    category_id { 2 }
    condition_id { 2 }
    postage_id { 2 }
    shipping_id { 2 }
    region_id { 2 }
    user_id { 1 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
