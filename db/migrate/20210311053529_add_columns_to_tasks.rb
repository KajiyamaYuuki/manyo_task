class AddColumnsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :expired_at, :timestamp, default: -> { 'CURRENT_TIMESTAMP' }, null: false
  end
end
