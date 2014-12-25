class RemoveTimestampsFromBookAndAuthorLinks < ActiveRecord::Migration
  def change
    remove_column :book_and_author_links, :created_at, :string
    remove_column :book_and_author_links, :updated_at, :string
  end
end
