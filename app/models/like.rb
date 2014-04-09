class Like < ActiveRecord::Base
  validates_inclusion_of :score, :in => [-1,1]
  belongs_to :review
  belongs_to :user
end
