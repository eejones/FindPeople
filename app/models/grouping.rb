class Grouping < ActiveRecord::Base
  attr_accessible :group_id, :member_id
  belongs_to :member  
  belongs_to :group
end
