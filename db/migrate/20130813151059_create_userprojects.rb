class CreateUserprojects < ActiveRecord::Migration
  def change
    create_table :userprojects do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :teacher

      t.timestamps
    end
  end
end
