class User < ApplicationRecord
  has_many :quotes
  has_many :books, through: :quotes
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.username = auth.info.nickname
      user.uid =  auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
