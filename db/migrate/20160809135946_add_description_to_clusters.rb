class AddDescriptionToClusters < ActiveRecord::Migration[5.0]
  def change
    add_column :clusters, :description, :string
  end
end
