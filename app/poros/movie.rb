class Movie
  attr_reader :movie_id,
              :original_title, 
              :vote_average,
              :runtime_minutes,
              :genres,
              :summary

  def initialize(data)
    @movie_id = data[:id]
    @original_title = data[:original_title]
    @vote_average = data[:vote_average]
    @runtime_minutes = data[:runtime] 
    @genres = data[:genres] 
    @summary = data[:overview]
  end

  def runtime
      hours = @runtime_minutes / 60
      rest = @runtime_minutes % 60
      "#{hours}:#{rest}" 
  end

  def all_genres
    genre_names = @genres.map do |genre|
      genre[:name]
    end
    genre_names.join(', ')
  end
end