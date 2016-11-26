class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # binding.pry
    @comment = Comment.new

  end

  def create

    #insert user_id into comment_params hash
    # @comment_params=comment_params
    # @user = User.find(session[:user_id])
    # @comment_params[:user_id] = @user.id
    #binding.pry
    #@user = comment.find(params[:id]).user
    @comment_params = comment_params
    @comment_params[:user_id] = User.find(session[:user_id]).id
    @comment = Comment.new(@comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post_id), notice: 'comment was successfully created.' }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to comments_path, notice: 'comment was successfully updated.' }
      end
    else
      respond_to do |format|
        format.html { render :edit, notice: 'Please update again.' }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_path, notice: 'comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  


  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:reply, :post_id)
  end

end