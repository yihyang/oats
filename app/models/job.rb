class Job < ApplicationRecord
  belongs_to :department, dependent: :destroy
  belongs_to :location, dependent: :destroy

  enum status: { draft: 0, active: 1, archived: 2}

  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :status
  validates_presence_of :department_id
  validates_presence_of :location_id
end
