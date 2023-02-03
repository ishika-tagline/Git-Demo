class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: false, primary_key: :isbn do |t|
      t.primary_key :isbn, auto_increment: true
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
