class MoviesController < ApplicationController

  def index
    @facade = MovieFacade.new(movie_params[:query])
  end   

  private
  
  def movie_params
    params.permit(:query)
  end
end
