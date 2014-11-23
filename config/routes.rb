Rails.application.routes.draw do
    get 'frontend/index'

    get 'frontend/show_post/:id', to: 'frontend#show_post', as: 'frontend_show_post'

    get 'frontend/add_comment/:post_id', to: 'frontend#add_comment', as: 'frontend_add_comment'

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
