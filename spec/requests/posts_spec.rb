require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /index' do
    before :each do
      get '/users/:user_id/posts'
    end

    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'returns http status 200' do
      expect(response.status).to eq(200)
    end

    it 'renders the right view file' do
      expect(response).to render_template(:index)
    end

    it 'renders the right placeholder' do
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    end
  end

  context 'GET /show' do
    let(:valid_attributes) { { 'name' => 'Tom', 'photo' => 'https://example.com/image.jpg' } }
    let(:valid_attribute) { { 'author' => user, 'title' => 'Title', 'text' => 'text' } }
    let(:user) { User.create! valid_attributes }
    let(:post) { Post.create! valid_attribute}
    before :each do
      get user_post_url(user, post)
    end

    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'returns http status 200' do
      expect(response.status).to eq(200)
    end

    it 'renders the right view file' do
      expect(response).to render_template(:show)
    end

    it 'renders the right placeholder' do
      expect(response.body).to include('<h1>Here is a selected post with for a given user</h1>')
    end
  end
end
