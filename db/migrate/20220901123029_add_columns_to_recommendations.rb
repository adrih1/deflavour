class AddColumnsToRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :recommendations, :percentages, :float
  end
end
