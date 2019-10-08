class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.new.getAll
    # render plain: @post.inspect
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if (@post.save)
      redirect_to posts_path;
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      return 'edit'
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Member was successfully destroyed.' }
    end
  end

  private
    def set_post
      @post = Post.new.getPost(params[:id]) 
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end 
end
