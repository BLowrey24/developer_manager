class CreateDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :location
      t.integer :num_awards
      t.boolean :still_active

      t.timestamps
    end
  end
end
