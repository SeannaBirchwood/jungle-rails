class Comment < ActiveRecord::Base
	belongs_to :product

	validates :content, presence: true
	validates :rating, presence: true
	#validates :user_id, presence: true
	validates :product, presence: true
end
