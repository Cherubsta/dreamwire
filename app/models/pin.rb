class Pin < ActiveRecord::Base
  attr_accessible :content, :title, :privacy, :date, :nightmare, :lucid, :recurring, 
                  :fragmented, :hashtag, :user_id
  belongs_to :user
  
  #validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 8000 }

  validates_inclusion_of :privacy, :in => [true, false]

  # for sorting newest posts first
  default_scope order: 'pins.created_at DESC'

end
