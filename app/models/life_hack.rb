class LifeHack < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  has_many :reviews
end
