class MoviesController < ApplicationController
  def index
      @facade = MovieFacade.new(params[:query])
  end   

  def show
    movie_id = params[:id]
    @movie = MovieFacade.new(movie_id)
  end
end
