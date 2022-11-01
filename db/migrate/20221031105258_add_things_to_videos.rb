class AddThingsToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :rotation, :string
  end
end
