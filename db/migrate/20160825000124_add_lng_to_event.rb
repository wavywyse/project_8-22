class AddLngToEvent < ActiveRecord::Migration
  def change
    add_column :events, :lng, :decimal
  end
end
