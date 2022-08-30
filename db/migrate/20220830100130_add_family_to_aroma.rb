class AddFamilyToAroma < ActiveRecord::Migration[7.0]
  def change
    add_reference :aromas, :family, foreign_key: true
  end
end
