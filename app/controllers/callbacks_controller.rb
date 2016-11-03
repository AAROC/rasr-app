class CallbacksController < Devise::OmniauthCallbacksController
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    # def orcid
    #   omniauth = request.env["omniauth.auth"]
    #   session[:omniauth] = omniauth
    #   session[:params]   = params
    #   sign_in_and_redirect @user
    # end
end
