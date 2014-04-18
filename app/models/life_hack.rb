class LifeHack < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
<<<<<<< HEAD
  has_many :reviews, dependent: :destroy
=======
  has_many :reviews
  
  def self.search(search)
    if search
      where("title ilike ? or content ilike ?", "%#{search}%","%#{search}%")
    else
      find(:all)
    end
  end
>>>>>>> 066ee964a2da598cf5e8b904ad28101b33dbd173
end
