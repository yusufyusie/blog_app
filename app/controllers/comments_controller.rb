class CommentsController < ApplicationController
  load_and_authorize_resource
  layout 'standard'

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to user_post_path(id: @comment.post_id, user_id: @comment.user_id),
                  notice: 'Comment added successfully!'
    else
      flash.now[:error] = 'Error: Comment could not be created!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.post.decrement!(:comments_counter)
    @comment.destroy!
    flash[:success] = 'Comment was deleted successfully!'
    redirect_to user_post_path(id: @comment.post_id, user_id: @comment.user_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
