require 'rails_helper'

feature "Admin::Departments::Show", :admin do
  let!(:department) { create(:department) }

  background do
    create_and_login_admin
    visit "/admin/departments/#{department.id}/edit"
  end

  context 'when blank values are provided' do
    scenario 'unable to update new department' do
      fill_in 'department[name]', with: ''
      click_button 'Update Department'

      expect(department.reload.name).to eq('Finance')
      expect(page).to have_content(
        '1 error prohibited this department from being saved'
      )
      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'when values are provided' do
    scenario 'able to create new department' do
      fill_in 'department[name]', with: 'New Department'
      click_button 'Update Department'

      expect(department.reload.name).to eq('New Department')
      expect(page).to have_content('Department was successfully updated.')
      expect(page).to have_content('New Department')
    end
  end
end
