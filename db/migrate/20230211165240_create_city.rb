class CreateCity < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|

      t.string :name
      t.references :state, null: true
      t.timestamps
    end
  end
end
