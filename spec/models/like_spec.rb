require 'rails_helper'

RSpec.describe Like, type: :model do
    # Method specs
    describe '#update_post_likes_counter' do
    it 'updates the likes counter for the associated post' do
      post = create(:post, likes_counter: 0)
      like = create(:like, post: post)

      like.update_post_likes_counter
      post.reload

      expect(post.likes_counter).to eq(1)
    end
  end
end
