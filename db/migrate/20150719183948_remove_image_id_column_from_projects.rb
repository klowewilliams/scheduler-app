class RemoveImageIdColumnFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :image_id
  end
end
