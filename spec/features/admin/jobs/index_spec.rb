require 'rails_helper'

feature "Admin::Departments::Show", :admin do
  let!(:job) { create(:job) }

  background do
    create_and_login_admin
    visit "/admin/jobs/"
  end

  scenario 'renders job content' do
    expect(page).to have_content('Finance')
    expect(page).to have_content('Mechanical Engineer')
    expect(page).to have_content('New York')
  end
end
