class RemoveProspectCompanyFromVideos < ActiveRecord::Migration[7.0]
    def change
      remove_column :videos, :prospect_company, :string
    end
end
