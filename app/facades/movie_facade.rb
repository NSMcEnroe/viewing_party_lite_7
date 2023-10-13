class MovieFacade
  attr_reader :keyword
  def initialize(keyword = nil)
    @keyword = keyword
  end

  def movies
    service = MovieDatabaseService.new

    if @keyword.nil? || @keyword == ""
      data = service.top_rated_movies
    else
      data = service.search_movies(@keyword)
    end

    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def show_movie
    data = MovieDatabaseService.new.find_movie(@keyword)
    Movie.new(data)
  end

  def cast
    data = MovieDatabaseService.new.find_cast(@keyword)
    Movie.new(data)
  end

  def review_info
    data = MovieDatabaseService.new.reviews(@keyword)

    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end

