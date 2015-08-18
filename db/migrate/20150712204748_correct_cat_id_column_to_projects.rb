class CorrectCatIdColumnToProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :categories_id, :category_id
  end
end
