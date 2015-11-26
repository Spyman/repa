class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: @post.id)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comment_path(@comment.id)
    end
    render action: :new
  end

  def edit

  end

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
    @parents = Comment.where(post_id: @post.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to(:back)
  end

  def create
    @post = Post.find(params[:post_id])

    @comment = create_comment params
    if @comment.save
      redirect_to(post_path(@post))
    else
      create_forms_new @post
    end

  end

  def comment_params
    params.require(:comment).permit(:post_id, :text)
  end

  def create_comment params
    if !params[:comment][:reply] == true
      parent = Comment.find params[:parent_id]
      @comment = parent.children.build(comment_params)
    else
      @comment = @post.comments.new(comment_params)
    end
  end

  def create_forms_new post
    @parents = Comment.where(post_id: post.id)
    render 'new'
  end
end
