require 'rails_helper'

feature 'User creates a text shout' do
  scenario 'successfully' do
    sign_in

    create_text_shout('shout body')

    expect(page).to have_text 'Shouted successfully!'
  end
end

feature 'Dashboard displays Text shouts' do
  scenario 'successfully' do
    sign_in

    create_text_shout('shout body')

    expect(page).to have_text 'shout body'
  end
end
