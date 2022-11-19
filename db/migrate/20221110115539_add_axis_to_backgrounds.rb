class AddAxisToBackgrounds < ActiveRecord::Migration[7.0]
  def change
    add_column :backgrounds, :x_axis, :integer, default: 350
    add_column :backgrounds, :y_axis, :integer, default: 250
    add_column :backgrounds, :width, :integer, default: 350
    add_column :backgrounds, :angle, :integer, default: 0
  end
end
