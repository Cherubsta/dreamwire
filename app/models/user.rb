class User < ActiveRecord::Base
  attr_accessible :name, :email, :username, :password, :password_confirmation, :avatar, 
                  :password_reset_token, :password_reset_sent_at
  has_secure_password
  has_many :dreams, dependent: :destroy #destroys user posts when user is destroyed
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "60x60#" }, 
                    :default_url => "http://robohash.org/<% SecureRandom.base64.delete('/+=')[0, 1] %>?size=60x60"
                    # http://s3.amazonaws.com/DW-Assets/missing.png
  before_save { |user| user.email = user.email.downcase }
  before_save { |user| user.username = user.username.downcase }

  before_save :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :password, length: { minimum: 6 }, on: :create
  #on create, because was causing erros on pw_reset
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, on: :create, on: :update 

  def send_password_reset
    create_password_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def create_password_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end