class AddNameToCommunitities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :name, :string
  end
end
