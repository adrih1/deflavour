class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vineux, :integer, default: 0
    add_column :users, :epicee, :integer, default: 0
    add_column :users, :boise, :integer, default: 0
    add_column :users, :animale, :integer, default: 0
    add_column :users, :noix, :integer, default: 0
    add_column :users, :sucre, :integer, default: 0
    add_column :users, :fruite, :integer, default: 0
    add_column :users, :floral, :integer, default: 0
    add_column :users, :herbace, :integer, default: 0
    add_column :users, :cereale, :integer, default: 0
    add_column :users, :empyreumatique, :integer, default: 0
    add_column :users, :tourbe, :integer, default: 0
    add_column :users, :experiences, :text, array: true, default: []
  end
end
