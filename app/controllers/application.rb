class Application < Merb::Controller
  
  def current_user
    @_current_user ||= User.first(:id => sessions[:user_id])
  end
  
  def current_account
    @_current_account ||= Account.first(:id => sessions[:account_id], :user_id => sessions[:user_id])
  end
  
end
