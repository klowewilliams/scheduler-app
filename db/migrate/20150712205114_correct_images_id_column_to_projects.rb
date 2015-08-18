class CorrectImagesIdColumnToProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :images_id, :image_id
  end
end
