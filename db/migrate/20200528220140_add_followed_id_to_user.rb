class AddFollowedIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :followed_id, :integer
  end
end
