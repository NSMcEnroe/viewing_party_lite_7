class Movie
  attr_reader :original_title, :vote_average

  def initialize(data)
    @original_title = data[:original_title]
    @vote_average = data[:vote_average]
  end
end