class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
    @customer = Customer.new
  end

  def create
    # 送られてきたメースアドレスでユーザーを検索する
    customer = Customer.find_by(email: session_params[:email])
    #ユーザーが見つかった場合には、送られてきたパスワードによる認証をauthenticateメソッドを使って行います
    if customer &.authenticate(session_params[:password])
      #認証に成功した場合に、セッションにcustomer_idを格納しています。
      session[:customer_id] = customer.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
