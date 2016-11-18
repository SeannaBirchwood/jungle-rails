class CommentsController < ApplicationController

  before_filter :require_permission, only: :destroy


	def show
    @comment = Comment.find(params[:id])
    @products = @comment.products.order(created_at: :description)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.product_id = params[:product_id]
    @comment.user_id = current_user.id
    # after @review has been initialized, but before calling .save on it:
    @comment.save
    notice = @comment.valid? ? 'Comment submitted!' : 'Oops. Something went wrong.'
    redirect_to product_path(params[:product_id]), notice: notice
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to product_path(params[:product_id]), notice: "Comment was deleted."
  end

  def average_rating
    if self.comments.size > 0
      self.comments.average(;rating)
    else
      'undefined'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
    	:content,
      :rating
    )
  end

  def require_permission
    if current_user.id != Comment.find(params[:id]).user_id
      redirect_to product_path(params[:product_id]), notice: "Oops. You can't delete that."
    end
  end

end
