module Features
  def sign_in_as(user)
    visit sign_in_path

    fill_in 'Email or username', with: user.username
    fill_in 'Password', with: user.password

    click_on 'Sign in'
  end

  def create_user(options = {})
    options = { email: 'person@example.com',
                username: 'person',
                password: 'pass' }.merge(options)
    User.create! options
  end

  def sign_in
    user = create_user
    sign_in_as(user)

    user
  end
end
