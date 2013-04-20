class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.boolean :act
      t.boolean :produce
      t.boolean :direct
      t.boolean :camera
      t.boolean :extra
      t.boolean :pa
      t.boolean :write
      t.boolean :sound
      t.boolean :wardrobe
      t.boolean :setdesign
      t.boolean :stunt
      t.boolean :marketing
      t.boolean :other
      t.string :what
      t.boolean :paid
      t.integer :salary
      t.string :credits

      t.timestamps
    end
  end
end
