class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    if params[:id] != params[:id].downcase
       redirect_to request.path.downcase, :status=>301
       return
    end

    @user = User.where(:login_name=>params[:id]).first

    #For Test get Story Date
    @story = Story.all[0];

    render_404 if @user.nil?
  end

end
