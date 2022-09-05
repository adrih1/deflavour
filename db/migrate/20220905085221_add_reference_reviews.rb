class AddReferenceReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :spirit, index: true, foreign_key: true
    add_reference :reviews, :user, index: true, foreign_key: true
  end
end
