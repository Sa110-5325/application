class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_id
      t.integer :genre_id
      t.text :info
      t.integer :price
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
