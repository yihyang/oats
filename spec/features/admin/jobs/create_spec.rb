require 'rails_helper'

feature "Admin::Jobs::Create", :admin do
  background do
    create_and_login_admin
    create(:department)
    create(:location)

    visit '/admin/jobs/new'
  end

  context 'when no values are provided' do
    scenario 'unable to create new job' do
      expect {
        click_button 'Create Job'
      }.not_to change{ Department.count }

      expect(page).to have_content(
        '7 errors prohibited this job from being saved'
      )
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content('Department must exist')
      expect(page).to have_content('Location must exist')
      expect(page).to have_content("Url can't be blank")
      expect(page).to have_content("Status can't be blank")
    end
  end

  context 'when values are provided' do
    scenario 'able to create new job' do
      fill_in 'job[name]', with: 'Valid Job'
      fill_in 'job[description]', with: 'A long description'
      fill_in 'job[url]', with: 'www.google.com'
      select 'active', from: 'job[status]'
      select 'Finance', from: 'job[department_id]'
      select 'New York', from: 'job[location_id]'

      expect {
        click_button 'Create Job'
      }.to change{Job.count}.by(1)

      expect(page).to have_content('Job was successfully created.')
      expect(page).to have_content('Valid Job')
      expect(page).to have_content('A long description')
      expect(page).to have_content('www.google.com')
      expect(page).to have_content('active')
      expect(page).to have_content('Finance')
      expect(page).to have_content('New York')
    end
  end
end
