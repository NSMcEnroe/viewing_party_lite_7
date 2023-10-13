class MovieFacade
  attr_reader :keyword
  def initialize(keyword = nil)
    @keyword = keyword
  end

  def movies
    service = MovieDatabaseService.new

    if @keyword.nil?
      data = service.top_rated_movies
    else
      data = service.search_movies(@keyword)
    end

    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end

