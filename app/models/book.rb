class Book < ActiveRecord::Base

  belongs_to :publisher
  has_many   :interests
  has_many   :users, through: :interests
  has_many   :book_and_author_links
  has_many   :authors, through: :book_and_author_links
  
end
