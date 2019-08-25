class Location < ApplicationRecord
  has_many :jobs

  validates_presence_of :name
end
