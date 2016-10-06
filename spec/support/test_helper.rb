module TestHelper

  def login
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'
    user
  end

end
