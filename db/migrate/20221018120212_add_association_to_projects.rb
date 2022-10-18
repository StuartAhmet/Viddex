class AddAssociationToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :projectable, polymorphic: true

  end
end
