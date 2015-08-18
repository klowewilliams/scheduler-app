class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :location
      t.text :description
      t.integer :categories_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :slots
      t.string :status
      t.integer :images_id

      t.timestamps null: false
    end
  end
end
