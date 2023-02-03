class Chapter < ApplicationRecord
  belongs_to :book, foreign_key: 'book_isbn', optional: true
end
