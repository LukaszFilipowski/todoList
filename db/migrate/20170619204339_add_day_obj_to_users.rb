class AddDayObjToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dayObj, :integer
  end
end
