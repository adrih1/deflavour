class AddColumnToAlcoolProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :alcool_profiles, :vineux, :float, default: 0
    add_column :alcool_profiles, :epicee, :float, default: 0
    add_column :alcool_profiles, :boise, :float, default: 0
    add_column :alcool_profiles, :animale, :float, default: 0
    add_column :alcool_profiles, :noix, :float, default: 0
    add_column :alcool_profiles, :sucre, :float, default: 0
    add_column :alcool_profiles, :fruite, :float, default: 0
    add_column :alcool_profiles, :floral, :float, default: 0
    add_column :alcool_profiles, :herbace, :float, default: 0
    add_column :alcool_profiles, :cereale, :float, default: 0
    add_column :alcool_profiles, :empyreumatique, :float, default: 0
    add_column :alcool_profiles, :tourbe, :float, default: 0
  end
end
