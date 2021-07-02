class Admin::BaseController < ApplicationController
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: "You don't have rights to access this page" unless current_user&.admin?
  end
end
