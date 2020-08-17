# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
GameState.destroy_all

jr = User.create(username: "junior", password: "lanaisadog", high_score: 150)
steve = User.create(username: "steve", password: "warthunder", high_score: 130)

game1 = GameState.create(user: jr, score: 150, save_name: "winner", direction: "down", apple: "01")
game2 = GameState.create(user: steve, score: 130, save_name: "almost", direction: "up", apple: "46")
game3 = GameState.create(user: steve, score: 110, save_name: "lost", direction: "right", apple: "101")
