class MoviesController < ApplicationController

  def index
    @facade = MovieFacade.new(params[:query])
  end   

  def show
    
  end

end
