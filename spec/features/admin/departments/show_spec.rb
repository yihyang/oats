require 'rails_helper'

feature "Admin::Departments::Show", :admin do
  let!(:department) { create(:department) }

  background do
    create_and_login_admin
    visit "/admin/departments/#{department.id}"
  end

  scenario 'renders department content' do
    expect(page).to have_content('Finance')
  end
end
