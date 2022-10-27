class AddPublicUidToBackgrounds < ActiveRecord::Migration[7.0]
  def change
    add_column :backgrounds, :public_uid, :string
  end
end
