class User < ActiveRecord::Base
  attr_accessible :name, :email, :username, :password, :password_confirmation, :avatar
  has_secure_password
  has_many :pins, dependent: :destroy #destroys user posts when user is destroyed
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "http://s3.amazonaws.com/DW-Assets/missing.png"

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
  