class Pin < ActiveRecord::Base
  attr_accessible :content, :user_id

  #validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 8000 }

  # for sorting newest posts first
  default_scope order: 'pins.created_at DESC'
end
