class CreateLifeHacks < ActiveRecord::Migration
  def change
    create_table :life_hacks do |t|
      t.string :title
      t.string :link
      t.text :content

      t.timestamps
    end
  end
end
