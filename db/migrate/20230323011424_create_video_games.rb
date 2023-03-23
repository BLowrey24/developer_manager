class CreateVideoGames < ActiveRecord::Migration[5.2]
  def change
    create_table :video_games do |t|
      t.integer :game_id
      t.string :name
      t.string :price
      t.datetime :release_date
      t.boolean :up_to_date
      t.string :genre
      t.references :developer, foreign_key: true

      t.timestamps
    end
  end
end
