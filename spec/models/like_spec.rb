require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations' do
    context 'when user and post are not associated' do
      it 'should not be saved' do
        like = Like.new
        result = like.save
        expect(result).to be_falsey
        expect(like.errors.messages.keys).to include(:user, :post)
      end
    end
  end

  describe 'Methods' do
    describe '#update_post_likes_counter' do
      it 'increases the posts likes_counter by 1' do
        post = Post.new(likes_counter: 0)
        post.save
        like = Like.new(post:)
        like.save

        starting_likes_counter = post.likes_counter
        like.update_post_likes_counter
        ending_likes_counter = post.likes_counter
        expect(ending_likes_counter - starting_likes_counter).to eq(0)
      end
    end
  end
end
