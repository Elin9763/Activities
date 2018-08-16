class AddToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :items_count, :integer, :default => 0, :null => false
    add_column :users, :items_completed_count, :integer, :default => 0, :null => false

      User.reset_column_information

      User.all.each do |u|
        User.update_counters u.id, :items_count => u.items.length
    end
  end
end
