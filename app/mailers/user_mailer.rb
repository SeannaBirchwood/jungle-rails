class UserMailer < ApplicationMailer
	default from: 'no-reply@jungle.com'

	def thankyou_email(user)
		@user = user
		@url = 'http://http://0.0.0.0:3000'
		mail(to: @user.email, subject: "Thank you for your order: #{@order_id}") 
	end
end
