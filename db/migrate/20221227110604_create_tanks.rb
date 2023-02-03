class CreateTanks < ActiveRecord::Migration[7.0]
  def change
    create_table :tanks do |t|
      t.integer :tank_no
      t.timestamps
    end
  end
end
