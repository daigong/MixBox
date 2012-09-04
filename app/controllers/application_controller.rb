class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_404
      redirect_to :status=>404
  end

end
