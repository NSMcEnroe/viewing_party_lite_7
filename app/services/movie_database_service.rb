 class MovieDatabaseService
  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end 
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def top_rated_movies
    get_url("/3/movie/top_rated")
  end

  def search_movies(keyword)
    get_url("/3/search/movie?query=#{keyword}")
  end

  def find_movie(movie_id)
    get_url("/3/movie/#{movie_id}")
  end

  def find_cast(movie_id)
    get_url("/3/movie/#{movie_id}/credits")
  end

  def reviews(movie_id)
    get_url("/3/movie/#{movie_id}/reviews")
  end
end