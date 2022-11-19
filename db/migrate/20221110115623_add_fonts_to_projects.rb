class AddFontsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :opacity, :integer, default: 70
    add_column :projects, :font, :string, default: "permanent marker"
    add_column :projects, :font_size, :integer, default: 38
  end
end
