class CreateSpiritAromas < ActiveRecord::Migration[7.0]
  def change
    create_table :spirit_aromas do |t|
      t.references :aroma, null: false, foreign_key: true
      t.references :spirit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
