class AddElementsToBackgrounds < ActiveRecord::Migration[7.0]
  def change
    add_reference :backgrounds, :user, foreign_key: true
    add_column :backgrounds, :title, :string


  end
end
