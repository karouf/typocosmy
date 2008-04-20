class Error < ActiveRecord::Base
  belongs_to :feature

  Resolutions = {
  :add => "add", 
  :remove =>"remove",
  :modify => "modify"
  }
  validates_inclusion_of :resolution, :in => Resolutions.values
  validates_presence_of :feature_id
  #validates_associated :feature
  validates_presence_of :location
  validates_format_of :email, :with => /\A()\Z|\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
