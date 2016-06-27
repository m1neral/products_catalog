class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.text :actions, array: true, default: []

      t.timestamps null: false
    end
  end
end
