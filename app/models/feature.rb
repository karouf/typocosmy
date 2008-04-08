class Feature < ActiveRecord::Base
  has_many :errors

  #validates_presence_of :name
end
