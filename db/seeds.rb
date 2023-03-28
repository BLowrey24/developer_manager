# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
bungie = Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 3, still_active: true )
sie = Developer.create!(name: "Sony Interactive Entertainment", location: "San Mateo, California", num_awards: 5, still_active: false)
VideoGame.create!(name: "Destiny", price: "FTP", up_to_date: true, dlc: 6, genre: "Online FPS", developer_id: "#{bungie.id}")
VideoGame.create!(name: "Halo Reach", price: "$59.99", up_to_date: true, dlc: 1, genre: "FPS/Story", developer_id: "#{bungie.id}")
VideoGame.create!(name: "God of War", price: "$59.99", up_to_date: false, dlc: 0, genre: "Hack&Slash", developer_id: "#{sie.id}")