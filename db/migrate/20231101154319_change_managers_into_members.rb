class ChangeManagersIntoMembers < ActiveRecord::Migration[7.0]
  def change
    rename_table :admin_managers, :admin_members
  end
end
