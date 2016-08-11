class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts, id: :uuid do |t|
      t.string :name
      t.string :ip
      t.string :os
      t.string :num_cpu
      t.string :memory
      t.string :disk
      t.string :pool
      t.uuid :cluster_id

      t.timestamps
    end
  end
end
