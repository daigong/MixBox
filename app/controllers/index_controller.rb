#encoding=utf-8
class IndexController < ApplicationController
  def index
    if user_signed_in?
      #如果用户登录,直接跳转到用户空间页面
      redirect_to user_path(current_user.login_name)
    end
  end
end
