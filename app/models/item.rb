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
              numericality: { greater_than: 299, less_than: 10_000_000 },
              format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :region_id
    validates :shipping_id
  end

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  ### Association
  belongs_to    :user
  has_many      :comments
  has_one       :purchase
  has_one_attached :image

  belongs_to :category
  belongs_to :condition 
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping
 

end
