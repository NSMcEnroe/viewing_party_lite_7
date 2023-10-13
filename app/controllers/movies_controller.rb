class MoviesController < ApplicationController

  def index
    @facade = MovieFacade.new
  end   
end
