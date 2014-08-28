class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
   
  def set_locale
    I18n.locale = :ru
  end

  def after_sign_in_path_for(resource)
    users_path
  end

end
