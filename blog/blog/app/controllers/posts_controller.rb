class PostsController < ApplicationController
  def new
    @post = Post.new(params[:post])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_url(@post)
    else
      render post: params[:post].inspect
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def show
    @posts = Post.all
  end

  def index

  end

  def update

  end

  def destroy

  end


end
