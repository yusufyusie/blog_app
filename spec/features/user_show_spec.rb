require 'rails_helper'

RSpec.describe 'When I open user show page', type: :system do
  before :all do
    Like.delete_all
    Comment.delete_all
    Post.delete_all
    User.delete_all
    @first_user = User.create(name: 'Tom', photo: 'https://randomuser.me/api/portraits/men/41.jpg',
                              bio: 'Live Editor from Ethiopia.')
    @second_user = User.create(name: 'Lilly', photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                               bio: 'Teacher from Poland.')
    @third_user = User.create(name: 'Alan', photo: 'https://randomuser.me/api/portraits/thumb/men/75.jpg',
                              bio: 'Singer from Mexico.')
    Post.create(author: @first_user, title: 'Post1', text: 'Some text content')
    Post.create(author: @first_user, title: 'Post2', text: 'Some text content')
    Post.create(author: @first_user, title: 'Post3', text: 'Some text content')
    @latest_post = Post.create(author: @first_user, title: 'Post4', text: 'Some text content')
    Post.create(author: @second_user, title: 'Post1', text: 'Some text content')
    Post.create(author: @second_user, title: 'Post2', text: 'Some text content')
  end

  it "shows the user's profile picture" do
    visit users_path
    sleep(1)
    click_link(@first_user.name)
    sleep(1)
    expect(page).to have_css("img[src='#{@first_user.photo}']")
    visit users_path
    sleep(1)
    click_link(@second_user.name)
    sleep(1)
    expect(page).to have_css("img[src='#{@second_user.photo}']")
    visit users_path
    sleep(1)
    click_link(@third_user.name)
    sleep(1)
    expect(page).to have_css("img[src='#{@third_user.photo}']")
  end

  it "shows the user's username" do
    visit users_path
    sleep(1)
    click_link(@first_user.name)
    sleep(1)
    expect(page).to have_content('Tom')
    visit users_path
    sleep(1)
    click_link(@second_user.name)
    sleep(1)
    expect(page).to have_content('Lilly')
    visit users_path
    sleep(1)
    click_link(@third_user.name)
    sleep(1)
    expect(page).to have_content('Alan')
  end

  it 'shows the number of posts the user has written' do
    visit users_path
    sleep(1)
    click_link(@first_user.name)
    sleep(1)
    expect(page).to have_content('Number of posts: 4')
    visit users_path
    sleep(1)
    click_link(@second_user.name)
    sleep(1)
    expect(page).to have_content('Number of posts: 2')
    visit users_path
    sleep(1)
    click_link(@third_user.name)
    sleep(1)
    expect(page).to have_content('Number of posts: 0')
  end

  it "shows the user's bio" do
    visit users_path
    sleep(1)
    click_link(@first_user.name)
    sleep(1)
    expect(page).to have_content('Live Editor from Ethiopia.')
    visit users_path
    sleep(1)
    click_link(@second_user.name)
    sleep(1)
    expect(page).to have_content('Teacher from Poland.')
    visit users_path
    sleep(1)
    click_link(@third_user.name)
    sleep(1)
    expect(page).to have_content('Singer from Mexico.')
  end
end