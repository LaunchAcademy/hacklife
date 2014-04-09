class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 6 }

  has_many :likes
  has_many :comments
  belongs_to :user
  belongs_to :life_hack
end
