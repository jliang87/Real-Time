class SignupController < Devise::RegistrationsController

  def create
    super
    resource.teammable = ClioInOutStub::TEAMMABLE[params[:user][:team]].constantize.create!
    resource.save
  end

end 