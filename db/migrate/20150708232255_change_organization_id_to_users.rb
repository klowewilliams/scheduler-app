class ChangeOrganizationIdToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :organizations_id, :organization_id
  end
end
