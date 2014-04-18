class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 6 }

<<<<<<< HEAD
  has_many :comments, dependent: :destroy
=======
  has_many :likes
  has_many :comments
>>>>>>> 066ee964a2da598cf5e8b904ad28101b33dbd173
  belongs_to :user
  belongs_to :life_hack

  def self.score_count(review)
    total_score = 0
    review.likes.each do |like|
      total_score += like.score
    end
    total_score
  end

end
