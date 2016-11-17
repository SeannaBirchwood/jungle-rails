class ProductsController < ApplicationController

  def index
    @product = Product.all.order(created_at: :desc)
  	
  end

  def show
    @product = Product.find params[:id]
    @comment = Comment.new
    @comments = @product.comments
  end

end
