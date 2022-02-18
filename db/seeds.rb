# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'creating movies'

url = 'http://tmdb.lewagon.com/movie/top_rated'

buffer = URI.open(url).read

result = JSON.parse(buffer)

puts result['results']

result['results'].each do |movie|
  puts 'creating movie'
  puts movie['title']
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'].floor,
    poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}"
  ) unless Movie.where('title = ?', movie['title']).size.positive?
  if Movie.create!
    puts 'created movie'
  end
end

puts 'created movies'
