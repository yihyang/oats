require 'rails_helper'

feature "Admin::Departments::Destroy", :admin, :js do
  let!(:department_1) { create(:department) }

  background do
    create_and_login_admin
    visit '/admin/departments/'
  end

  scenario 'able to destory department record' do
    expect(Department.count).to eq(1)

    page.accept_confirm do
      click_link 'Destroy'
    end

    expect(Department.count).to be_zero
    expect(page).to have_content('Department was successfully destroyed.')
    expect(page).not_to have_content('Finance')
  end
end
