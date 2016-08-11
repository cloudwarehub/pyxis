class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions, id: :uuid do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :description

      t.timestamps
    end
  end
end
