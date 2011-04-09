class AuthController < ApplicationController

  def index
    if request.post?
      user = User.find_all_by_password_and_login(params[:password],params[:login])
      if user.empty?
        flash.now[:notice] = "Invalid user or password!"
      else
        session[:user_id] = user.id
        redirect_to(:controller => 'home')
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => :index)
  end

end
