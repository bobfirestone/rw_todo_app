class AddStatusToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :status, :boolean, :default => true
  end
end
