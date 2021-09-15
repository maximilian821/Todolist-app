class AddUserRefToTaskAndCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :user
    add_reference :categories, :user
  end
end
