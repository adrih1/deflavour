class RemoveColumnsFromSpirits < ActiveRecord::Migration[7.0]
  def change
    remove_column :spirits, :noix, :integer
    remove_column :spirits, :sucre, :integer
  end
end
