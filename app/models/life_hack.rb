class LifeHack < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def self.search(search)
    if search
      where("title ilike ? or content ilike ?", "%#{search}%","%#{search}%")
    else
      find(:all)
    end
  end


  def rating
    rating = 0
    count = 0
    if reviews.exists?
      reviews.each do |review|
        rating += review.rating
        count += 1
      end
    end
    if count != 0
      rating/count
    else
        0
    end
  end

end
