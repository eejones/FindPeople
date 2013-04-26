class AddProfilevidColumnToMembers < ActiveRecord::Migration
  def change
    add_column :members, :profilevid, :string
  end
end
