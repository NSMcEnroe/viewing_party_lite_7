require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attrs = {
      original_title: "The Movie Movie",
      vote_average: "9.2",
      runtime: "200",
      genres: "Drama",
      overview: "Nothing, just nothing"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.original_title).to eq("The Movie Movie")
    expect(movie.vote_average).to eq("9.2")
    expect(movie.runtime_minutes).to eq("200")
    expect(movie.genres).to eq("Drama")
    expect(movie.summary).to eq("Nothing, just nothing")

  end
end