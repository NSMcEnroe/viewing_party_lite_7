require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attrs = {
      original_title: "The Movie Movie",
      vote_average: "9.2"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.original_title).to eq("The Movie Movie")
    expect(movie.vote_average).to eq("9.2")
  end
end