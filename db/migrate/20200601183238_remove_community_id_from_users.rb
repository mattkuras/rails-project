class RemoveCommunityIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :community_id, :integer
  end
end
