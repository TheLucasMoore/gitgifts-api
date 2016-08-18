class AddUserIdToRewards < ActiveRecord::Migration[5.0]
  def change
    add_column :rewards, :user_id, :integer
  end
end
