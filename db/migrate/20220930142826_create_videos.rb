class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :prospect_first
      t.string :prospect_last
      t.string :prospect_company
      t.string :cadence_step

      t.timestamps
    end
  end
end
