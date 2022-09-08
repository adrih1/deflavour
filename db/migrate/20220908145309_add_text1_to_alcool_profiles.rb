class AddText1ToAlcoolProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :alcool_profiles, :text1, :string
  end
end
