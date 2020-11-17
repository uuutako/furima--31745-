class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
 
 with_options presence: true do
    validates :name, length: { maximum: 40 } 
    validates :concept, length: { maximum: 1000 } 
    validates :category_id 
    validates :condition_id
    validates :postage_id
    validates :region_id 
    validates :shipping_id
    validates :image

    validates :price,
     numericality:{ greater_than: 300, less_than: 9999999},
     format: { with: /\A[0-9]+\z/}


  end

  with_options  numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :region_id
    validates :shipping_id
  end

  ### Association
  belongs_to    :user
  has_many      :comments
  has_one       :purchase
  has_one_attached :image

  belongs_to :category
  belongs_to :condition  #アクティブハッシュのrb名を全て書く(aosise-syonn)
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping


end
