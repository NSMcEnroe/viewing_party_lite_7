require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#movies' do
    it 'returns an array of Movies objects', :vcr do
        movie_facade = SearchFacade.new

        movies = movie_facade.movies

        expect(movies).to be_an(Array)
        expect(movies.first).to be_a(Movie)
    end
    end
  end
en