class AddLocationsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :address, :string
    add_column :members, :latitude, :float
    add_column :members, :longitude, :float
  end
end
