class Author < ActiveRecord::Base

  has_many :book_and_author_links
  has_many books, through: :book_and_author_links

end
