class AddBackgroundToVideos < ActiveRecord::Migration[7.0]
  def change
    add_reference :videos, :background, foreign_key: true

  end
end
