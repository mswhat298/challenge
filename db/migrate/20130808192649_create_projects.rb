class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :materials
      t.string :image

      t.timestamps
    end
  end
end
