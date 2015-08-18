class CorrectOrgIdColumnToProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :organizations_id, :organization_id
  end
end
