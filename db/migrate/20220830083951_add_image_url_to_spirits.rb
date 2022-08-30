class AddImageUrlToSpirits < ActiveRecord::Migration[7.0]
  def change
    add_column :spirits, :image_url, :string
  end
end
