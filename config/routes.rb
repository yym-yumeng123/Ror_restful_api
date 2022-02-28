Rails.application.routes.draw do
  # 查看版本路由
  get 'monitors/version'
  # 钉钉通知路由
  post 'notices/notices'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
