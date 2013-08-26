class Dream < ActiveRecord::Base
  attr_accessible :content, :title, :privacy, :date, :nightmare, :lucid, :recurring, 
                  :fragmented, :hashtag, :emotion, :user_id, :imagesource
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 8000 }
  validates :title, presence: true, length: { maximum: 36 }
  validates :imagesource, presence: true, length: { maximum: 255 }
  validates_inclusion_of :privacy, :in => [true, false]

  # for sorting newest posts first
  default_scope order: 'dreams.created_at DESC'

end
