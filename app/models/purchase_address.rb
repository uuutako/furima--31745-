class PurchaseAddress
  include ActiveModel::Model
  
  attr_accessor :postal_code, :region_id, :city, :token,
                :house_number, :building_name , :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :region_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id

  end


  def save
   purchase = Purchase.create(user_id: user_id, item_id: item_id)

   Address.create(postal_code: postal_code, region_id: region_id, city: city, 
                    house_number: house_number, building_name: building_name, 
                    phone_number: phone_number, purchase_id: purchase.id)
  end
end
