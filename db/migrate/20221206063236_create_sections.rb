class CreateSections < ActiveRecord::Migration[7.0]
  def up
    create_table :sections do |t|
      t.string :name
      t.integer :position
      t.boolean :visible, default: false
      t.string :content_type
      t.timestamps
    end
  end

  def down
    drop_table :sections
  end
end
