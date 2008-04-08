class Error < ActiveRecord::Base
  belongs_to :feature

  Resolutions = {
  :add => "add", 
  :remove =>"remove",
  :modify => "modify"
  }
  validates_inclusion_of :resolution, :in => Resolutions.values
  validates_associated :feature
  validates_presence_of :lon
  validates_numericality_of :lon
  validates_presence_of :lat
  validates_numericality_of :lat
end
