class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.where(email: params[:emal]).first
    if @user && @user.password == params[:password]
      session[:user_id] = @user.user_id
      redirect_to post_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path
  end

end
