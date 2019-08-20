require 'rails_helper'

RSpec.describe "Admin::Jobs", type: :request do
  describe "GET /admin_jobs" do
    it "works! (now write some real specs)" do
      get admin_jobs_path
      expect(response).to have_http_status(200)
    end
  end
end
