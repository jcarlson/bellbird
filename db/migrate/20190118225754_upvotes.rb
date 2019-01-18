class Upvotes < ActiveRecord::Migration[5.2]
  def change
    add_column :alarms, :votes, :integer, default: 0, nil: false
  end
end
