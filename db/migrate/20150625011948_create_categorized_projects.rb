class CreateCategorizedProjects < ActiveRecord::Migration
  def change
    create_table :categorized_projects do |t|
      t.integer :categories_id
      t.integer :projects_id

      t.timestamps null: false
    end
  end
end
