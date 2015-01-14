class Author < ActiveRecord::Base

  has_many :book_and_author_links, dependent: :destroy
  has_many :books, through: :book_and_author_links

  validates :first_name, presence: true
  validates :last_name, presence: true

  def short_name
    "#{self.first_name.first}. #{self.last_name}"
  end

end
