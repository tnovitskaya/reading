class CreateBookAndAuthorLinks < ActiveRecord::Migration
  def change
    create_table :book_and_author_links do |t|
      t.belongs_to :book
      t.belongs_to :author
      t.string     :role

      t.timestamps
    end
  end
end