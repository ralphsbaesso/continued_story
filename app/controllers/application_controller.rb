class ApplicationController < ActionController::Base

  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def facade
    Facade.new current_user
  end
end
