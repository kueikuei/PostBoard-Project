class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    # Comment.find(1).user
    @comments = @post.comments

    # User.find(16).comments
    # @comments[:user_name] = @post.user
    # binding.pry
    # @post = Post.find(params[:id])
    # Post.find(1).comments
    # @post.comments
    # @comment = Comment.find(@post.id)
  end

  def new
    @post = Post.new
  end

  def create

    #insert user_id into post_params hash
    @post_params=post_params
    @user = User.find(session[:user_id])
    @post_params[:user_id] = @user.id
    #binding.pry
    #@user = Post.find(params[:id]).user
    @post = Post.new(@post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
      end
    else
      respond_to do |format|
        format.html { render :edit, notice: 'Please update again.' }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end