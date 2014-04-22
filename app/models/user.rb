class User < ActiveRecord::Base
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  has_many :life_hacks
  has_many :reviews
  validates :admin, inclusion: { in: [true, false] }
  has_many :likes

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    admin == true
  end
end
