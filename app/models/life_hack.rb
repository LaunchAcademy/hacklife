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
end
