require 'rails_helper'

feature "Admin::Locations::Create", :admin do
  background do
    create_and_login_admin
    visit '/admin/locations/new'
  end

  context 'when no values are provided' do
    scenario 'unable to create new location' do
      expect {
        click_button 'Create Location'
      }.not_to change{ Location.count }
      expect(page).to have_content(
        '1 error prohibited this location from being saved'
      )
      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'when values are provided' do
    scenario 'able to create new location' do
      fill_in 'location[name]', with: 'Valid Location'

      expect {
        click_button 'Create Location'
      }.to change{Location.count}.by(1)

      expect(page).to have_content('Location was successfully created.')
      expect(page).to have_content('Valid Location')
    end
  end
end
