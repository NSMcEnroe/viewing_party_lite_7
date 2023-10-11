class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if !user.save
      # Email is not unique, show flash alert
      flash[:alert] = "Please try again.  All fields must be filled in and the emails adress must be unique."
      render 'new'
    else 
      # User is successfully saved
      redirect_to "/users/#{user.id}"
    end
  end



  private

  def user_params
    params.permit(:name, :email)
  end
end
