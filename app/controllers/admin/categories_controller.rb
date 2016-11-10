class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(permit_params)

    if @category.save
      redirect_to [:admin, :category], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def permit_params
    params.require(:category).permit(
      :name
    )
  end

end