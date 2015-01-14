class ReturnTimestampsToBooks < ActiveRecord::Migration
  def change
    add_timestamps(:books)
  end
end
