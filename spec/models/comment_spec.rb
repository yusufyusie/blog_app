require 'shoulda/matchers'
require 'rails_helper'

RSpec.describe Comment, type: :model do
 # Method specs
 describe '#update_post_comments_counter' do
 it 'updates the comments counter for the associated post' do
   post = create(:post, comments_counter: 0)
   comment = create(:comment, post: post)

   comment.update_post_comments_counter
   post.reload

   expect(post.comments_counter).to eq(1)
 end
end
end
