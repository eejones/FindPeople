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

  scope :actors,      -> { where( :act => true )}
  scope :producers,    -> { where( :produce => true )}
  scope :directors,     -> { where( :direct => true )}
  scope :extras,   -> { where( :extra => true )}
  scope :pas,  -> { where( :pa => true )}
  scope :writers,   -> { where( :write => true )}
  scope :sound,   -> { where(:sound=>true)}
  scope :wardrobe,  -> { where(:wardrobe=>true)}
  scope :setdesign,   -> { where(:setdesign=>true)}
  scope :stunt,   -> { where(:stunt=>true)}
  scope :marketing,  -> { where(:marketing=>true)}
  scope :paid,   -> { where(:paid=>true)}

FILTERS = [
  {:scope => "act",      :label => "Actors"},
  {:scope => "produce",    :label => "Producers"},
  {:scope => "direct",     :label => "Directors"},
  {:scope => "extra",   :label => "Extras"},
  {:scope => "pa",  :label => "PAs"},
  {:scope => "write",   :label => "Writers"},
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
