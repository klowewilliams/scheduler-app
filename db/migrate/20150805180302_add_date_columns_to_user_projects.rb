class AddDateColumnsToUserProjects < ActiveRecord::Migration
  def change
    add_column :user_projects, :start_date, :datetime
    add_column :user_projects, :end_date, :datetime
  end
end
