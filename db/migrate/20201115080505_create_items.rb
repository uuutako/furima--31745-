class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,            null: false  
      t.integer    :price,           null: false  
      t.text       :concept,         null: false
      t.integer    :category_id,     null: false
      t.integer    :condition_id,    null: false 
      t.integer    :postage_id,      null: false 
      t.integer    :region_id,       null: false 
      t.integer    :shipping_id,     null: false
      t.references :user,            foreign_key: true
      t.string :ancestry, index: true
      t.timestamps
    end
  end
end


