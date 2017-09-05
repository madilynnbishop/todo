class RemoveDueFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :due, :datetime
  end
end
