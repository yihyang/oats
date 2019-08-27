require 'rails_helper'

describe "Api::V1::Jobs::Index" do
  let!(:jobs) { create_list(:job, 2, :active) }
  let(:expected_result) { jobs.to_json }

  it 'render jobs in JSON format' do
    get '/api/v1/jobs'

    expect(response.body).to eq(expected_result)
  end
end




# [{\"id\":45,\"status\":\"active\",\"name\":\"Mechanical Engineer\",\"description\":null,\"url\":\"www.google.com\",\"department_id\":147,\"location_id\":176,\"created_at\":\"2019-08-27T15:47:33.642Z\",\"updated_at\":\"2019-08-27T15:47:33.642Z\"},{\"id\":46,\"status\":\"active\",\"name\":\"Mechanical Engineer\",\"description\":null,\"url\":\"www.google.com\",\"department_id\":147,\"location_id\":176,\"created_at\":\"2019-08-27T15:47:33.650Z\",\"updated_at\":\"2019-08-27T15:47:33.650Z\"}]
