class RemoveElements < ActiveRecord::Migration[7.0]
  def change
    remove_column :videos, :background_id
    remove_column :projects, :projectable_type
    remove_column :projects, :projectable_id

  end
end
