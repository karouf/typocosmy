class Error < ActiveRecord::Base
  belongs_to :feature

  Resolutions = {
  :add => "add", 
  :remove =>"remove",
  :modify => "modify"
  }
  validates_inclusion_of :resolution, :in => Resolutions.values
  validates_presence_of :feature_id
end
