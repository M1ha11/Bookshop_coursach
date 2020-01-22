class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    email_with_name = %("#{@user.username}" <#{@user.email}>)
    mail(to: @user.email)#, subject "Welcome to Hell  Bugga")# do |format|
#      format.html { render 'welcome_email' }
 #     format.text { render plain: 'welcome_email' }
 #   end
  end
end
