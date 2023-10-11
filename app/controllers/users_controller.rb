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

    user.save
    # if !merchant.save
    #   flash.now[:alert] = "Please Input a Name"
    #   render :new
    # else
    redirect_to "/users/#{user.id}"
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
