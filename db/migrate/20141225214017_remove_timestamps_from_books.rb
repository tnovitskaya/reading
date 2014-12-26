class RemoveTimestampsFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :created_at, :string
    remove_column :books, :updated_at, :string
  end
end
