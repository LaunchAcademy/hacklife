class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
end
