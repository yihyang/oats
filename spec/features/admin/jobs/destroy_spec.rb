require 'rails_helper'

feature "Admin::Jobs::Destroy", :admin, :js do
  let!(:job) { create(:job) }

  background do
    create_and_login_admin
    visit '/admin/jobs/'
  end

  scenario 'able to destory job record' do
    expect(Job.count).to eq(1)

    page.accept_confirm do
      click_link 'Destroy'
    end

    expect(page).to have_content('Job was successfully destroyed.')
    expect(page).not_to have_content('Finance')
  end
end
