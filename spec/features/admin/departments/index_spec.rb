require 'rails_helper'

feature "Admin::Departments::Index", :admin do
  let!(:department_1) { create(:department) }
  let!(:department_2) { create(:department, name: 'Engineering')}

  background do
    create_and_login_admin
    visit "/admin/departments"
  end

  scenario 'renders department content' do
    expect(page).to have_content('Finance')
    expect(page).to have_content('Engineering')
  end
end
