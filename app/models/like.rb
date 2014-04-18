class Like < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :review_id
  validates_inclusion_of :score, :in => [-1,1]
  belongs_to :review
  belongs_to :user
end
