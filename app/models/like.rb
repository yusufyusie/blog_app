class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_post_likes_counter

  validates :user, uniqueness: { scope: :post }

  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
