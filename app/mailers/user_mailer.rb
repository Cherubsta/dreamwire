class UserMailer < ActionMailer::Base
  default :from => '"dreamwire" <support@dreamwire.co>'
  
  def registration_confirmation(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to dreamwire!")
  end
end