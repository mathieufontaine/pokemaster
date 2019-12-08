# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'



puts 'Cleaning database...'
Pokemon.destroy_all
Type.destroy_all

puts 'Creating types of Pokémons...'
Type.create!(name: 'Normal')
Type.create!(name: 'Water')
Type.create!(name: 'Electric')
Type.create!(name: 'Fighting')
Type.create!(name: 'Ground')
Type.create!(name: 'Psychic')
Type.create!(name: 'Dark')
Type.create!(name: 'Steel')
Type.create!(name: 'Fire')
Type.create!(name: 'Grass')
Type.create!(name: 'Ice')
Type.create!(name: 'Rock')
Type.create!(name: 'Poison')
Type.create!(name: 'Flying')
Type.create!(name: 'Bug')
Type.create!(name: 'Ghost')
Type.create!(name: 'Dragon')
Type.create!(name: 'Fairy')

puts 'Creating Pokémons...'

150.times do 
	Pokemon.create!(
		name: Faker::Games::Pokemon.name,
		height: Faker::Measurement.height,
		weight: Faker::Measurement.weight,
		location: Faker::Games::Pokemon.location,
		type: Type.all.sample)
	end

puts 'Pokedex is ready!'


