class Resumevid < ActiveRecord::Base
  belongs_to :member
  attr_accessible :description, :name, :originvid, :rvideo
  VALID_ORIGINVID_REGEX = /(?:youtube\.com|youtu\.be)|(?:vimeo\.com)/
  validates :originvid, :presence=>   true, :format=> { with: VALID_ORIGINVID_REGEX }
  validates :name, :presence=> true, :length=> { :maximum=> 100 }
end
