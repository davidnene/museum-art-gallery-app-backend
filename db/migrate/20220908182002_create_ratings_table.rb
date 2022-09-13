class CreateRatingsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :art_rating
      t.string :comment
      t.integer :art_id
      t.timestamps
    end
  end
end
