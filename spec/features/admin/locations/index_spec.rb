require 'rails_helper'

feature "Admin::Locations::Index", :admin do
  let!(:location_1) { create(:location) }
  let!(:location_2) { create(:location, name: 'New Jersey')}

  background do
    create_and_login_admin
    visit "/admin/locations"
  end

  scenario 'renders location content' do
    expect(page).to have_content('New York')
    expect(page).to have_content('New Jersey')
  end
end
