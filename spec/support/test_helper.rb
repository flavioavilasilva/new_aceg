module TestHelper
  def login
    user = create(:user)
    visit new_user_session_path
    find('input#user_email').set user.email
    find('input#user_password').set user.password
    click_on 'Entrar'
    user
  end

  def ong_login
    ong = create(:ong)
    visit new_ong_session_path
    find('input#ong_email').set ong.email
    find('input#ong_password').set ong.password
    click_on 'Entrar'
    ong
  end

  def geolocation(lat, long)
    Geolocation.new(Geocoder.search("#{lat}, #{long}"))
  end
end
