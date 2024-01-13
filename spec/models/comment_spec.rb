require 'shoulda/matchers'
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    context 'when user and post are not associated' do
      it 'should not be saved' do
        comment = Comment.new
        result = comment.save
        expect(result).to be_falsey
        expect(comment.errors.messages.keys).to include(:user, :post)
      end
    end
  end

  describe 'Methods' do
    describe '#update_post_comments_counter' do
      it 'increases the posts comments_counter by 1' do
        post = Post.new(comments_counter: 0)
        post.save
        comment = Comment.new(post:)
        comment.save

        starting_comments_counter = post.comments_counter
        comment.update_post_comments_counter
        ending_comments_counter = post.comments_counter
        expect(ending_comments_counter - starting_comments_counter).to eq(0)
      end
    end
  end
end
