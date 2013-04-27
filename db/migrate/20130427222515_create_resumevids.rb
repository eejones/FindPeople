class CreateResumevids < ActiveRecord::Migration
  def change
    create_table :resumevids do |t|
      t.string :rvideo
      t.string :originvid
      t.string :name
      t.text :description
      t.references :member

      t.timestamps
    end
    add_index :resumevids, :member_id
  end
end
