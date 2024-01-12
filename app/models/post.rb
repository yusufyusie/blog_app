class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :likes

  def update_user_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
