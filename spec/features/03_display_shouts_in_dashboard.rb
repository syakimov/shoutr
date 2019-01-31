require 'rails_helper'

feature 'Dashboard displays shouts' do
  scenario 'successfully' do
    user = create_user
    user.shouts.create(body: 'shout body')

    sign_in_as(user)

    expect(page).to have_text 'shout body'
  end
end
