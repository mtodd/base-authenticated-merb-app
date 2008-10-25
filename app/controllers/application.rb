class Application < Merb::Controller
  
  before :ensure_authenticated
  
  def current_user
    @_current_user ||= session.user
  end
  
  def current_account
    @_current_account ||= Account.first(:id => session[:account_id], :user_id => current_user.id)
  end
  
end
