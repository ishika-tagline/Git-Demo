class Book < ApplicationRecord
  self.primary_key = 'isbn'
  has_many :chapters, primary_key: 'isbn', foreign_key: 'book_isbn'
end
