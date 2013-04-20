class AddIndexToMembersUsername < ActiveRecord::Migration
  def change
    add_index :members, :username, :unique=>true
    add_index :members, :act
    add_index :members, :produce
    add_index :members, :direct
    add_index :members, :camera
    add_index :members, :extra
    add_index :members, :pa
    add_index :members, :write
    add_index :members, :sound
    add_index :members, :wardrobe
    add_index :members, :setdesign
    add_index :members, :stunt
    add_index :members, :marketing
    add_index :members, :other
    add_index :members, :paid
    add_index :members, :email, :unique=>true
  end
end
