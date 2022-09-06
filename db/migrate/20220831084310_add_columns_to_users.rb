class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vineux, :float, default: 0
    add_column :users, :epicee, :float, default: 0
    add_column :users, :boise, :float, default: 0
    add_column :users, :animale, :float, default: 0
    add_column :users, :noix, :float, default: 0
    add_column :users, :sucre, :float, default: 0
    add_column :users, :fruite, :float, default: 0
    add_column :users, :floral, :float, default: 0
    add_column :users, :herbace, :float, default: 0
    add_column :users, :cereale, :float, default: 0
    add_column :users, :empyreumatique, :float, default: 0
    add_column :users, :tourbe, :float, default: 0
  end
end
