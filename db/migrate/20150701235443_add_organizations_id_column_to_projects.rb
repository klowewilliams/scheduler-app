class AddOrganizationsIdColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :organizations_id, :integer

  end
end
