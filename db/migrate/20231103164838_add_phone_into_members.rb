class AddPhoneIntoMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_members, :phone, :string, limit: 10 
  end
end
