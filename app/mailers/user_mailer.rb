class UserMailer < ActionMailer::Base
  default :from => '"dreamwire" <support@dreamwire.co>'
  
  def registration_confirmation(user)
  	@user = user #needed in order to have access to user variables
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to dreamwire").deliver!
  	mail(:to => '"dreamwire" <support@dreamwire.co>', 
  		   :subject => "New dreamwire Member",
  		   :body => "New member #{user.name} with email #{user.email} has just signed up!",
  		   :content_type => "text/html")
  end

  def password_reset(user)
	  @user = user
	  mail :to => user.email, :subject => "Password Reset"
	end

end