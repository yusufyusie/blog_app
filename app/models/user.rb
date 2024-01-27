class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

 # Validations
 validates :name, presence: true
 validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

 def recent_posts(limit = 3)
   posts.order(created_at: :desc).limit(limit)
 end
end
