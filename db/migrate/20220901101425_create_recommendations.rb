class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spirit, null: false, foreign_key: true
      t.string :percentage
      t.string :float

      t.timestamps
    end
  end
end
