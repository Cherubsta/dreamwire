class Post < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 8000 }

  # for sorting newest posts first
  default_scope order: 'posts.created_at DESC'
end
