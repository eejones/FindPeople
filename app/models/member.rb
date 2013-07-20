class Member < ActiveRecord::Base
  attr_accessible :act, :camera, :credits, :direct, :extra, :marketing, :other, :pa, :paid, :password, :password_confirmation, :produce, :salary, :setdesign, :sound, :stunt, :username, :wardrobe, :what, :write, :email, :avatar, :profilevid, :address, :latitude, :longitude
  geocoded_by :address
  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "noface.jpeg"

  before_save { |member| member.email = email.downcase }
  before_save :create_remember_token
  validates :username, presence: true, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, :presence=> true, :length=> { :minimum=> 6 }
  validates :password_confirmation, :presence=> true

  scope :actors,      :conditions => { :act => true }
  scope :producers,    :conditions => { :produce => true }
  scope :directors,     :conditions => { :direct => true }
  scope :extras,   :conditions => { :extra => true }
  scope :pas,  :conditions => { :pa => true }
  scope :writers,   :conditions => { :write => true }
  scope :sound,   :conditions => {:sound=>true}
  scope :wardrobe,  :conditions => {:wardrobe=>true}
  scope :setdesign,   :conditions => {:setdesign=>true}
  scope :stunt,   :conditions => {:stunt=>true}
  scope :marketing,  :conditions => {:marketing=>true}
  scope :paid,   :conditions => {:paid=>true}

FILTERS = [
  {:scope => "all",         :label => "All"},
  {:scope => "actors",      :label => "Actors"},
  {:scope => "producers",    :label => "Producers"},
  {:scope => "directors",     :label => "Directors"},
  {:scope => "extras",   :label => "Extras"},
  {:scope => "pas",  :label => "PAs"},
  {:scope => "writers",   :label => "Writers"},
  {:scope => "sound",   :label => "Sound Engineers"},
  {:scope => "wardrobe",  :label => "Wardrobe"},
  {:scope => "setdesign",   :label => "Set Design"},
  {:scope => "stunt",   :label => "Stunt"},
  {:scope => "marketing",  :label => "Marketing"},
  {:scope => "paid",   :label => "Paid-only"}
]

  after_validation :geocode
  has_many :resumevids, :dependent => :destroy

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
