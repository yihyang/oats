class Api::V1::JobsController < ApplicationController
  before_action :set_jobs

  def index
    render json: @jobs
  end

  def group_by_locations_and_departments
    render json: group_jobs_by_locations_and_department(@jobs)
  end

  private

  def set_jobs
    @jobs = Job.includes(:department, :location).active
  end

  # TODO: Extract the following into methods
  def group_jobs_by_locations_and_department(jobs)
    jobs_grouped_by_location = group_all_jobs_by_location(jobs)

    jobs_grouped_by_location.each do |location, jobs|
      jobs_grouped_by_location[location] = group_jobs_by_department(jobs)
    end

    jobs_grouped_by_location
  end

  def group_jobs_by_department(jobs)
    result = Hash.new([])
    jobs.each do |job|
      result[job.department.name] += [job]
    end
    result
  end

  def group_all_jobs_by_location(jobs)
    jobs.group_by { |job| job.location.name }
  end
end
