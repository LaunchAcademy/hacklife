class AddUserAssociations < ActiveRecord::Migration
  def change
    add_reference :life_hacks, :user, index: true, null: false
    add_reference :reviews, :user, index: true, null: false
  end
end
