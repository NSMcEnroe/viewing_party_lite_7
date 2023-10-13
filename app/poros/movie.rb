class Movie
  attr_reader :movie_id,
              :original_title, 
              :vote_average,
              :genre,
              :summary

  def initialize(data)
    @movie_id = data[:id]
    @original_title = data[:original_title]
    @vote_average = data[:vote_average]
    @runtime_minutes = data[:runtime]
    @genre = data[:genres]
    @summary = data[:summary]
  end

  def runtime
    hours = @runtime_minutes / 60
    rest = @runtime_minutes % 60
    "#{hours}:#{rest}" 
  end
end