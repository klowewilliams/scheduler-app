class AddOrgIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :organizations_id, :integer
  end
end
