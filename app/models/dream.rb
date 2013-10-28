class Dream < ActiveRecord::Base
  attr_accessible :content, :title, :privacy, :date, :nightmare, :lucid, :recurring, 
                  :fragmented, :hashtag, :emotion, :user_id, :imagesource, :imageowner
  belongs_to :user
  
  before_save :capitalize_title
  before_validation :generate_slug

  validates :content, presence: true, length: { maximum: 8000 }
  validates :title, presence: true, length: { maximum: 24 }
  validates :imagesource, presence: { message: "Please search and choose an image" }, length: { maximum: 255 }
  validates_inclusion_of :privacy, :in => [true, false]
  validates :slug, uniqueness: true, presence: true, 
                    exclusion: {in: %w[signup signin signout home info privacy]}
  
  # for sorting newest posts first
  default_scope order: 'dreams.created_at DESC'

  def to_param
    slug # or "#{id}-#{name}".parameterize
  end

  def generate_slug # makes the url slug address bar freindly
    self.slug ||= loop do
      random_token = Digest::MD5.hexdigest(Time.zone.now.to_s + title)[0..9]+"-"+"#{title}".parameterize
      break random_token unless Dream.where(slug: random_token).exists?
    end
  end

	protected
	  def capitalize_title
	    self.title = title.split.map(&:capitalize).join(' ')
	  end
end
