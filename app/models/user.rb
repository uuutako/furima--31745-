class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name,   presence: true,  uniqueness: { case_sensitive: false } 

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name,  presence: true,  format: { with: /\A[ぁ-んァ-ン一-龥]/} 
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana,   presence: true, format: {with: /\A[ァ-ヶー－]+\z/}  
  validates :birthday,presence: true       
  validates :password, presence: true, length: { minimum: 6 }
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  


  ### Association
  has_many    :items
  has_many    :comments
  has_many    :purchases

         
end