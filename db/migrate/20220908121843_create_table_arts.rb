class CreateTableArts < ActiveRecord::Migration[6.1]
  def change
    create_table :arts do |t|
      t.integer :art_id
      t.string :title
      t.string :img_url
      t.string :artwork_type_title
      t.string :alt_text
      t.boolean :have_not_been_viewed_much
      t.string :artist_title
      t.integer :date_start
      t.integer :date_end
      t.timestamps
    end
  end
end
