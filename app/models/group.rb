class Group < ActiveRecord::Base
  has_many :groupings, :dependent => :destroy  
  has_many :members, :through => :groupings
  attr_accessible :description, :name
  validates :name, presence:   true,
                   uniqueness: { case_sensitive: false }

  def memberingroup?(current_member)
    self.members.exists?(current_member)
  end

  def group_names
    @group_names || groups.map(&:name).join(' ')
  end

  def join!(member)
    group=self
    self.groupings.create!(:member_id => member, :group_id => group)
  end

  def unjoin!(current_member)
    self.groupings.find_by_member_id(current_member.id).destroy!
  end



end
