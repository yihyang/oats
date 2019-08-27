require 'rails_helper'

feature "Admin::Locations::Update", :admin do
  let!(:location) { create(:location) }

  background do
    create_and_login_admin
    visit "/admin/locations/#{location.id}/edit"
  end

  context 'when blank values are provided' do
    scenario 'unable to update new location' do
      fill_in 'location[name]', with: ''
      click_button 'Update Location'

      expect(location.reload.name).to eq('New York')
      expect(page).to have_content(
        '1 error prohibited this location from being saved'
      )
      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'when values are provided' do
    scenario 'able to create new location' do
      fill_in 'location[name]', with: 'New Location'
      click_button 'Update Location'

      expect(location.reload.name).to eq('New Location')
      expect(page).to have_content('Location was successfully updated.')
      expect(page).to have_content('New Location')
    end
  end
end
