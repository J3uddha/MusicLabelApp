class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.create!(user_params)

    if @user.save!
      log_in!(@user)
      render :show #doesn't lead anywhere
    else
      flash[:notice] = @user.errors.full_messages
      render :new
    end

  end

  private

  def user_params
    params[:user].permit(:email, :password)
  end

end
