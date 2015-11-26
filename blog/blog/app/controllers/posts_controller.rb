class PostsController < ApplicationController
  def new
    @post = Post.new(params[:post])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render action: :new
    end
  end

  def index
    @posts = Post.all
    @states = State.all
  end

  def show
    id = params[:id]
    @post = Post.find id
    @state = State.find(@post[:state]).name
    @comments = Comment.where post_id: @post.id
  end

  def update
    text_post = Post.find params[:id]
    text_post.update(post_all_params)
    redirect_to post_path(text_post.id)
  end

  def edit
    @post = Post.find params[:id]
    @states = State.all
  end

  def destroy
    if Post.find(params[:id]).destroy
      redirect_to posts_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def post_all_params
    params.require(:post).permit(:title, :text, :id, :state)
  end
end
