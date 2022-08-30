class CreateProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :producers do |t|
      t.string :name
      t.string :image_url
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
