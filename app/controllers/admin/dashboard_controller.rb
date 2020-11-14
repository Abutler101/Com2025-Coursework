class Admin::DashboardController < ApplicationController
  before_action :req_login
  before_action :req_admin
  def index
  end
end
