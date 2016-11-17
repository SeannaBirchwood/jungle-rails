class CreateAddCommentToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
    	t.text :comment
    end
  end
end
