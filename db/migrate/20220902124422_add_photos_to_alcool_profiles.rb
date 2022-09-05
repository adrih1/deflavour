class AddPhotosToAlcoolProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :alcool_profiles, :photo_one, :string
    add_column :alcool_profiles, :photo_two, :string
  end
end
