class Feature < ActiveRecord::Base
  has_many :errors

  translates :name
  #validates_presence_of :name
end
