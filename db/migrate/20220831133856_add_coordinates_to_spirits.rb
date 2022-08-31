class AddCoordinatesToSpirits < ActiveRecord::Migration[7.0]
  def change
    add_column :spirits, :latitude, :float
    add_column :spirits, :longitude, :float
  end
end
