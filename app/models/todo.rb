class Todo < ActiveRecord::Base
  attr_accessible :title, :description, :priority, :status

  has_many :notes
  validates_presence_of :title

  default_scope order("priority DESC")
end
