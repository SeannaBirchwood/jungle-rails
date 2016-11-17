class Comment < ActiveRecord::Base
	belongs_to :product

	validates :description, presence: true
	validates :rating, presence: true
	# validates :user_id, presence: true
	validates :product, presence: true
end
