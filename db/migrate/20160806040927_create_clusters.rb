class CreateClusters < ActiveRecord::Migration[5.0]
  def change
    create_table :clusters, id: :uuid do |t|
      t.string :name
      t.string :isp
      t.uuid :region_id

      t.timestamps
    end
  end
end
