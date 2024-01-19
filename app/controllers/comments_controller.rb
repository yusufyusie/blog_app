class CommentsController < ApplicationController
  layout 'standard'

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@comment.post.user, @comment.post),
                  notice: 'Comment added successfully!'
    else
      flash.now[:error] = 'Error: Comment could not be created!'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end