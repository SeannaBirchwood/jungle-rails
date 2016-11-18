class UserMailer < ApplicationMailer
	default from: 'no-reply@jungle.com'

	def thankyou_email(order)
		byebug
		@line_items = order.line_items
		@url = 'http://http://0.0.0.0:3000'
		mail(to: order.email, subject: "Thank you for your order: #{order.id}") 
	end
end