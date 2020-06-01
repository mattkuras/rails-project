class CreateIdentityType < ActiveRecord::Migration[6.0]
  def change
    create_table :identity_types do |t|
      t.string :name
      t.integer :community_id
    end
  end
end
