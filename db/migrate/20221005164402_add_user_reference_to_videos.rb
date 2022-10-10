class AddUserReferenceToVideos < ActiveRecord::Migration[7.0]
  def change
    add_reference :videos, :user, foreign_key: true
  end
end
