class CommentsController < ApplicationController

	def show
    @comment = Comment.find(params[:id])
    @products = @comment.products.order(created_at: :description)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.product_id = params[:product_id]
    # @comment.user_id = current_user.id
    # after @review has been initialized, but before calling .save on it:
    @comment.save
    #@comment.rating = Rating.new
    #@comment.user = current_user

  	if @comment.valid?
      redirect_to product_path(params[:product_id]), notice: 'Comment submitted!'
    else
      redirect_to product_path(params[:product_id]), notice: 'Oops. Something went wrong.'
    end

  end

  private

  def comment_params
    params.require(:comment).permit(
    	:description,
      :rating
    )
  end

end
