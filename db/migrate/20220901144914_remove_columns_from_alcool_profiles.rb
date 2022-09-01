class RemoveColumnsFromAlcoolProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :alcool_profiles, :noix, :integer
    remove_column :alcool_profiles, :sucre, :integer
  end
end
