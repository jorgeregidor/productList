class Admin::BaseController < ApplicationController
	layout "admin"

	before_action :admin_user?

	protected
	def admin_user?
		redirect_to new_user_session_url unless current_user && current_user.admin?
	end
end