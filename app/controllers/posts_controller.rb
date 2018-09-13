class PostsController < ApplicationController
  #automatically calls set_post
  # before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end


  # POST /posts
  def create
    @post = Post.new(post_params) #

      if @post.save
        redirect_to @post, notice: 'Post created.'
      else
        render :new 
      end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/id
  def show
    @post = Post.find(params[:id])
  end

  # PUT /posts/id
  def update
      @post = Post.find(params[:id])
      if @post.update(post_params) #
        redirect_to @post, notice: 'Post updated.' 
      else
        render :edit 
      end
  end

  # DELETE /posts/id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Post deleted.' 
  end

  # GET /posts/id/edit
  def edit
    @post = Post.find(params[:id])
  end

  private
    #calls post.find method to retrieve post with an id corr. to parameter passed to controller
    def set_post
      @post = Post.find(params[:id])
    end

    #params
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
