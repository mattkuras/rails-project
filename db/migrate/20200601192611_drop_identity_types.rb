class DropIdentityTypes < ActiveRecord::Migration[6.0]
  def change
    drop_table :identity_types
  end
end
