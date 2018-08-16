class ChangeStatusItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :status, :integer, :default => 0
    add_column :items, :status, :boolean, :default => false
  end
end
