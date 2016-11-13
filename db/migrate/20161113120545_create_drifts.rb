class CreateDrifts < ActiveRecord::Migration
  def change
    create_table :drifts do |t|
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
