class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.integer :member_id
      t.integer :group_id

      t.timestamps
    end
  end
end
