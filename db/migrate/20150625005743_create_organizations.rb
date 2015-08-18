class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :company_name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :website
      t.text :mission
      t.integer :company_size
      t.string :logo

      t.timestamps null: false
    end
  end
end
