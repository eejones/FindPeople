class Resumevid < ActiveRecord::Base
  belongs_to :member
  attr_accessible :description, :name, :originvid, :rvideo
end
