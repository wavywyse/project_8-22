class AddLatToEvent < ActiveRecord::Migration
  def change
    add_column :events, :lat, :decimal
  end
end
