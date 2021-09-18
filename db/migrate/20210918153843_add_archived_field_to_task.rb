class AddArchivedFieldToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :archived, :boolean, null: false, default: false
  end
end
