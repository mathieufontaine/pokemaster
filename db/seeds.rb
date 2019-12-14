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



puts 'Cleaning database...'
# Pokedex.destroy_all
# Team.destroy_all
Pokemon.destroy_all
Type.destroy_all




url_types = "https://pokeapi.co/api/v2/type"
# url_moves = "https://pokeapi.co/api/v2/move"

# pokemons = open(url_pokemons).read
types = open(url_types).read
# moves = open(url_types).read

types_array = JSON.parse(types)["results"]
# moves_array = JSON.parse(moves)["results"]

# pokemons_array = JSON.parse(pokemons)["results"]
# types = PokeApi.get(:type)



puts 'Creating types of Pokémons...'


types_array.each do |type|
	Type.create!(
	name: type["name"])
end

# puts 'Creating moves...'


# moves_array.each do |type|
# 	Attack.create!(
# 	name: type["name"],
# 	)
# end

puts 'Creating Pokémons...'



poke_ids = []
for i in 1..20
	poke_ids << i	
end

poke_ids.each do |id|
url = "https://pokeapi.co/api/v2/pokemon/#{id}"
pokemon = JSON.parse(open(url).read)
Pokemon.create!(
		name: pokemon["name"].capitalize,
		# picture: pokemon["url"],
		height: pokemon["height"],
		weight: pokemon["weight"],
		location: Faker::Games::Pokemon.location,
		# type: pokemon["types"][0]["type"]["name"]
		type: Type.all.sample)

end

puts 'Creating moves...'

moves_ids = []
for i in 1..40
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


