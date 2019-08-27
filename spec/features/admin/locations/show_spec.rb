require 'rails_helper'

feature "Admin::Locations::Show", :admin do
  let!(:location) { create(:location) }

  background do
    create_and_login_admin
    visit "/admin/locations/#{location.id}"
  end

  scenario 'renders location content' do
    expect(page).to have_content('New York')
  end
end
