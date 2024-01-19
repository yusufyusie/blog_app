class LikesController < ApplicationController
  layout 'standard'

  def create
    @post = Post.find(params[:post_id])

    if @post.liked_by?(current_user)
      @post.unliked_by(current_user)
      flash[:success] = 'Unliked!'
    else
      @post.liked_by(current_user)
      flash[:success] = 'Liked!'
    end

    redirect_to user_post_path(@post.user, @post)
  end
end
