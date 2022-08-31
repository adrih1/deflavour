class RemoveFielexperiencesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :vineux, :integer, default: 0
    remove_column :users, :epicee, :integer, default: 0
    remove_column :users, :boise, :integer, default: 0
    remove_column :users, :animale, :integer, default: 0
    remove_column :users, :noix, :integer, default: 0
    remove_column :users, :sucre, :integer, default: 0
    remove_column :users, :fruite, :integer, default: 0
    remove_column :users, :floral, :integer, default: 0
    remove_column :users, :herbace, :integer, default: 0
    remove_column :users, :cereale, :integer, default: 0
    remove_column :users, :empyreumatique, :integer, default: 0
    remove_column :users, :tourbe, :integer, default: 0
    remove_column :users, :experiences, :text, array: true, default: []
  end
end
