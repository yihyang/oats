require 'rails_helper'

feature "Admin::Jobs::Update", :admin do
  let!(:job) { create(:job) }

  background do
    create_and_login_admin
    visit "/admin/jobs/#{job.id}/edit"
  end

  context 'when blank values are provided' do
    scenario 'unable to update new job' do
      fill_in 'job[name]', with: ''
      fill_in 'job[url]', with: ''
      click_button 'Update Job'

      expect(job.reload.name).to eq('Mechanical Engineer')
      expect(page).to have_content(
        '2 errors prohibited this job from being saved'
      )
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Url can't be blank")
    end
  end

  context 'when values are provided' do
    scenario 'able to create new job' do
      fill_in 'job[name]', with: 'New Job'
      fill_in 'job[url]', with: 'www.yahoo.com'
      click_button 'Update Job'

      expect(job.reload.name).to eq('New Job')
      expect(page).to have_content('Job was successfully updated.')
      expect(page).to have_content('New Job')
      expect(page).to have_content('www.yahoo.com')
    end
  end
end
