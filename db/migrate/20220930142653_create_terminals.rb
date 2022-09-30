class CreateTerminals < ActiveRecord::Migration[7.0]
  def change
    create_table :terminals do |t|

      t.timestamps
    end
  end
end
