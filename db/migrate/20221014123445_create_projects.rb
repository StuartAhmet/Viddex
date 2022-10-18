class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :prospect_first
      t.string :prospect_last
      t.string :prospect_company
      t.string :prospect_email
      t.text :message
      t.references :background, foreign_key: true
      t.references :video, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :include_meeting_link, :default => true
      t.references :projectable, polymorphic: true
      t.timestamps
    end
  end
end
