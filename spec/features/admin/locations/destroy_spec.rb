require 'rails_helper'

feature "Admin::Locations::Destroy", :admin, :js do
  let!(:location_1) { create(:location) }

  background do
    create_and_login_admin
    visit '/admin/locations/'
  end

  scenario 'able to destory location record' do
    expect(Location.count).to eq(1)

    page.accept_confirm do
      click_link 'Destroy'
    end

    expect(page).to have_content('Location was successfully destroyed.')
    expect(page).not_to have_content('New York')
  end
end
