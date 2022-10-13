class CreateJoinElements < ActiveRecord::Migration[7.0]
  def change
    create_table :join_elements do |t|
      t.references :video, null: false, foreign_key: true
      t.references :background, null: false, foreign_key: true

      t.timestamps
    end
  end
end
