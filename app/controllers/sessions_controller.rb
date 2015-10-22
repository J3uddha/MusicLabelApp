class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by(:email, user[:email])

    if @user.nil?
      flash[:notice] = @user.errors.full_messages
      render :new
    else
      unless @user.is_password?(user[:password])
        flash[:notice] = "Wrong password."
        render :new
      end
    end

    log_in(@user)
    redirect_to user_url
  end

  def destroy
    log_out
    render :new
  end

  private

  def session_params
    params.require(:session).permit(:session_token)
  end

end
