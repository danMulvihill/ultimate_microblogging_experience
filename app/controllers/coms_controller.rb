class ComsController < ApplicationController
  before_action :set_com, only: [:show, :edit, :update, :destroy]

  # GET /coms
  def index
    @coms = Com.all
    @user = User.find(session[:user_id])
    @post = Post.all
  end

  # GET /coms/id
  def show
    @user = User.find(session[:user_id])
    # @post = Post.find(params[:post_id])
  end

  # GET /coms/new
  def new
    puts params.inspect
    @com =Com.new
    # @com = Com.new(post_id: params[:post_id])
    @user = User.find(session[:user_id])
    @postId = params[:pid]
  end

  # GET /coms/id/edit
  def edit
    @user = User.find(session[:user_id])
    # @post = Post.find(params[:post_id])
  end

  # POST /coms
  def create
    @com = Com.new(com_params)
    @user = User.find(session[:user_id])
    # @post = Post.find(params[:post_id])
    if @com.save
      flash[:success] = "Comment posted"
      redirect_to posts_path 
    else
      flash[:error] = "Something went wrong"
      redirect_to posts_path
    end
  end

  # PUT /coms/id
  def update
    @com = Com.find(params[:id])
    if @com.update(com_params)
      flash[:notice] = "Comment edited"
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong"
      redirect_to posts_path
    end
  end

  # DELETE /coms/id
  def destroy
    @com.destroy
    flash[:error] = "Comment deleted"
    redirect_to posts_path
  end

  private
    def set_com
      @com = Com.find(params[:id])
    end

    def com_params
      params.require(:com).permit(:content, :post_id, :user_id)
    end
end
