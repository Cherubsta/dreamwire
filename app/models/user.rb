class User < ActiveRecord::Base
  attr_accessible :name, :email, :username, :password, :password_confirmation, :avatar, 
                  :password_reset_token, :password_reset_sent_at
  has_secure_password
  has_many :dreams, dependent: :destroy #destroys user posts when user is destroyed
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "120x120#" }, 
                    :default_url => "http://s3.amazonaws.com/DW-Assets/Default-avatars/#{rand(7)}"
                    # http://s3.amazonaws.com/DW-Assets/missing.png
  before_save { |user| user.email = user.email.downcase }
  before_save { |user| user.username = user.username.downcase }

  before_save :create_remember_token
  #before_save :capitalize_name

  # validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /^[A-Za-z0-9]+(?:[_][A-Za-z0-9]+)*$/
  validates :email,    presence: true, format: { with: VALID_EMAIL_REGEX },    uniqueness: { case_sensitive: false }
  validates :username, presence: true, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, on: :create #on create, because was causing erros on pw_reset
  
  # for sorting newest posts first
  default_scope order: 'users.updated_at DESC'

  # def capitalize_name
  #   self.name = name.split.map(&:capitalize).join(' ')
  # end
  
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