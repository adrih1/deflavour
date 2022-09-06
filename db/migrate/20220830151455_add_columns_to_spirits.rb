class AddColumnsToSpirits < ActiveRecord::Migration[7.0]
  def change
    add_column :spirits, :vineux, :float, default: 0
    add_column :spirits, :epicee, :float, default: 0
    add_column :spirits, :boise, :float, default: 0
    add_column :spirits, :animale, :float, default: 0
    add_column :spirits, :noix, :float, default: 0
    add_column :spirits, :sucre, :float, default: 0
    add_column :spirits, :fruite, :float, default: 0
    add_column :spirits, :floral, :float, default: 0
    add_column :spirits, :herbace, :float, default: 0
    add_column :spirits, :cereale, :float, default: 0
    add_column :spirits, :empyreumatique, :float, default: 0
    add_column :spirits, :tourbe, :float, default: 0
  end
end
