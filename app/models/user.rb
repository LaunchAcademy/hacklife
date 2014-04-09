class User < ActiveRecord::Base
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  has_many :life_hacks
  has_many :reviews
  
  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
