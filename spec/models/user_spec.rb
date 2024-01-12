require 'shoulda/matchers'
require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation specs
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:posts_counter).is_greater_than_or_equal_to(0) }

  # Method specs
  describe '#recent_posts' do
    it 'returns the 3 most recent posts for the user' do
      user = create(:user)
      create_list(:post, 5, user: user)

      recent_posts = user.recent_posts
      expect(recent_posts.length).to eq(3)
      expect(recent_posts).to eq(user.posts.order(created_at: :desc).limit(3))
    end
  end
end
