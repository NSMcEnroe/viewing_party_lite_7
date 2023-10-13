class Movie
  attr_reader :original_title, :vote_average, :movie_id

  def initialize(data)
    @original_title = data[:original_title]
    @vote_average = data[:vote_average]
    @movie_id = data[:id]
  end
end