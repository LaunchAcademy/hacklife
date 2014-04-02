class CreateLifeHacks < ActiveRecord::Migration
  def change
    create_table :life_hacks do |t|
      t.string :title, null: false
      t.string :link
      t.text :content, null: false

      t.timestamps
    end
  end
end
