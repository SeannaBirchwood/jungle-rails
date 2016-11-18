class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :comments

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def average_rating
  	average = comments.map(&:rating)
  	average.reduce(:+) / average.size.to_f
  end

end
