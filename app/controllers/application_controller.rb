class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender # if you need render .jbuilder
  include ActionView::Layouts # if you need layout for .jbuilder
  before_action :check_admin

  def check_admin
    if current_user && !current_user.admin?
      sign_out current_user
      flash[:error] = "You can't :D"\

    end
  end

  def authorize?
    if current_user
      request.headers['X-User-Token'] == current_user.authentication_token
    else
      false
    end
  end
end
