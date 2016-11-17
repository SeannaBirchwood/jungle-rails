class CreateAddRatingToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
    	t.integer :rating
    end
  end
end