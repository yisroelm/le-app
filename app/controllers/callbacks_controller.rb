class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @les = Le.from_omniauth(request.env["omniauth.auth"])
    signin_and_redirect @les
  end
end
