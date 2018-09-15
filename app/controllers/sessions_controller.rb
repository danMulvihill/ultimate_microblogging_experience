class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.password == params[:session][:password]
      # authenticate(params[:password])
      session[:user_id] = @user.id

      flash[:notice] = "#{@user.fname} logged in"
      redirect_to '/posts'
    else
      flash[:error] = "Login failed"
      redirect_to '/login'
    end
  end

  def destroy
    flash[:notice] = "Good bye"
    session[:user_id] = nil
    puts "session id========="
    puts session[:user_id]
    redirect_to "/"
  end

end
