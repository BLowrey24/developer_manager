class CreateVideoGames < ActiveRecord::Migration[5.2]
  def change
    create_table :video_games do |t|
      t.string :name
      t.string :price
      t.boolean :up_to_date
      t.integer :dlc
      t.string :genre
      t.references :developer, foreign_key: true

      t.timestamps
    end
  end
end
