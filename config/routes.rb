Rails.application.routes.draw do
  namespace :v1 do
    # 查看版本路由
    get 'monitors/version'
    get 'monitors/canLogin'
    get 'monitors/needLogin'
    get 'monitors/canLogin'
    resources :users, except: [:destroy]
    resources :sessions, only: [:create, :destroy]
    resources :ads, except: [:show]
  end

  namespace :v2 do
    get 'monitors/version'
  end

  # 钉钉通知路由
  post 'notices/notices'
end
