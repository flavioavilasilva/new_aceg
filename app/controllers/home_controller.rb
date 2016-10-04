class HomeController < ApplicationController
  def index
    @ongs = Ong.limit(5)
    @pets = Pet.all
  end
end
