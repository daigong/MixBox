class AccountController < Devise::RegistrationsController

  def create
    build_resource
    #自定义字段赋值 begin
    resource.login_name=params[resource_name][:login_name]
    resource.nick_name=params[resource_name][:nick_name]
    #end
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def edit
    @user = current_user
  end
end
