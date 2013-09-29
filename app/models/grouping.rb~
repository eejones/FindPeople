class Grouping < ActiveRecord::Base
  attr_accessible :group_id, :member_id
  belongs_to :member  
  belongs_to :group
  validates :member_id, presence: true
  validates :group_id, presence: true
end
