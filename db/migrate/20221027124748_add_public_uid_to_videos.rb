class AddPublicUidToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :public_uid, :string
  end
end
