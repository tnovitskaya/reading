class Book < ActiveRecord::Base

  belongs_to :publisher
  has_many   :interests, dependent: :destroy
  has_many   :users, through: :interests
  has_many   :book_and_author_links, dependent: :destroy
  has_many   :authors, through: :book_and_author_links

  def author_short
    author = self.authors.first
    "#{author.first_name.first}. #{author.last_name}"
  end

end
