# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      # User is successfully saved
      redirect_to "/users/#{user.id}"
    else
      # Email is not unique, show flash alert
      # Error messages inherited my applciation controller
      flash.now[:alert] = "Error: #{error_message(user.errors)}"
      render 'new'
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
