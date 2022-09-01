class AddColumnToAlcoolProfiles < ActiveRecord::Migration[7.0]
  def change
    def change
      add_column :alcool_profiles, :vineux, :integer, default: 0
      add_column :alcool_profiles, :epicee, :integer, default: 0
      add_column :alcool_profiles, :boise, :integer, default: 0
      add_column :alcool_profiles, :animale, :integer, default: 0
      add_column :alcool_profiles, :noix, :integer, default: 0
      add_column :alcool_profiles, :sucre, :integer, default: 0
      add_column :alcool_profiles, :fruite, :integer, default: 0
      add_column :alcool_profiles, :floral, :integer, default: 0
      add_column :alcool_profiles, :herbace, :integer, default: 0
      add_column :alcool_profiles, :cereale, :integer, default: 0
      add_column :alcool_profiles, :empyreumatique, :integer, default: 0
      add_column :alcool_profiles, :tourbe, :integer, default: 0
    end
  end
end
