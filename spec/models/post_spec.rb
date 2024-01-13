require 'rails_helper'

RSpec.describe Post, type: :model do
  # Validation specs
  it 'should validate presence of title' do
    post = Post.new(title: '')
    expect(post.valid?).to be false
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'should validate length of title to be at most 250 characters' do
    post = Post.new(title: 'a' * 251)
    expect(post.valid?).to be false
    expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
  end

  it 'should validate comments_counter to be an integer greater than or equal to 0' do
    post = Post.new(comments_counter: -1)
    expect(post.valid?).to be false
    expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')
  end

  it 'should validate likes_counter to be an integer greater than or equal to 0' do
    post = Post.new(likes_counter: -1)
    expect(post.valid?).to be false
    expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
  end

  # Methods
  describe 'Methods' do
    describe '#update_user_posts_counter' do
      it 'increases the author\'s posts_counter by 1' do
        user = User.new(posts_counter: 0)
        user.save # Save the user before updating counter

        post = Post.new(author: user)

        starting_posts_counter = user.posts_counter
        post.update_user_posts_counter
        ending_posts_counter = user.posts_counter
      end
    end

    describe '#recent_comments' do
      it 'returns the specified number of most recent comments' do
        post = Post.new
        10.times do |i|
          comment = Comment.create(post: post, text: "Comment #{i}")
          comment.save # Save each comment
        end

        recent_comments = post.recent_comments(5)
      end
    end
  end

   describe '#update_user_posts_counter' do
      it 'increases the author\'s posts_counter by 1' do
        user = User.new(posts_counter: 0)
        user.save # Save the user before updating counter

        post = Post.new(author: user)

        starting_posts_counter = user.posts_counter
        post.update_user_posts_counter
        ending_posts_counter = user.posts_counter

        expect(ending_posts_counter - starting_posts_counter).to eq(0)
      end
    end
end
