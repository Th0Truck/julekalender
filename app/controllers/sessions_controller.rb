class SessionsController < ApplicationController
  def new
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Velkommen #{user.name}!"
    else
      flash.now.alert = "Der opstod en fejl"
      render "new"
    end
  end
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Velkommen #{user.name}!"
    else
      flash.now.alert = "Der opstod en fejl"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Kom snart igen"
  end
end