class Ongs::RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.address = Address.new
    respond_with self.resource
  end

  private

  def sign_up_params
    allow = [:cnpj, :email, :password, :password_confirmation, :name, :phone, :contact, :acept_pets, :site, :description, [address_attributes: [:postal_code, :address_number, :state, :city, :address]] ]
    params.require(resource_name).permit(allow)
  end
end
