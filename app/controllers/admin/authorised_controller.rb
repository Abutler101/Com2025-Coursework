#A template class to  make access controled admin pages DRY
#Makes sure user is logged in and that they are indeed an admin
class Admin::AuthorisedController < ApplicationController
  before_action :req_login
  before_action :req_admin
end