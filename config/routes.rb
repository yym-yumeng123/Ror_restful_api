Rails.application.routes.draw do
  namespace :v1 do
    # 查看版本路由
    get 'monitors/version'
    resources :users
  end

  namespace :v2 do
    get 'monitors/version'
  end

  # 钉钉通知路由
  post 'notices/notices'
end
