class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :name
      t.integer :page
      t.references :book_isbn, references: :books, null: true # by default it make book_isbn_id id
      t.timestamps
    end
    rename_column :chapters, :book_isbn_id, :book_isbn
    add_foreign_key :chapters, :books, column: 'book_isbn', primary_key: 'isbn'
  end
end
