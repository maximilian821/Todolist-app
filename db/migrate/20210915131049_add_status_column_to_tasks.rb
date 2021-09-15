class AddStatusColumnToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :status, :string, null: false, default: 'uncompleted'
  end
end
