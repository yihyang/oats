class Job < ApplicationRecord
  belongs_to :department
  belongs_to :location

  enum status: { draft: 0, active: 1, archived: 2}
end
