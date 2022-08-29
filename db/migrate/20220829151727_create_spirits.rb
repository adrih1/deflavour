class CreateSpirits < ActiveRecord::Migration[7.0]
  def change
    create_table :spirits do |t|
      t.string :name
      t.string :category
      t.float :price
      t.string :producer
      t.text :description
      t.string :color
      t.string :country
      t.float :degrees
      t.boolean :bio

      t.timestamps
    end
  end
end
