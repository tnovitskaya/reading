class RemoveTimestampsFromAuthor < ActiveRecord::Migration
  def change
    remove_column :authors, :created_at, :string
    remove_column :authors, :updated_at, :string
  end
end
