Rails.application.routes.draw do
  namespace :v1 do
    # 查看版本路由
    get 'monitors/version'
    get 'monitors/canLogin'
    get 'monitors/needLogin'
    get 'monitors/canLogin'
    # 注册
    resources :users, except: [:destroy]
    # 登录
    resources :sessions, only: [:create, :destroy]
    # 广告
    resources :ads, except: [:show]
    # 歌单
    resources :sheets
    # 歌曲
    resources :songs
  end

  namespace :v2 do
    get 'monitors/version'
  end

  # 钉钉通知路由
  post 'notices/notices'
end
