class RemoveReviewDescriptionFromProducts < ActiveRecord::Migration
  def change
  	review_description :text
  end
end
