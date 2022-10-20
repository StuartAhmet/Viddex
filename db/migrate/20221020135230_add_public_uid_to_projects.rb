class AddPublicUidToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :public_uid, :string
  end
end
