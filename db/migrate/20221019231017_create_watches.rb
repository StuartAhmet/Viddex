class CreateWatches < ActiveRecord::Migration[7.0]
  def change
    create_table :watches do |t|
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
