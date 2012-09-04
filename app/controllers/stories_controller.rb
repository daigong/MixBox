class StoriesController < ApplicationController
  def show
    @user = User.where(:login_name=> params[:login_name]).first;
    @story = @user.stories.where(:title=>params[:id]);
    #@story = Story.where(:title=>params[:id],:user=>@user).first
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end
end
