require 'rails_helper'
RSpec.describe User, type: :system do
  subject { User.new(name: 'Tom', posts_counter: 3, photo: 'https://randomuser.me/api/portraits/men/41.jpg', bio: 'Live Editor from Ethiopia.') }
  before { subject.save }
  describe 'index page' do
    it 'I can see the username of all other users.' do
      visit root_path(subject)
      page.has_content?(subject.name)
    end
    it 'I can see the profile picture for each user' do
      visit root_path(subject)
      page.has_content?(subject.photo)
    end
    it 'I can see the number of posts each user has written.' do
      visit root_path(subject)
      page.has_content?(subject.posts_counter)
    end
  end

  describe 'User show page' do
    it "I can see the user's profile picture." do
      visit user_path(subject.id)
      page.has_css?('.img-fluid')
    end
    it "I can see the user's username." do
      visit user_path(subject.id)
      page.has_content?(subject.name)
    end
    it 'I can see the number of posts the user has written.' do
      visit user_path(subject.id)
      page.has_content?(subject.posts_counter)
    end
    it "I can see the user's bio." do
      visit user_path(subject.id)
      page.has_content?(subject.bio)
    end

    it "I can see the user's first 3 posts." do
      visit user_path(subject.id)
      page.has_content?(subject.posts.first(3))
    end

    it "I can see a button that lets me view all of a user's posts." do
      visit user_path(subject.id)
      page.has_button?('See all posts')
    end
    it "When I click to see all posts, it redirects me to the user's post's index page." do
      visit user_path(subject.id)
      click_on 'See all posts'
      page.has_content?('All posts')
    end
  end
end
