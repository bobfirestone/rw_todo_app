class Note < ActiveRecord::Base
  attr_accessible :note
  belongs_to :todo
  validates_presence_of :note
end
