class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|

      t.string :string
      t.string :permlink
      t.integer :position
      t.boolean :visible
      t.timestamps
      
    end
  end
end
