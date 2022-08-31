class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spirit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
