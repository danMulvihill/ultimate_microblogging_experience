class PostsController < ApplicationController
  
  # GET /posts
  def index
    @posts = Post.all
    # @user = User.find(session[:user_id])
    @coms = Com.all
  end

  # GET /posts/new (the form)
  def new
    @post = Post.new
    @user = User.find(session[:user_id])
  end

  # POST /posts
  def create
    @post = Post.new(post_params) #
    @user = User.find(session[:user_id])
      if @post.save
        flash[:success] = "Posted!"
        redirect_to posts_path
      else
        render :new 
      end
  end

  # GET /posts/id
  def show
    @post = Post.find(params[:id])
    @user = User.find(session[:user_id])
    @com= Com.find(1)
  end

  # GET /posts/id/edit (the form)
  def edit
    @post = Post.find(params[:id])
    @user = User.find(session[:user_id])
  end

  # PUT /posts/id
  def update
      @post = Post.find(params[:id])
      if @post.update(post_params) #
        flash[:notice] = "Post updated"
        redirect_to posts_path
      else
        render :edit 
      end
  end

  # DELETE /posts/id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:error] = "Post deleted"
    redirect_to posts_path
  end



  private

    #params
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
