class AddStandardToIdentities < ActiveRecord::Migration[6.0]
  def change
    add_column :identities, :standard, :string
  end
end
