class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        require_remember? ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "アカウントが有効化されていません\n有効化のため、送ったメールをもう一度確認してください"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "入力された情報でログインできません"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
    def require_remember?
      params[:session][:remember_me] == '1'
    end
end
