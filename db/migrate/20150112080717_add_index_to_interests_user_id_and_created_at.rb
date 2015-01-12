class AddIndexToInterestsUserIdAndCreatedAt < ActiveRecord::Migration
  def change
    add_index :interests, [:user_id, :created_at]
  end
end
