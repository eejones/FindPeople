class AddMythemetoMembers < ActiveRecord::Migration
  def change
    add_column :members, :theme, :string
  end
end
