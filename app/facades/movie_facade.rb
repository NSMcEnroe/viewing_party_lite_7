class MovieFacade
  def initialize 
  end

  def movies
    service = MovieDatabaseService.new

    data = service.top_rated_movies
    
    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end

