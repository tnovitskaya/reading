class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.text       :review
      t.datetime   :start_reading
      t.datetime   :finish_reading

      t.timestamps
    end
  end
end
