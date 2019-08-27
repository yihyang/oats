module Admin
  module LoginHelper
    def create_and_login_admin
      create_admin_user
      login_admin_user
    end

    private

    def create_admin_user
      User.create(email: 'test@test.com', password: 'testtest')
    end

    def login_admin_user
      visit '/users/sign_in'

      fill_in 'user[email]', with: 'test@test.com'
      fill_in 'user[password]', with: 'testtest'
      find('input[type="submit"][value="Log in"]').click
    end
  end
end

RSpec.configure do |c|
  c.include Admin::LoginHelper, admin: true
end
