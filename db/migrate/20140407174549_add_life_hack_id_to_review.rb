class AddLifeHackIdToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :life_hack_id, :integer, null: false
  end
end
