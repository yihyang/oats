require 'rails_helper'

feature "Admin::Departments::Create", :feature, :admin, :js do
  background do
    create_and_login_admin
    visit '/admin/departments/new'
  end

  context 'when no values are provided' do
    scenario 'unable to create new department' do
      expect {
        click_button 'Create Department'
      }.not_to change{ Department.count }
      expect(page).to have_content(
        '1 error prohibited this department from being saved'
      )
      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'when values are provided' do
    scenario 'able to create new department' do
      fill_in 'department[name]', with: 'Valid Department'

      expect {
        click_button 'Create Department'
      }.to change{Department.count}.by(1)
      expect(page).to have_content('Department was successfully created.')
      expect(page).to have_content('Valid Department')
    end
  end
end
