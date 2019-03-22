class SessionsController < ApplicationController
  def new
    @user ||= User.new
  end

  def create
    if current_user && !current_user.github_token
      current_user.update(github_token: request.env['omniauth.auth']['credentials']['token'])
      current_user.update(uid: request.env['omniauth.auth']['uid'])
      redirect_to dashboard_path
    else
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to dashboard_path
      else
        flash[:error] = "Looks like your email or password is invalid"
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
