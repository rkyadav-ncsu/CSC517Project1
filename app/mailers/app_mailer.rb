class AppMailer < ActionMailer::Base
  default from: "info@sukuya.com"
  def new_user_email(user)
    @user = user
    @url  = 'http://localhost:3000/'
    delivery_options = { user_name: 'info@sukuya.com',password: 'WhatDoIKnow5683$',domain:'sukuya.com',authentication:'plain',address: 'smtp.gmail.com', port:'587'}
    mail(to: @user.email,subject: "User account is successfully created",delivery_method_options: delivery_options, template_name:'new_user' )
  end
end
