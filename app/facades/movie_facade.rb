class MovieFacade
  def initialize 
  end

  def movies
    service = TMDBService.new
    data = service.search_movies

    @movies = data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

end