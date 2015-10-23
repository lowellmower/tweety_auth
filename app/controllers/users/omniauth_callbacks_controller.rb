class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      # if all information is avail from auth, signin and redirect
      flash.notice = "Signed in!"
      sign_in_and_redirect @user, :event => :authentication #throw if @user is not activated
    else
      # save what has come from auth in session and send to signup
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

end