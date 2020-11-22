class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase,      foreign_key: true
      t.string     :postal_code,   null: false  
      t.integer    :region_id,     null: false 
      t.string     :city,          null: false  
      t.string     :house_number,  null: false 
      t.string     :building_name
      t.string     :phone_number,  null: false 
      t.timestamps
    end
  end
end
