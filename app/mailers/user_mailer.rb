class UserMailer < ActionMailer::Base
  default :from => '"dreamwire" <support@dreamwire.co>'
  
  def registration_confirmation(user)
  	@user = user #needed in order to have access to user variables
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to dreamwire!")
  end
end