class Movie
  attr_reader :original_title

  def initialize(data)
    @original_title = data[:original_title]
  end
end