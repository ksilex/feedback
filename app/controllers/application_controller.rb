class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_feedbacks_path
    else
      new_feedback_path
    end
  end
end
