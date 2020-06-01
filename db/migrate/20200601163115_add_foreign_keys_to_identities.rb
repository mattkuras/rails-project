class AddForeignKeysToIdentities < ActiveRecord::Migration[6.0]
  def change
    add_column :identities, :user_id, :integer
    add_column :identities, :community_id, :integer
  end
end
