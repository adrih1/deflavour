class AddColumnsToAlcoolProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :alcool_profiles, :clef, :string
    add_column :alcool_profiles, :family, :string
    add_column :alcool_profiles, :accroche, :string
    add_column :alcool_profiles, :stars, :string
    add_column :alcool_profiles, :photo_one_url, :string
    add_column :alcool_profiles, :photo_two_url, :string
  end
end
