class RemoveColumnsFromRecommandations < ActiveRecord::Migration[7.0]
  def change
    remove_column :recommendations, :percentage, :string
    remove_column :recommendations, :float, :string
  end
end
