class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.boolean :recording
      t.integer :band_id, null: false

      t.timestamps null: false
    end
  end
end
