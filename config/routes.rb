Rails.application.routes.draw do

  devise_for :users
  resources :recipes

  mount Ckeditor::Engine => '/ckeditor'

  root 'recipes#index'

  namespace :api, defaults: {format: :json} do
    namespace :sns do
      resources :messages, only: :create
    end
  end

end
