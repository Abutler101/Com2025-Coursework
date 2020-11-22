# Error controller, used to overide default rails status code error pages
class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.html { render status: 404 }
    end
  end

  def forbidden
    respond_to do |format|
      format.html { render status: 403 }
    end
  end

  def internal_error
    respond_to do |format|
      format.html { render status: 500 }
    end
  end

  def unacceptable
    respond_to do |format|
      format.html { render status: 422 }
    end
  end
end
