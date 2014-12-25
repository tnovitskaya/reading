class RemoveTimestampsFromPublishers < ActiveRecord::Migration
  def change
    remove_column :publishers, :created_at, :string
    remove_column :publishers, :updated_at, :string
  end
end
