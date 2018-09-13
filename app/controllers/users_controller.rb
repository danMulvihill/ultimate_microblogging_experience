class UsersController < ApplicationController
  
  # GET /users
  def index
    @users = User.all
  end

  # POST /users
  def create
    @user = User.new(user_params)
      if @user.save
          flash[:notice] = "User created"
          redirect_to @user 
      else
          render :new 
      end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /users/id/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/id
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user, notice: 'User updated.'
      else
        render :edit
      end
  end

  # DELETE /users/id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'User deleted.' 
  end

  private
    def user_params  #strong params 
      params.require(:user).permit(:fname, :lname, :password, :email)
    end
end
