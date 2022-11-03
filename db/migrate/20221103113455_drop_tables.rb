class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :join_elements
    drop_table :reports
    drop_table :settings
    drop_table :terminals
    drop_table :watches
  end
end
