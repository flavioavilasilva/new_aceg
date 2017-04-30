class RegistrationsUserController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.address = Address.new
    respond_with self.resource
  end

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, :name, :phone, [address_attributes: [:state, :city, :address]] ]
    params.require(resource_name).permit(allow)
  end
end
