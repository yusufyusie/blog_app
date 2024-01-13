require 'shoulda/matchers'
require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation specs

  it 'is not valid with blank name' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  # Method specs
  it 'is not valid when posts_counter is not an integer' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'is not valid when posts_counter is less than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
