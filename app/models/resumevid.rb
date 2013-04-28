class Resumevid < ActiveRecord::Base
  belongs_to :member
  attr_accessible :description, :name, :originvid, :rvideo
  VALID_ORIGINVID_REGEX = /(?:http:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/
  validates :originvid, :presence=>   true, :format=> { with: VALID_ORIGINVID_REGEX }
  validates :name, :presence=> true, :length=> { :maximum=> 100 }

end
