require 'rails_helper'

describe "Api::V1::Jobs::GroupByLocationAndDepartment" do
  let!(:jobs) { create_list(:job, 2, :active) }
  let(:expected_result) { result(jobs) }

  it 'render jobs in JSON format' do
    get '/api/v1/jobs/group-by-locations-and-departments'

    expect(response.body).to eq(expected_result)
  end


  private

  def result(jobs)
    "{\"New York\":{\"Finance\":[{\"id\":#{jobs.first.id},\"status\":\"active\",\"name\":\"Mechanical Engineer\",\"description\":null,\"url\":\"www.google.com\",\"department_id\":#{jobs.first.department_id},\"location_id\":#{jobs.first.location_id},\"created_at\":#{jobs.first.created_at.to_json},\"updated_at\":#{jobs.first.created_at.to_json}},{\"id\":#{jobs.last.id},\"status\":\"active\",\"name\":\"Mechanical Engineer\",\"description\":null,\"url\":\"www.google.com\",\"department_id\":#{jobs.last.department_id},\"location_id\":#{jobs.last.location_id},\"created_at\":#{jobs.last.created_at.to_json},\"updated_at\":#{jobs.last.updated_at.to_json}}]}}"
  end
end
