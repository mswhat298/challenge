class AddTeacherToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teacher, :int
  end
end
