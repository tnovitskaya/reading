class BookAndAuthorLink < ActiveRecord::Base

  belongs_to :book
  belongs_to :author

  extend Enumerize
  enumerize :role, in: [:author, :compiler, :editor, :translator], default: :author

end