class ApplicationController < ActionController::Base
  helper_method :current_customer
  #全てのアクションを実行する前に、login_requiredメソッドを実行
  before_action :login_required

  private

  def current_customer
    @current_customer ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]
  end
  
  def login_required
    #ユーザーがログインしていない限り、ログイン画面にリダイレクト
    redirect_to login_path unless current_customer
  end
end
