Rails.application.routes.draw do
    get 'index', to: 'frontend#index'

    get 'show_post/:id', to: 'frontend#show_post', as: 'frontend_show_post'
    post 'show_post/:id', to: 'frontend#show_post', as: 'frontend_show_post_add'

    devise_for :users
    devise_for :admins

    root 'frontend#index'

    get 'admin', :to => 'posts#index'
    scope :path => 'admin' do
        resources :tags
        resources :categories
        resources :comments
        resources :posts
    end

end
