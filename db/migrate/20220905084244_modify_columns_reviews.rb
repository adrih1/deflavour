class ModifyColumnsReviews < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :order, index: true, foreign_key: true
  end
end
