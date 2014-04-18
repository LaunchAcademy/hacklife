class User < ActiveRecord::Base
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  has_many :life_hacks
  has_many :reviews
<<<<<<< HEAD
  validates :admin, inclusion: { in: [true, false] }
=======
  has_many :likes
>>>>>>> 066ee964a2da598cf5e8b904ad28101b33dbd173

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    admin == true
  end
end
