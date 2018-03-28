class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
      else
        message  = "アカウントが無効です。 "
        message += "アカウント有効メールをご確認ください。"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      #エラーメッセージを作成する
      flash.now[:danger] = 'メールアドレス、又はパスワードが間違っています'
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
