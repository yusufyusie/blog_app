class PostsController < ApplicationController
  layout 'standard'

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(id: :asc)
    @posts = Post.all.paginate(page: params[:page], per_page: 2)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
     if @post.save
          redirect_to user_post_path(@user, @post), notice: 'Post created successfully!'
        else
          render :new, status: :unprocessable_entity
        end
      end

      # ... other actions like edit, update, destroy
      private def set_user
        @user = User.find(params[:user_id])
      end

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :text)
      end
   end

