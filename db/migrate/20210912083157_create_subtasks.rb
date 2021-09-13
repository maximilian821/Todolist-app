class CreateSubtasks < ActiveRecord::Migration[6.1]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.text :body
      t.belongs_to :task, index: true

      t.timestamps
    end
  end
end
