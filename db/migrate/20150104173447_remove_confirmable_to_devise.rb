class RemoveConfirmableToDevise < ActiveRecord::Migration
  def self.up
    remove_column :users, :unconfirmed_email, :string
  end

  def self.down
    add_column :users, :unconfirmed_email, :string
  end
end