# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'poke-api-v2'
require 'json'
require 'open-uri'
require 'csv'    



puts 'Cleaning database...'
# Pokedex.destroy_all
# Team.destroy_all
Pokemon.destroy_all
Type.destroy_all





puts 'Creating Users...'

User.create!(username: "Mat", email: "mathieu@mathieu.com", password: "password", avatar: "pika1.png", role: "trainer")
User.create!(username: "Arthur", email: "arthur@arthur.com", password: "password", avatar: "avatar0.png", role: "trainer")
User.create!(username: "John", email: "john@john.com", password: "password", avatar: "avatar1.png", role: "trainer")
User.create!(username: "Mike", email: "mike@mike.com", password: "password", avatar: "avatar2.png", role: "user")
User.create!(username: "Brian", email: "brian@brian.com", password: "password", avatar: "avatar3.png", role: "trainer")
User.create!(username: "Jojo", email: "jojo@jojo.com", password: "password", avatar: "avatar3.png", role: "user")
User.create!(username: "Kate", email: "kate@kate.com", password: "password", avatar: "avatar5.png", role: "trainer")
User.create!(username: "Sam", email: "sam@sam.com",password: "password", avatar: "carapuce.png", role: "trainer")
User.create!(username: "Sarah", email: "sarah@sarah.com", password: "password", avatar: "avatar6.png", role: "user")



puts 'Creating types of Pokémons...'



# url_types = "https://pokeapi.co/api/v2/type"
# types = open(url_types).read
# types_array = JSON.parse(types)["results"]


# types_array.each do |type|
# 	Type.create!(
# 	name: type["name"])
# end

Type.create!(name: 'normal')
Type.create!(name: 'water')
Type.create!(name: 'electric')
Type.create!(name: 'fighting')
Type.create!(name: 'ground')
Type.create!(name: 'psychic')
Type.create!(name: 'fire')
Type.create!(name: 'grass')
Type.create!(name: 'ice')
Type.create!(name: 'rock')
Type.create!(name: 'poison')
Type.create!(name: 'flying')
Type.create!(name: 'bug')
Type.create!(name: 'ghost')
Type.create!(name: 'dragon')

Type.create!(name: 'steel')
Type.create!(name: 'fairy')
Type.create!(name: 'dark')


# url_moves = "https://pokeapi.co/api/v2/move"

# pokemons = open(url_pokemons).read
# moves = open(url_types).read

# moves_array = JSON.parse(moves)["results"]

# pokemons_array = JSON.parse(pokemons)["results"]
# types = PokeApi.get(:type)








puts 'Creating Pokémons...'


# poke_ids = []
# for i in 1..20
# 	poke_ids << i	
# end

# poke_ids.each do |id|
# url = "https://pokeapi.co/api/v2/pokemon/#{id}"
# pokemon = JSON.parse(open(url).read)
# Pokemon.create!(
# 		name: pokemon["name"].capitalize,
# 		# picture: pokemon["url"],
# 		height: pokemon["height"],
# 		weight: pokemon["weight"],
# 		location: Faker::Games::Pokemon.location,
# 		# type: pokemon["types"][0]["type"]["name"]
# 		type: Type.all.sample.capitalize)

# end


# pokemons = []
# CSV.foreach('./db/pokemon.csv', headers: true) do |row|
# pokemons << {row['#'], row['Name'], row['Total'], row['HP'], row["Attack"], row["Defense"] , row["Sp. Atk"], row["Sp. Def"], row["Speed"]}
# end  


CSV.foreach('./db/pokemon.csv', :headers => true, :col_sep => ',') do |row|
  Pokemon.create(
  	number: row[0],
    name: row[1],
    total: row[4],
	HP: row[5],
	attack: row[6],
	defense: row[7],
	special_attack: row[8],
	special_defense: row[9],
	speed: row[10],
	location: Faker::Games::Pokemon.location,
	type_id: row[2].to_i)
end


puts 'Creating moves...'

moves_ids = []
for i in 1..10
	moves_ids << i	
end

moves_ids.each do |id|
url = "https://pokeapi.co/api/v2/move/#{id}"
move = JSON.parse(open(url).read)
Attack.create!(
		name: move["name"].capitalize,
		# picture: pokemon["url"],
		precision: move["accuracy"],
		power: move["power"],
		power_point: move["pp"],
		type: Type.all.sample)

end


# puts 'Creating moves...'


# moves_array.each do |type|
# 	Attack.create!(
# 	name: type["name"],
# 	)
# end


# pokemons_array.each do |pokemon|
# 	Pokemon.create!(
# 		name: pokemon["name"].capitalize,
# 		# picture: pokemon["url"],
# 		height: pokemon["url"]["height"],
# 		weight: pokemon["url"]["weight"],
# 		location: Faker::Games::Pokemon.location,
# 		type: Type.all.sample)
# 	end

puts 'Pokedex is ready!'


