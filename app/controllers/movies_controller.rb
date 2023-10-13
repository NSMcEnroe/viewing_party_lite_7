class MoviesController < ApplicationController
  # def search_movie_results
  #   conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
  #     faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
  #   end
    
  #   response = conn.get("/3/discover/movie.json")

  #   # /top_rated

  #   data = JSON.parse(response.body, symbolize_names: true)

  #   movies = data[:results]

  #   # found_movies = movies.find_all {|m| m[:original_title] == params[:search]}

  # end

  # def top_movie_results
  #   conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
  #     faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
  #   end
    
  #   response = conn.get("/3/movie/top_rated.json")

  #   data = JSON.parse(response.body, symbolize_names: true)

  #   movies = data[:results]

  #   # found_movies = movies.find_all {|m| m[:original_title] == params[:search]}

  def index
    @facade = MovieFacade.new
  end
    
end




# found_members = members.find_all {|m| m[:last_name] == params[:search]}
# @member = found_members.first
# render "welcome/index"