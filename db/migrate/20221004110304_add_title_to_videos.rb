class AddTitleToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :title, :string
    add_column :videos, :addressed, :text
    remove_column :videos, :prospect_first, :string
    remove_column :videos, :prospect_last, :string
    remove_column :videos, :prospect_company, :string


  end
end
