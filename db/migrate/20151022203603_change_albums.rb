class ChangeAlbums < ActiveRecord::Migration
  def change
    change_column :albums, :recording, :string
  end
end
