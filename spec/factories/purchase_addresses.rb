FactoryBot.define do
  factory :purchase_address do
    postal_code {'123-4567'}
    region_id  {2}
    city  {'名古屋市'}
    house_number  {12}
    building_name  {'ABCビル'}
    phone_number  {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item
  
  end
end


