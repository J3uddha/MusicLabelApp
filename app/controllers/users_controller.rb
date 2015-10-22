class UsersController < ApplicationController

  before_action :guest_redirect, only: [:show]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create!(user_params)

    if @user.save
      log_in!(@user)
      render :show
    else
      flash[:notice] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = current_user
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def guest_redirect
    redirect_to new_user_url if current_user.nil?
  end
end
