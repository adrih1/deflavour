class AddRatingToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :rating, :float, default: 5
  end
end
