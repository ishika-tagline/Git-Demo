class CreateSubjects < ActiveRecord::Migration[7.0]
  
  def up
    puts "call up method"
    create_table :subjects do |t|
     
      t.string :name
      t.integer :position
      t.boolean :visible ,default: false
      t.timestamps
      t.references :page, null: false, foreign_key: true

    end


  end

  def down 
     drop_table :subjects 
  end
end
