Rails.application.routes.draw do
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
