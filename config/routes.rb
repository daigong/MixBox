MixBox::Application.routes.draw do

  root :to => "index#index"

  match '/test_vim'=>'index#test_vim'

  devise_for :users, :path => "account", :controllers => {
      :registrations => :account,
      #:sessions => :sessions,
  }

  #用户空间
  resources :users, :path => "" do

  end

  resources :stories, :path => "/:login_name/" do

  end

end
