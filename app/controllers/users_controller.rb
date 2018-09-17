class UsersController < ApplicationController
  
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new (the form)
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params) #replaces params[:user]
      if @user.save
          flash[:success] = "Profie created. Now log in"
          redirect_to "/login"
      else
          flash[:error] ="Something went wrohg"
          render :new 
      end
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /users/id/edit (form)
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/id
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "Info updated"
        redirect_to users_path
      else
        flash[:error] = "something went wrong"
        render :edit
      end
  end

  # DELETE /users/id
  def destroy
    Com.where(user_id: session[:user_id]).destroy_all
    Post.where( user_id: session[:user_id]).destroy_all
    @user = User.find(params[:id])
    session[:user_id] = nil
    @user.destroy
    flash[:error] = "Account deleted. You'll be missed"
    redirect_to '/'
  end

  private 
    def user_params  #strong params 
      params.require(:user).permit(:fname, :lname, :password, :email)
    end
end
