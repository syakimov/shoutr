require 'rails_helper'

feature 'User signs in with username successfully' do
  scenario 'successfully' do
    user = create_user(email: 'person@example.com')

    sign_in_as(user)

    expect(page).to have_text 'Signed in as: person@example.com'
    expect(page).to have_text 'Dashboard'
  end
end
