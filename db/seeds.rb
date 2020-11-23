# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
# including these two lines to use the environemnt variable
require 'Dotenv'
Dotenv.load("../.env")
# including these two lines to use the environemnt variable

Movie.destroy_all

Movie.reset_pk_sequence



def get_Movie(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
        result = JSON.parse(response.body)
    end
    result["results"]
end

seed = []
seed.push(get_Movie("https://api.themoviedb.org/3/trending/movie/week?api_key=#{ENV["MOVIEAPI"]}&page=1"))
seed.push(get_Movie("https://api.themoviedb.org/3/trending/movie/week?api_key=#{ENV["MOVIEAPI"]}&page=2"))
seed.push(get_Movie("https://api.themoviedb.org/3/trending/movie/week?api_key=#{ENV["MOVIEAPI"]}&page=3"))
seed.push(get_Movie("https://api.themoviedb.org/3/trending/movie/week?api_key=#{ENV["MOVIEAPI"]}&page=4"))
seed.push(get_Movie("https://api.themoviedb.org/3/trending/movie/week?api_key=#{ENV["MOVIEAPI"]}&page=5"))

movie_arr=seed.flatten

x=0
poster = movie_arr.map{|movie| "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}"}
language = movie_arr.map{|movie| movie["original_language"]} 
overview = movie_arr.map{|movie| movie["overview"]}
release_date = movie_arr.map{|movie| movie["release_date"]}
adult = movie_arr.map{|movie| movie["adult"]}
title = adult = movie_arr.map{|movie| movie["title"]}

while x < 100
    Movie.create(
        poster: poster[x],
        original_Language: language[x],
        overview: overview[x],
        release: release_date[x],
        adult: adult[x],
        title: title[x]
    )
    x+=1
end

1000.times do
    Votedown.create(movie: Movie.all.sample)
    Voteup.create(movie: Movie.all.sample)
end
# pp movie_arr.map{|movie| movie["poster_path"]}

