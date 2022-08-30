class AddColumnsToSpirits < ActiveRecord::Migration[7.0]
  def change
    add_column :spirits, :vineux, :integer, default: 0
    add_column :spirits, :epicee, :integer, default: 0
    add_column :spirits, :boise, :integer, default: 0
    add_column :spirits, :animale, :integer, default: 0
    add_column :spirits, :noix, :integer, default: 0
    add_column :spirits, :sucre, :integer, default: 0
    add_column :spirits, :fruite, :integer, default: 0
    add_column :spirits, :floral, :integer, default: 0
    add_column :spirits, :herbace, :integer, default: 0
    add_column :spirits, :cereale, :integer, default: 0
    add_column :spirits, :empyreumatique, :integer, default: 0
    add_column :spirits, :tourbe, :integer, default: 0
  end
end
