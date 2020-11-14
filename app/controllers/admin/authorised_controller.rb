class Admin::AuthorisedController < ApplicationController
  before_action :req_login
  before_action :req_admin
end