require 'rails_helper'

RSpec.describe Post, type: :model do
 # Validation specs
 it { should validate_presence_of(:title) }
 it { should validate_length_of(:title).is_at_most(250) }
 it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0) }
 it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0) }

 # Method specs
 describe '#update_user_posts_counter' do
   it 'updates the posts counter for the associated user' do
     user = create(:user, posts_counter: 0)
     post = create(:post, user: user)

     post.update_user_posts_counter
     user.reload

     expect(user.posts_counter).to eq(1)
   end
 end

 describe '#recent_comments' do
   it 'returns the 5 most recent comments for the post' do
     post = create(:post)
     create_list(:comment, 10, post: post)

     recent_comments = post.recent_comments
     expect(recent_comments.length).to eq(5)
     expect(recent_comments).to eq(post.comments.order(created_at: :desc).limit(5))
   end
 end
end
