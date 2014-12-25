class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :publisher
      t.string     :name, null: false
      t.string     :genre
      t.integer    :page_count

      t.timestamps
    end
  end
end
