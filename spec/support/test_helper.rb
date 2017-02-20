module TestHelper
  def login
    user = create(:user)
    visit new_user_session_path
    find('input#user_email').set user.email
    find('input#user_password').set user.password
    click_on 'Entrar'
    user
  end

  def geolocation(lat, long)
    Geolocation.new(Geocoder.search("#{lat}, #{long}"))
  end
end
